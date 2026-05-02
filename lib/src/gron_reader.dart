import 'dart:convert';
import 'dart:typed_data';
import 'spec_reader.dart';

class GronReader implements SpecReader {
  final List<_Line> _lines = [];
  int _cursor = 0;
  final List<_Ctx> _ctx = [];

  GronReader(Uint8List data) {
    final text = String.fromCharCodes(data);
    for (final raw in text.split('\n')) {
      final line = raw.trim();
      if (line.isEmpty) continue;
      final eq = line.indexOf(' = ');
      if (eq < 0) continue;
      var val = line.substring(eq + 3);
      if (val.endsWith(';')) val = val.substring(0, val.length - 1);
      _lines.add(_Line(line.substring(0, eq), val));
    }
  }

  String _unescape(String s) {
    if (s.length < 2 || s[0] != '"' || s[s.length - 1] != '"') {
      throw StateError('gron: expected quoted string');
    }
    final sb = StringBuffer();
    var i = 1;
    while (i < s.length - 1) {
      if (s[i] == '\\' && i + 1 < s.length - 1) {
        i++;
        switch (s[i]) {
          case '"': sb.write('"'); break;
          case '\\': sb.write('\\'); break;
          case '/': sb.write('/'); break;
          case 'b': sb.write('\b'); break;
          case 'f': sb.write('\f'); break;
          case 'n': sb.write('\n'); break;
          case 'r': sb.write('\r'); break;
          case 't': sb.write('\t'); break;
          case 'u':
            sb.write(String.fromCharCode(int.parse(s.substring(i + 1, i + 5), radix: 16)));
            i += 4;
        }
      } else {
        sb.write(s[i]);
      }
      i++;
    }
    return sb.toString();
  }

  Uint8List _b64decode(String s) => base64.decode(s);

  String readString() { final v = _unescape(_lines[_cursor++].val); return v; }
  bool readBool() => _lines[_cursor++].val == "true";
  int readInt32() => int.parse(_lines[_cursor++].val);
  BigInt readInt64() => BigInt.parse(_unescape(_lines[_cursor++].val));
  int readUint32() => int.parse(_lines[_cursor++].val);
  BigInt readUint64() => BigInt.parse(_unescape(_lines[_cursor++].val));

  double readFloat32() {
    final v = _lines[_cursor++].val;
    final f = double.parse(v);
    final b = ByteData(4);
    b.setFloat32(0, f);
    return b.getFloat32(0);
  }

  double readFloat64() {
    final v = _lines[_cursor++].val;
    return double.parse(v);
  }

  void readNull() { _cursor++; }
  Uint8List readBytes() => _b64decode(_unescape(_lines[_cursor++].val));
  String readEnum() => _unescape(_lines[_cursor++].val);

  void beginObject() {
    final line = _lines[_cursor++];
    _ctx.add(_Ctx(line.path, "object"));
  }

  bool hasNextField() {
    if (_cursor >= _lines.length) return false;
    final pfx = "${_ctx.last.prefix}.";
    final p = _lines[_cursor].path;
    if (!p.startsWith(pfx)) return false;
    final rem = p.substring(pfx.length);
    return !rem.contains('.') && !rem.contains('[');
  }

  String readFieldName() {
    final pfx = "${_ctx.last.prefix}.";
    return _lines[_cursor].path.substring(pfx.length);
  }

  void endObject() { _ctx.removeLast(); }

  void beginArray() {
    final line = _lines[_cursor++];
    _ctx.add(_Ctx(line.path, "array", index: -1));
  }

  bool hasNextElement() {
    if (_cursor >= _lines.length) return false;
    final arr = _ctx.last;
    final ni = arr.index + 1;
    final exp = "${arr.prefix}[$ni]";
    final p = _lines[_cursor].path;
    return p == exp || p.startsWith("$exp.") || p.startsWith("$exp[");
  }

  void nextElement() { _ctx.last.index++; }
  void endArray() { _ctx.removeLast(); }

  bool isNull() => _cursor < _lines.length && _lines[_cursor].val == "null";

  void skip() {
    final sp = _lines[_cursor++].path;
    while (_cursor < _lines.length) {
      final np = _lines[_cursor].path;
      if (np.length > sp.length && (np.startsWith("$sp.") || np.startsWith("$sp["))) {
        _cursor++;
      } else {
        break;
      }
    }
  }
}

class _Line {
  final String path;
  final String val;
  _Line(this.path, this.val);
}

class _Ctx {
  final String prefix;
  final String type;
  int index;
  _Ctx(this.prefix, this.type, {this.index = -1});
}
