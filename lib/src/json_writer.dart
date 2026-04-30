import 'dart:convert';
import 'dart:typed_data';

class JsonWriter {
  final List<String> _parts = [];
  final List<bool> _firstItem = [];

  String _escape(String s) {
    final buf = StringBuffer();
    for (var i = 0; i < s.length; i++) {
      final c = s.codeUnitAt(i);
      switch (c) {
        case 0x22: buf.write('\\"'); break;
        case 0x5C: buf.write('\\\\'); break;
        case 0x08: buf.write('\\b'); break;
        case 0x0C: buf.write('\\f'); break;
        case 0x0A: buf.write('\\n'); break;
        case 0x0D: buf.write('\\r'); break;
        case 0x09: buf.write('\\t'); break;
        default:
          if (c < 0x20) {
            buf.write('\\u${c.toRadixString(16).padLeft(4, '0')}');
          } else {
            buf.writeCharCode(c);
          }
      }
    }
    return buf.toString();
  }

  String _b64(Uint8List buf) {
    return base64.encode(buf);
  }

  void writeString(String value) {
    _parts.add('"${_escape(value)}"');
  }

  void writeBool(bool value) {
    _parts.add(value ? 'true' : 'false');
  }

  void writeInt32(int value) {
    _parts.add('$value');
  }

  void writeInt64(int value) {
    _parts.add('"$value"');
  }

  void writeUint32(int value) {
    _parts.add('$value');
  }

  void writeUint64(int value) {
    if (value >= 0) {
      _parts.add('"$value"');
    } else {
      final hi = (value >> 32).toUnsigned(32);
      final lo = value.toUnsigned(32);
      _parts.add('"${BigInt.from(hi) * BigInt.from(4294967296) + BigInt.from(lo)}"');
    }
  }

  String _fmtFloat(double value) {
    var s = '$value';
    if (s.contains('.') && !s.contains('e', 0) && !s.contains('E', 0)) {
      s = s.replaceAll(RegExp(r'0+$'), '');
      s = s.replaceAll(RegExp(r'\.$'), '');
    }
    return s;
  }

  void writeFloat32(double value) {
    if (value.isNaN || value.isInfinite) {
      throw ArgumentError('float32: NaN/Infinity not valid JSON');
    }
    _parts.add(_fmtFloat(value));
  }

  void writeFloat64(double value) {
    if (value.isNaN || value.isInfinite) {
      throw ArgumentError('float64: NaN/Infinity not valid JSON');
    }
    _parts.add(_fmtFloat(value));
  }

  void writeNull() {
    _parts.add('null');
  }

  void writeBytes(Uint8List value) {
    _parts.add('"${_b64(value)}"');
  }

  void writeEnum(String value) {
    _parts.add('"${_escape(value)}"');
  }

  void beginObject() {
    _parts.add('{');
    _firstItem.add(true);
  }

  void writeField(String name) {
    final top = _firstItem.length - 1;
    if (!_firstItem[top]) _parts.add(',');
    _firstItem[top] = false;
    _parts.add('"${_escape(name)}":');
  }

  void endObject() {
    _firstItem.removeLast();
    _parts.add('}');
  }

  void beginArray() {
    _parts.add('[');
    _firstItem.add(true);
  }

  void nextElement() {
    final top = _firstItem.length - 1;
    if (!_firstItem[top]) _parts.add(',');
    _firstItem[top] = false;
  }

  void endArray() {
    _firstItem.removeLast();
    _parts.add(']');
  }

  Uint8List toBytes() {
    return Uint8List.fromList(utf8.encode(_parts.join()));
  }
}
