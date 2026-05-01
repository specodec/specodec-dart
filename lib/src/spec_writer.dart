import 'dart:typed_data';

abstract class SpecWriter {
  void writeString(String value);
  void writeBool(bool value);
  void writeInt32(int value);
  void writeInt64(BigInt value);
  void writeUint32(int value);
  void writeUint64(BigInt value);
  void writeFloat32(double value);
  void writeFloat64(double value);
  void writeNull();
  void writeBytes(Uint8List value);
  void writeEnum(String value);
  void beginObject(int fieldCount);
  void writeField(String name);
  void endObject();
  void beginArray(int elementCount);
  void nextElement();
  void endArray();
  Uint8List toBytes();
}
