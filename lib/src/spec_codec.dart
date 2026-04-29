import 'dart:typed_data';
import 'spec_reader.dart';
import 'json_reader.dart';
import 'json_writer.dart';
import 'msgpack_reader.dart';
import 'msgpack_writer.dart';

class SpecCodec<T> {
  final Uint8List Function(T) encodeJson;
  final Uint8List Function(T) encodeMsgPack;
  final T Function(SpecReader) decode;

  const SpecCodec({
    required this.encodeJson,
    required this.encodeMsgPack,
    required this.decode,
  });
}

T dispatch<T>(SpecCodec<T> codec, Uint8List body, String contentType) {
  if (contentType.contains('msgpack')) {
    return codec.decode(MsgPackReader(body));
  }
  return codec.decode(JsonReader(body));
}

Uint8List respond<T>(SpecCodec<T> codec, T obj, String accept) {
  if (accept.contains('msgpack')) {
    return codec.encodeMsgPack(obj);
  }
  return codec.encodeJson(obj);
}
