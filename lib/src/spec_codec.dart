import 'dart:typed_data';
import 'spec_reader.dart';
import 'spec_writer.dart';
import 'json_reader.dart';
import 'json_writer.dart';
import 'msgpack_reader.dart';
import 'msgpack_writer.dart';
import 'gron_reader.dart';
import 'gron_writer.dart';

class SpecCodec<T> {
  final void Function(SpecWriter, T) encode;
  final T Function(SpecReader) decode;

  const SpecCodec({required this.encode, required this.decode});
}

// ---------------------------------------------------------------------------
// FormatEntry
// ---------------------------------------------------------------------------
class FormatEntry {
  final String contentType;
  final SpecWriter Function() newWriter;
  final SpecReader Function(Uint8List) newReader;
  const FormatEntry({required this.contentType, required this.newWriter, required this.newReader});
}

// ---------------------------------------------------------------------------
// FormatRegistry
// ---------------------------------------------------------------------------
class FormatRegistry {
  final List<FormatEntry> _entries = [];

  FormatRegistry register(FormatEntry entry) {
    _entries.add(entry);
    return this;
  }

  FormatEntry match(String contentType) {
    for (final e in _entries) {
      final sub = e.contentType.contains('/') ? e.contentType.split('/')[1] : e.contentType;
      if (contentType.contains(sub)) return e;
    }
    return _entries.first;
  }
}

// ---------------------------------------------------------------------------
// Default registry
// ---------------------------------------------------------------------------
final defaultRegistry = FormatRegistry()
  ..register(FormatEntry(contentType: 'application/json',    newWriter: JsonWriter.new,    newReader: JsonReader.new))
  ..register(FormatEntry(contentType: 'application/msgpack', newWriter: MsgPackWriter.new, newReader: MsgPackReader.new))
  ..register(FormatEntry(contentType: 'application/gron',    newWriter: GronWriter.new,    newReader: (b) => GronReader(b)));

// ---------------------------------------------------------------------------
// dispatch / respond
// ---------------------------------------------------------------------------
T dispatch<T>(SpecCodec<T> codec, Uint8List body, String contentType, [FormatRegistry? registry]) {
  final reg = registry ?? defaultRegistry;
  final fmt = reg.match(contentType);
  return codec.decode(fmt.newReader(body));
}

class RespondResult {
  final Uint8List body;
  final String contentType;
  const RespondResult({required this.body, required this.contentType});
}

RespondResult respond<T>(SpecCodec<T> codec, T obj, String accept, [FormatRegistry? registry]) {
  final reg = registry ?? defaultRegistry;
  final fmt = reg.match(accept);
  final w = fmt.newWriter();
  codec.encode(w, obj);
  return RespondResult(body: w.toBytes(), contentType: fmt.contentType);
}
