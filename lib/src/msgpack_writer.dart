import 'spec_writer.dart';
import 'dart:typed_data';
import 'dart:convert';

class MsgPackWriter implements SpecWriter {
  final List<int> _buf = [];

  void _writeByte(int b) { _buf.add(b & 0xFF); }
  void _writeU16(int v) { _buf.add((v >> 8) & 0xFF); _buf.add(v & 0xFF); }
  void _writeU32(int v) { _buf.add((v >> 24) & 0xFF); _buf.add((v >> 16) & 0xFF); _buf.add((v >> 8) & 0xFF); _buf.add(v & 0xFF); }
  void _writeU64(int v) { _writeU32((v >> 32) & 0xFFFFFFFF); _writeU32(v & 0xFFFFFFFF); }

  void writeString(String value) {
    final bytes = utf8.encode(value);
    final len = bytes.length;
    if (len <= 0x1F) { _writeByte(0xA0 | len); }
    else if (len <= 0xFF) { _writeByte(0xD9); _writeByte(len); }
    else if (len <= 0xFFFF) { _writeByte(0xDA); _writeU16(len); }
    else { _writeByte(0xDB); _writeU32(len); }
    _buf.addAll(bytes);
  }

  void writeBool(bool value) { _writeByte(value ? 0xC3 : 0xC2); }

  void writeInt32(int value) {
    if (value >= 0 && value <= 0x7F) { _writeByte(value); }
    else if (value < 0 && value >= -0x20) { _writeByte(value & 0xFF); }
    else if (value >= 0 && value <= 0xFF) { _writeByte(0xCC); _writeByte(value); }
    else if (value >= 0 && value <= 0xFFFF) { _writeByte(0xCD); _writeU16(value); }
    else if (value >= 0) { _writeByte(0xCE); _writeU32(value); }
    else if (value >= -0x80) { _writeByte(0xD0); _writeByte(value & 0xFF); }
    else if (value >= -0x8000) { _writeByte(0xD1); _writeU16(value & 0xFFFF); }
    else { _writeByte(0xD2); _writeU32(value & 0xFFFFFFFF); }
  }

  void _writeU64BigInt(BigInt v) {
    for (var i = 7; i >= 0; i--) {
      _writeByte((v >> (i * 8)).toUnsigned(8).toInt());
    }
  }

  void writeInt64(BigInt value) {
    if (value >= BigInt.zero && value <= BigInt.from(0x7F)) { _writeByte(value.toInt()); }
    else if (value < BigInt.zero && value >= BigInt.from(-0x20)) { _writeByte(value.toInt() & 0xFF); }
    else if (value >= BigInt.zero && value <= BigInt.from(0xFF)) { _writeByte(0xCC); _writeByte(value.toInt()); }
    else if (value >= BigInt.zero && value <= BigInt.from(0xFFFF)) { _writeByte(0xCD); _writeU16(value.toInt()); }
    else if (value >= BigInt.zero && value <= BigInt.from(0xFFFFFFFF)) { _writeByte(0xCE); _writeU32(value.toInt()); }
    else if (value >= BigInt.zero) { _writeByte(0xCF); _writeU64BigInt(value); }
    else if (value >= BigInt.from(-0x80)) { _writeByte(0xD0); _writeByte(value.toInt() & 0xFF); }
    else if (value >= BigInt.from(-0x8000)) { _writeByte(0xD1); _writeU16(value.toInt() & 0xFFFF); }
    else if (value >= BigInt.from(-0x80000000)) { _writeByte(0xD2); _writeU32(value.toInt() & 0xFFFFFFFF); }
    else { _writeByte(0xD3); _writeU64BigInt(value >= BigInt.zero ? value : value + BigInt.parse('18446744073709551616')); }
  }

  void writeUint32(int value) {
    if (value <= 0x7F) { _writeByte(value); }
    else if (value <= 0xFF) { _writeByte(0xCC); _writeByte(value); }
    else if (value <= 0xFFFF) { _writeByte(0xCD); _writeU16(value); }
    else { _writeByte(0xCE); _writeU32(value); }
  }

  void writeUint64(BigInt value) {
    if (value >= BigInt.zero && value <= BigInt.from(0x7F)) { _writeByte(value.toInt()); }
    else if (value >= BigInt.zero && value <= BigInt.from(0xFF)) { _writeByte(0xCC); _writeByte(value.toInt()); }
    else if (value >= BigInt.zero && value <= BigInt.from(0xFFFF)) { _writeByte(0xCD); _writeU16(value.toInt()); }
    else if (value >= BigInt.zero && value <= BigInt.from(0xFFFFFFFF)) { _writeByte(0xCE); _writeU32(value.toInt()); }
    else { _writeByte(0xCF); _writeU64BigInt(value); }
  }

  void writeFloat32(double value) {
    _writeByte(0xCA);
    final data = ByteData(4);
    data.setFloat32(0, value, Endian.big);
    for (var i = 0; i < 4; i++) _buf.add(data.getUint8(i));
  }

  void writeFloat64(double value) {
    _writeByte(0xCB);
    final data = ByteData(8);
    data.setFloat64(0, value, Endian.big);
    for (var i = 0; i < 8; i++) _buf.add(data.getUint8(i));
  }

  void writeNull() { _writeByte(0xC0); }

  void writeBytes(Uint8List value) {
    final len = value.length;
    if (len <= 0xFF) { _writeByte(0xC4); _writeByte(len); }
    else if (len <= 0xFFFF) { _writeByte(0xC5); _writeU16(len); }
    else { _writeByte(0xC6); _writeU32(len); }
    _buf.addAll(value);
  }

  void beginObject(int fieldCount) {
    if (fieldCount <= 0x0F) { _writeByte(0x80 | fieldCount); }
    else if (fieldCount <= 0xFFFF) { _writeByte(0xDE); _writeU16(fieldCount); }
    else { _writeByte(0xDF); _writeU32(fieldCount); }
  }

  void writeField(String name) { writeString(name); }
  void writeEnum(String value) { writeString(value); }
  void endObject() {}

  void beginArray(int elementCount) {
    if (elementCount <= 0x0F) { _writeByte(0x90 | elementCount); }
    else if (elementCount <= 0xFFFF) { _writeByte(0xDC); _writeU16(elementCount); }
    else { _writeByte(0xDD); _writeU32(elementCount); }
  }

  void nextElement() {}
  void endArray() {}

  Uint8List toBytes() => Uint8List.fromList(_buf);
}
