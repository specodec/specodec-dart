import 'dart:typed_data';

abstract class SpecReader {
  void beginObject();
  bool hasNextField();
  String readFieldName();
  void endObject();
  void beginArray();
  bool hasNextElement();
  void endArray();
  String readString();
  bool readBool();
  int readInt32();
  BigInt readInt64();
  int readUint32();
  BigInt readUint64();
  double readFloat32();
  double readFloat64();
  void readNull();
  Uint8List readBytes();
  String readEnum();
  bool isNull();
  void skip();
}
