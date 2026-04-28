import 'dart:typed_data';

class GronReader {
  GronReader(Uint8List data);
  String readString() => throw StateError('GronReader not implemented');
  bool readBool() => throw StateError('GronReader not implemented');
  int readInt32() => throw StateError('GronReader not implemented');
  int readInt64() => throw StateError('GronReader not implemented');
  int readUint32() => throw StateError('GronReader not implemented');
  int readUint64() => throw StateError('GronReader not implemented');
  double readFloat32() => throw StateError('GronReader not implemented');
  double readFloat64() => throw StateError('GronReader not implemented');
  void readNull() => throw StateError('GronReader not implemented');
}
