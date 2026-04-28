import 'dart:convert';
import 'dart:typed_data';

class SCodecError implements Exception {
  final String code;
  final String message;
  SCodecError(this.code, this.message);
  @override String toString() => 'SCodecError($code): $message';
}

class JsonReader {
  final String _src;
  int _pos = 0;

  JsonReader(Uint8List data) : _src = utf8.decode(data);

  int get pos => _pos;

  void _ws() {
    while (_pos < _src.length) {
      final c = _src.codeUnitAt(_pos);
      if (c == 0x20 || c == 0x09 || c == 0x0A || c == 0x0D) {
        _pos++;
      } else {
        break;
      }
    }
  }

  String _peek() {
    _ws();
    if (_pos >= _src.length) throw SCodecError('internal', 'json: unexpected end of input');
    return _src[_pos];
  }

  String _read() {
    _ws();
    if (_pos >= _src.length) throw SCodecError('internal', 'json: unexpected end of input');
    return _src[_pos++];
  }

  void _expect(String ch) {
    final got = _read();
    if (got != ch) throw SCodecError('internal', "json: expected '$ch', got '$got' at ${_pos - 1}");
  }

  String _parseString() {
    _expect('"');
    final buf = StringBuffer();
    while (_pos < _src.length) {
      final c = _src.codeUnitAt(_pos);
      if (c == 0x22) { _pos++; return buf.toString(); }
      if (c == 0x5C) {
        _pos++;
        if (_pos >= _src.length) throw SCodecError('internal', 'json: unexpected end of string escape');
        final esc = _src.codeUnitAt(_pos);
        switch (esc) {
          case 0x22: buf.write('"'); _pos++; break;
          case 0x5C: buf.write('\\'); _pos++; break;
          case 0x2F: buf.write('/'); _pos++; break;
          case 0x62: buf.write('\b'); _pos++; break;
          case 0x66: buf.write('\f'); _pos++; break;
          case 0x6E: buf.write('\n'); _pos++; break;
          case 0x72: buf.write('\r'); _pos++; break;
          case 0x74: buf.write('\t'); _pos++; break;
          case 0x75:
            _pos++;
            if (_pos + 4 > _src.length) throw SCodecError('internal', 'json: incomplete unicode escape');
            final hex = _src.substring(_pos, _pos + 4);
            var cp = int.parse(hex, radix: 16);
            _pos += 4;
            if (cp >= 0xD800 && cp <= 0xDBFF) {
              if (_pos + 6 <= _src.length && _src[_pos] == '\\' && _src[_pos + 1] == 'u') {
                _pos += 2;
                final hex2 = _src.substring(_pos, _pos + 4);
                final low = int.parse(hex2, radix: 16);
                _pos += 4;
                if (low >= 0xDC00 && low <= 0xDFFF) {
                  cp = 0x10000 + (cp - 0xD800) * 0x400 + (low - 0xDC00);
                } else {
                  throw SCodecError('internal', 'json: expected low surrogate');
                }
              } else {
                throw SCodecError('internal', 'json: expected low surrogate');
              }
            }
            buf.writeCharCode(cp);
            break;
          default:
            throw SCodecError('internal', 'json: invalid escape character');
        }
      } else if (c < 0x20) {
        throw SCodecError('internal', 'json: unescaped control character');
      } else {
        buf.writeCharCode(c); _pos++;
      }
    }
    throw SCodecError('internal', 'json: unterminated string');
  }

  String _parseNumberRaw() {
    final start = _pos;
    if (_pos < _src.length && _src[_pos] == '-') _pos++;
    if (_pos >= _src.length) throw SCodecError('internal', 'json: unexpected end of number');
    if (_src[_pos] == '0') {
      _pos++;
    } else if (_src.codeUnitAt(_pos) >= 0x31 && _src.codeUnitAt(_pos) <= 0x39) {
      _pos++;
      while (_pos < _src.length && _src.codeUnitAt(_pos) >= 0x30 && _src.codeUnitAt(_pos) <= 0x39) _pos++;
    } else {
      throw SCodecError('internal', 'json: invalid number');
    }
    if (_pos < _src.length && _src[_pos] == '.') {
      _pos++;
      if (_pos >= _src.length || _src.codeUnitAt(_pos) < 0x30 || _src.codeUnitAt(_pos) > 0x39) {
        throw SCodecError('internal', 'json: invalid number fraction');
      }
      while (_pos < _src.length && _src.codeUnitAt(_pos) >= 0x30 && _src.codeUnitAt(_pos) <= 0x39) _pos++;
    }
    if (_pos < _src.length && (_src[_pos] == 'e' || _src[_pos] == 'E')) {
      _pos++;
      if (_pos < _src.length && (_src[_pos] == '+' || _src[_pos] == '-')) _pos++;
      if (_pos >= _src.length || _src.codeUnitAt(_pos) < 0x30 || _src.codeUnitAt(_pos) > 0x39) {
        throw SCodecError('internal', 'json: invalid number exponent');
      }
      while (_pos < _src.length && _src.codeUnitAt(_pos) >= 0x30 && _src.codeUnitAt(_pos) <= 0x39) _pos++;
    }
    return _src.substring(start, _pos);
  }

