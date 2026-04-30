import 'dart:typed_data';
import 'dart:convert';
import 'scodec_error.dart';
import 'spec_reader.dart';

class MsgPackReader implements SpecReader {
  final Uint8List _buf;
  int _pos = 0;
  List<int> _containerCount = [];

  MsgPackReader(this._buf);

  int get pos => _pos;

  int _readByte() {
    if (_pos >= _buf.length) {
      throw SCodecError('internal', 'msgpack: unexpected end of data');
    }
    return _buf[_pos++];
  }

  int _readU16() {
    final v = (_buf[_pos] << 8) | _buf[_pos + 1];
    _pos += 2;
    return v;
  }

  int _readU32() {
    final v = (_buf[_pos] << 24) | (_buf[_pos + 1] << 16) | (_buf[_pos + 2] << 8) | _buf[_pos + 3];
    _pos += 4;
    return v;
  }

  int _readI16() {
    final v = _readU16();
    return v > 0x7FFF ? v - 0x10000 : v;
  }

  int _readI32() {
    final v = _readU32();
    return v > 0x7FFFFFFF ? v - 0x100000000 : v;
  }

  double _readF32() {
    final data = ByteData.sublistView(_buf, _pos, _pos + 4);
    _pos += 4;
    return data.getFloat32(0, Endian.big);
  }

  double _readF64() {
    final data = ByteData.sublistView(_buf, _pos, _pos + 8);
    _pos += 8;
    return data.getFloat64(0, Endian.big);
  }

  int readMapHeader() {
    final b = _readByte();
    if ((b & 0xF0) == 0x80) return b & 0x0F;
    if (b == 0xDE) return _readU16();
    if (b == 0xDF) return _readU32();
    throw SCodecError('internal', 'msgpack: expected map, got 0x${b.toRadixString(16)}');
  }

  int readArrayHeader() {
    final b = _readByte();
    if ((b & 0xF0) == 0x90) return b & 0x0F;
    if (b == 0xDC) return _readU16();
    if (b == 0xDD) return _readU32();
    throw SCodecError('internal', 'msgpack: expected array, got 0x${b.toRadixString(16)}');
  }

  @override
  String readString() {
    final b = _readByte();
    int len;
    if ((b & 0xE0) == 0xA0) {
      len = b & 0x1F;
    } else if (b == 0xD9) {
      len = _readByte();
    } else if (b == 0xDA) {
      len = _readU16();
    } else if (b == 0xDB) {
      len = _readU32();
    } else {
      throw SCodecError('internal', 'msgpack: expected string, got 0x${b.toRadixString(16)}');
    }
    final s = utf8.decode(_buf.buffer.asUint8List(_pos, len));
    _pos += len;
    return s;
  }

  BigInt _readU64() {
    final bytes = Uint8List.fromList(_buf.sublist(_pos, _pos + 8));
    _pos += 8;
    var result = BigInt.zero;
    for (var i = 0; i < 8; i++) {
      result = (result << 8) | BigInt.from(bytes[i]);
    }
    return result;
  }

  BigInt _readI64() {
    final u64 = _readU64();
    if (u64 >= BigInt.parse('9223372036854775808')) {
      return u64 - BigInt.parse('18446744073709551616');
    }
    return u64;
  }

  int readInt() {
    final b = _readByte();
    if (b <= 0x7F) return b;
    if (b >= 0xE0) return b - 0x100;
    if (b == 0xCC) return _readByte();
    if (b == 0xCD) return _readU16();
    if (b == 0xCE) return _readU32();
    if (b == 0xD0) return _readByte().toSigned(8);
    if (b == 0xD1) return _readI16();
    if (b == 0xD2) return _readI32();
    throw SCodecError('internal', 'msgpack: expected int (32-bit), got 0x${b.toRadixString(16)}');
  }

  double readFloat() {
    final b = _readByte();
    if (b == 0xCA) return _readF32();
    if (b == 0xCB) return _readF64();
    if (b <= 0x7F) return b.toDouble();
    if (b >= 0xE0) return (b - 0x100).toDouble();
    if (b == 0xCC) return _readByte().toDouble();
    if (b == 0xCD) return _readU16().toDouble();
    if (b == 0xCE) return _readU32().toDouble();
    if (b == 0xD0) return _readByte().toSigned(8).toDouble();
    if (b == 0xD1) return _readI16().toDouble();
    if (b == 0xD2) return _readI32().toDouble();
    throw SCodecError('internal', 'msgpack: expected float, got 0x${b.toRadixString(16)}');
  }

  @override
  bool readBool() {
    final b = _readByte();
    if (b == 0xC3) return true;
    if (b == 0xC2) return false;
    throw SCodecError('internal', 'msgpack: expected bool, got 0x${b.toRadixString(16)}');
  }

  @override
  void readNull() {
    final b = _readByte();
    if (b != 0xC0) {
      throw SCodecError('internal', 'msgpack: expected null, got 0x${b.toRadixString(16)}');
    }
  }

