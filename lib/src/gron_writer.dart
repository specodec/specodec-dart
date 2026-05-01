import 'dart:typed_data';
import 'spec_writer.dart';
import 'float_fmt.dart';

class GronWriter implements SpecWriter {
  final List<String> _lines = [];
  final List<String> _segments = ["json"];
  final List<_NestInfo> _nesting = [];

  String _buildPath() {
    var r = _segments[0];
    for (var i = 1; i < _segments.length; i++) {
      if (_segments[i].startsWith("[")) {
        r += _segments[i];
      } else {
        r += ".${_segments[i]}";
      }
    }
    return r;
  }

  String _escape(String s) {
    final sb = StringBuffer();
    for (var i = 0; i < s.length; i++) {
      final c = s.codeUnitAt(i);
      if (c == 0x22) sb.write('\\"');
      else if (c == 0x5C) sb.write("\\\\");
      else if (c == 0x08) sb.write("\\b");
      else if (c == 0x0C) sb.write("\\f");
      else if (c == 0x0A) sb.write("\\n");
      else if (c == 0x0D) sb.write("\\r");
      else if (c == 0x09) sb.write("\\t");
      else if (c < 0x20) sb.write("\\u${c.toRadixString(16).padLeft(4, '0')}");
      else sb.write(s[i]);
    }
    return sb.toString();
  }

  String _b64(List<int> buf) {
    const chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
    final sb = StringBuffer();
    for (var i = 0; i < buf.length; i += 3) {
      final b0 = buf[i] & 0xFF;
      final b1 = i + 1 < buf.length ? buf[i + 1] & 0xFF : 0;
      final b2 = i + 2 < buf.length ? buf[i + 2] & 0xFF : 0;
      sb.write(chars[b0 >> 2]);
      sb.write(chars[((b0 & 3) << 4) | (b1 >> 4)]);
      sb.write(i + 1 < buf.length ? chars[((b1 & 0xF) << 2) | (b2 >> 6)] : '=');
      sb.write(i + 2 < buf.length ? chars[b2 & 0x3F] : '=');
    }
    return sb.toString();
  }

  void _emit(String raw) {
    _lines.add('${_buildPath()} = $raw;');
  }

  void writeString(String value) => _emit('"${_escape(value)}"');
  void writeBool(bool value) => _emit(value ? "true" : "false");
  void writeInt32(int value) => _emit('$value');
  void writeInt64(BigInt value) => _emit('"$value"');
  void writeUint32(int value) => _emit('$value');
  void writeUint64(BigInt value) => _emit('"$value"');

  void writeFloat32(double value) {
    if (value.isNaN || value.isInfinite) throw StateError("NaN/Infinity");
    _emit(fmtFloat32(value));
  }

  void writeFloat64(double value) {
    if (value.isNaN || value.isInfinite) throw StateError("NaN/Infinity");
    if (value == 0.0 && value.isNegative) { _emit("-0"); return; }
    final s = value.toString();
    _emit(s.contains('.') && !s.contains('E') && !s.contains('e')
        ? s.replaceAll(RegExp(r'\.?0+$'), '') : s);
  }

  void writeNull() => _emit("null");
  void writeBytes(List<int> value) => _emit('"${_b64(value)}"');

  void beginObject(int fieldCount) {
    _lines.add('${_buildPath()} = {};');
    _nesting.add(_NestInfo(_segments.length));
  }

  void writeField(String name) {
    final top = _nesting.last;
    if (_segments.length > top.depth) {
      _segments[_segments.length - 1] = name;
    } else {
      _segments.add(name);
    }
  }

  void endObject() {
    final info = _nesting.removeLast();
    while (_segments.length > info.depth) _segments.removeLast();
  }

  void beginArray(int elementCount) {
    _lines.add('${_buildPath()} = [];');
    _nesting.add(_NestInfo(_segments.length, arrayIndex: -1));
  }

  void nextElement() {
    final info = _nesting.last;
    info.arrayIndex++;
    final seg = '[${info.arrayIndex}]';
    if (_segments.length > info.depth) {
      _segments[_segments.length - 1] = seg;
    } else {
      _segments.add(seg);
    }
  }

  void endArray() {
    final info = _nesting.removeLast();
    while (_segments.length > info.depth) _segments.removeLast();
  }

  void writeEnum(String value) { _emit('"${_escape(value)}"'); }

  Uint8List toBytes() => Uint8List.fromList('${_lines.join('\n')}\n'.codeUnits);
}

class _NestInfo {
  final int depth;
  int arrayIndex;
  _NestInfo(this.depth, {this.arrayIndex = -1});
}