  String readString() => _parseString();

  bool readBool() {
    final ch = _peek();
    if (ch == 't') { for (final c in 'true'.split('')) { if (_read() != c) throw SCodecError('internal', "json: expected 'true'"); } return true; }
    if (ch == 'f') { for (final c in 'false'.split('')) { if (_read() != c) throw SCodecError('internal', "json: expected 'false'"); } return false; }
    throw SCodecError('internal', "json: expected bool, got '$ch'");
  }

  int readInt32() {
    final raw = _parseNumberRaw();
    final v = int.tryParse(raw);
    if (v == null || v < -2147483648 || v > 2147483647) throw SCodecError('internal', 'json: invalid int32: $raw');
    return v;
  }

  int readInt64() {
    if (_peek() == '"') {
      final s = _parseString();
      return int.tryParse(s) ?? (throw SCodecError('internal', 'json: invalid int64: $s'));
    }
    final raw = _parseNumberRaw();
    return int.tryParse(raw) ?? (throw SCodecError('internal', 'json: invalid int64: $raw'));
  }

  int readUint32() {
    final raw = _parseNumberRaw();
    final v = int.tryParse(raw);
    if (v == null || v < 0 || v > 4294967295) throw SCodecError('internal', 'json: invalid uint32: $raw');
    return v;
  }

  int readUint64() {
    if (_peek() == '"') {
      final s = _parseString();
      return int.tryParse(s) ?? (throw SCodecError('internal', 'json: invalid uint64: $s'));
    }
    final raw = _parseNumberRaw();
    return int.tryParse(raw) ?? (throw SCodecError('internal', 'json: invalid uint64: $raw'));
  }

  double readFloat32() {
    final raw = _parseNumberRaw();
    return double.tryParse(raw) ?? (throw SCodecError('internal', 'json: invalid float32: $raw'));
  }

  double readFloat64() {
    final raw = _parseNumberRaw();
    return double.tryParse(raw) ?? (throw SCodecError('internal', 'json: invalid float64: $raw'));
  }

  void readNull() {
    for (final c in 'null'.split('')) { if (_read() != c) throw SCodecError('internal', "json: expected 'null'"); }
  }

  Uint8List readBytes() {
    final s = _parseString();
    return base64.decode(s);
  }

  String readEnum() => _parseString();

  void beginObject() => _expect('{');

  bool hasNextField() => _peek() != '}';

  String readFieldName() => _parseString();

  void nextFieldSeparator() {
    final ch = _peek();
    if (ch == ',') _pos++;
    else if (ch != '}') throw SCodecError('internal', "json: expected ',' or '}'");
  }

  void endObject() => _expect('}');

  void beginArray() => _expect('[');

  bool hasNextElement() => _peek() != ']';

  void nextElementSeparator() {
    final ch = _peek();
    if (ch == ',') _pos++;
    else if (ch != ']') throw SCodecError('internal', "json: expected ',' or ']'");
  }

  void endArray() => _expect(']');

  bool isNull() => _peek() == 'n';

  void skip() {
    _ws();
    if (_pos >= _src.length) throw SCodecError('internal', 'json: unexpected end of input');
    final ch = _src[_pos];
    switch (ch) {
      case '"':
        _pos++;
        while (_pos < _src.length) {
          if (_src.codeUnitAt(_pos) == 0x5C) _pos += 2;
          else if (_src.codeUnitAt(_pos) == 0x22) { _pos++; return; }
          else _pos++;
        }
        throw SCodecError('internal', 'json: unterminated string in skip');
      case '{':
        beginObject();
        var first = true;
        while (hasNextField()) {
          if (!first) nextFieldSeparator();
          first = false;
          readFieldName();
          _expect(':');
          skip();
        }
        endObject();
      case '[':
        beginArray();
        var first = true;
        while (hasNextElement()) {
          if (!first) nextElementSeparator();
          first = false;
          skip();
        }
        endArray();
      case 't': for (final c in 'true'.split('')) { if (_read() != c) throw SCodecError('internal', 'json: skip expected true'); }
      case 'f': for (final c in 'false'.split('')) { if (_read() != c) throw SCodecError('internal', 'json: skip expected false'); }
      case 'n': for (final c in 'null'.split('')) { if (_read() != c) throw SCodecError('internal', 'json: skip expected null'); }
      default:
        if ((ch.codeUnitAt(0) >= 0x30 && ch.codeUnitAt(0) <= 0x39) || ch == '-') _parseNumberRaw();
        else throw SCodecError('internal', "json: unexpected '$ch' in skip");
    }
  }
}