  @override
  bool isNull() {
    if (_pos >= _buf.length) return false;
    return _buf[_pos] == 0xC0;
  }

  @override
  void skip() {
    final b = _readByte();
    if (b <= 0x7F || b >= 0xE0) return;
    if ((b & 0xF0) == 0x80) {
      final n = b & 0x0F;
      for (var i = 0; i < n; i++) { skip(); skip(); }
      return;
    }
    if ((b & 0xF0) == 0x90) {
      final n = b & 0x0F;
      for (var i = 0; i < n; i++) { skip(); }
      return;
    }
    if ((b & 0xE0) == 0xA0) { _pos += b & 0x1F; return; }
    switch (b) {
      case 0xC0: case 0xC2: case 0xC3: return;
      case 0xCC: case 0xD0: _pos += 1; return;
      case 0xCD: case 0xD1: _pos += 2; return;
      case 0xCE: case 0xD2: case 0xCA: _pos += 4; return;
      case 0xCF: case 0xD3: case 0xCB: _pos += 8; return;
      case 0xD9: _pos += _readByte(); return;
      case 0xDA: _pos += _readU16(); return;
      case 0xDB: _pos += _readU32(); return;
      case 0xC4: _pos += _readByte(); return;
      case 0xC5: _pos += _readU16(); return;
      case 0xC6: _pos += _readU32(); return;
      case 0xD4: _pos += 2; return;
      case 0xD5: _pos += 3; return;
      case 0xD6: _pos += 5; return;
      case 0xD7: _pos += 9; return;
      case 0xD8: _pos += 17; return;
      case 0xC7: _pos += 1 + _readByte(); return;
      case 0xC8: _pos += 1 + _readU16(); return;
      case 0xC9: _pos += 1 + _readU32(); return;
      case 0xDC:
        final n = _readU16();
        for (var i = 0; i < n; i++) { skip(); }
        return;
      case 0xDD:
        final n = _readU32();
        for (var i = 0; i < n; i++) { skip(); }
        return;
      case 0xDE:
        final n = _readU16();
        for (var i = 0; i < n; i++) { skip(); skip(); }
        return;
      case 0xDF:
        final n = _readU32();
        for (var i = 0; i < n; i++) { skip(); skip(); }
        return;
      default:
        throw SCodecError('internal', 'msgpack: unknown format 0x${b.toRadixString(16)}');
    }
  }

  @override
  void beginObject() {
    final n = readMapHeader();
    _containerCount.add(n);
  }

  @override
  bool hasNextField() {
    final top = _containerCount.length - 1;
    if (_containerCount[top] > 0) {
      _containerCount[top]--;
      return true;
    }
    _containerCount.removeLast();
    return false;
  }

  @override
  String readFieldName() => readString();

  @override
  void endObject() {}

  @override
  void beginArray() {
    final n = readArrayHeader();
    _containerCount.add(n);
  }

  @override
  bool hasNextElement() {
    final top = _containerCount.length - 1;
    if (_containerCount[top] > 0) {
      _containerCount[top]--;
      return true;
    }
    _containerCount.removeLast();
    return false;
  }

  @override
  void endArray() {}

  @override
  int readInt32() => readInt();

  @override
  BigInt readInt64() {
    final b = _readByte();
    if (b <= 0x7F) return BigInt.from(b);
    if (b >= 0xE0) return BigInt.from(b - 0x100);
    if (b == 0xCC) return BigInt.from(_readByte());
    if (b == 0xCD) return BigInt.from(_readU16());
    if (b == 0xCE) return BigInt.from(_readU32());
    if (b == 0xD0) return BigInt.from(_readByte().toSigned(8));
    if (b == 0xD1) return BigInt.from(_readI16());
    if (b == 0xD2) return BigInt.from(_readI32());
    if (b == 0xD3) return _readI64();
    throw SCodecError('internal', 'msgpack: expected int64, got 0x${b.toRadixString(16)}');
  }

  @override
  int readUint32() => readInt() & 0xFFFFFFFF;

  @override
  BigInt readUint64() {
    final b = _readByte();
    if (b <= 0x7F) return BigInt.from(b);
    if (b == 0xCC) return BigInt.from(_readByte());
    if (b == 0xCD) return BigInt.from(_readU16());
    if (b == 0xCE) return BigInt.from(_readU32());
    if (b == 0xCF) return _readU64();
    throw SCodecError('internal', 'msgpack: expected uint64, got 0x${b.toRadixString(16)}');
  }

  @override
  double readFloat32() => readFloat();

  @override
  double readFloat64() => readFloat();

  @override
  String readEnum() => readString();

  @override
  Uint8List readBytes() {
    final b = _readByte();
    int len;
    if (b == 0xC4) len = _readByte();
    else if (b == 0xC5) len = _readU16();
    else if (b == 0xC6) len = _readU32();
    else throw SCodecError('internal', 'msgpack: expected bin, got 0x${b.toRadixString(16)}');
    final v = _buf.buffer.asUint8List(_pos, len);
    _pos += len;
    return Uint8List.fromList(v);
  }
}
