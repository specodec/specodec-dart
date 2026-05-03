import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import 'package:specodec/specodec.dart';

final vecDir = Directory(Platform.environment['VEC_DIR'] ?? '../vectors');
final outDir = Directory(Platform.environment['OUT_DIR'] ?? '../output_dart');

late final Map<String, ModelSchema> schema;

class FieldSchema {
  final String name, type;
  final bool optional, isArray, isModel;
  FieldSchema(this.name, this.type, {this.optional = false, this.isArray = false, this.isModel = false});
}

class ModelSchema {
  final List<FieldSchema> fields;
  final bool recursive;
  ModelSchema(this.fields, {this.recursive = false});
}

Map<String, ModelSchema> loadSchema() {
  final text = File('${vecDir.path}/typeschema.json').readAsStringSync();
  final raw = json.decode(text) as Map<String, dynamic>;
  final result = <String, ModelSchema>{};
  for (final entry in raw.entries) {
    final m = entry.value as Map<String, dynamic>;
    final fields = (m['fields'] as List).map((f) {
      final fm = f as Map<String, dynamic>;
      return FieldSchema(
        fm['name'] as String, fm['type'] as String,
        optional: fm['optional'] as bool? ?? false,
        isArray: fm['isArray'] as bool? ?? false,
        isModel: fm['isModel'] as bool? ?? false,
      );
    }).toList();
    result[entry.key] = ModelSchema(fields, recursive: m['recursive'] as bool? ?? false);
  }
  return result;
}

void main() {
  schema = loadSchema();
  outDir.createSync(recursive: true);
  Directory('${outDir.path}/scalars').createSync(recursive: true);

  final manifestText = File('${vecDir.path}/manifest.json').readAsStringSync();
  final manifest = json.decode(manifestText) as Map<String, dynamic>;
  final scalarsSpec = manifest['scalars'] as Map<String, dynamic>;
  final testModels = (manifest['testModels'] as List).cast<String>();

  final scalarResults = <String, bool>{};
  final objectResults = <String, Map<String, bool>>{};

  print('Dart: processing scalars...');
  for (final name in scalarsSpec.keys) {
    final spec = scalarsSpec[name] as Map<String, dynamic>;
    final stype = spec['type'] as String;
    final refBuf = File('${vecDir.path}/scalars/$name.mp').readAsBytesSync();
    final r = MsgPackReader(refBuf);
    final w = MsgPackWriter();
    try {
      switch (stype) {
        case 'int32': w.writeInt32(r.readInt32());
        case 'int64': w.writeInt64(r.readInt64());
        case 'uint32': w.writeUint32(r.readUint32());
        case 'uint64': w.writeUint64(r.readUint64());
        case 'float32': w.writeFloat32(r.readFloat32());
        case 'float64': w.writeFloat64(r.readFloat64());
        case 'string': w.writeString(r.readString());
        case 'bytes': w.writeBytes(r.readBytes());
        case 'bool': w.writeBool(r.readBool());
        default: throw Exception('unknown type: $stype');
      }
      File('${outDir.path}/scalars/$name.mp').writeAsBytesSync(w.toBytes());
      scalarResults[name] = true;
    } catch (e) {
      print('  FAIL $name: $e');
      scalarResults[name] = false;
    }
  }

  print('Dart: processing objects...');
  for (final name in testModels) {
    objectResults[name] = processObject(name);
  }

  writeResults(scalarResults, objectResults);
  final fail = scalarResults.values.where((v) => !v).length +
      objectResults.values.where((v) => !(v['mp'] ?? false) || !(v['json'] ?? false) || !(v['gron'] ?? false)).length;
  final pass = scalarResults.length + objectResults.length - fail;
  print('Dart done: $pass passed, $fail failed');
  if (fail > 0) exit(1);
}

// ═══════════════════════════════════
// Generic schema-driven decode/encode
// ═══════════════════════════════════

dynamic readScalarValue(SpecReader r, String typ) {
  switch (typ) {
    case 'string': return r.readString();
    case 'boolean': return r.readBool();
    case 'int8': case 'int16': case 'int32': return r.readInt32();
    case 'int64': return r.readInt64();
    case 'uint8': case 'uint16': case 'uint32': return r.readUint32();
    case 'uint64': return r.readUint64();
    case 'float32': return r.readFloat32();
    case 'float64': return r.readFloat64();
    case 'bytes': return r.readBytes();
    default: throw Exception('unknown scalar: $typ');
  }
}

void writeScalarMP(MsgPackWriter w, dynamic v, String typ) {
  switch (typ) {
    case 'string': w.writeString(v as String); break;
    case 'boolean': w.writeBool(v as bool); break;
    case 'int8': case 'int16': case 'int32': w.writeInt32(v as int); break;
    case 'int64': w.writeInt64(v as BigInt); break;
    case 'uint8': case 'uint16': case 'uint32': w.writeUint32(v as int); break;
    case 'uint64': w.writeUint64(v as BigInt); break;
    case 'float32': w.writeFloat32(v as double); break;
    case 'float64': w.writeFloat64(v as double); break;
    case 'bytes': w.writeBytes(v as Uint8List); break;
  }
}

void writeScalarJSON(JsonWriter w, dynamic v, String typ) {
  switch (typ) {
    case 'string': w.writeString(v as String); break;
    case 'boolean': w.writeBool(v as bool); break;
    case 'int8': case 'int16': case 'int32': w.writeInt32(v as int); break;
    case 'int64': w.writeInt64(v as BigInt); break;
    case 'uint8': case 'uint16': case 'uint32': w.writeUint32(v as int); break;
    case 'uint64': w.writeUint64(v as BigInt); break;
    case 'float32': w.writeFloat32(v as double); break;
    case 'float64': w.writeFloat64(v as double); break;
    case 'bytes': w.writeBytes(v as Uint8List); break;
  }
}

void writeScalarGRON(GronWriter w, dynamic v, String typ) {
  switch (typ) {
    case 'string': w.writeString(v as String); break;
    case 'boolean': w.writeBool(v as bool); break;
    case 'int8': case 'int16': case 'int32': w.writeInt32(v as int); break;
    case 'int64': w.writeInt64(v as BigInt); break;
    case 'uint8': case 'uint16': case 'uint32': w.writeUint32(v as int); break;
    case 'uint64': w.writeUint64(v as BigInt); break;
    case 'float32': w.writeFloat32(v as double); break;
    case 'float64': w.writeFloat64(v as double); break;
    case 'bytes': w.writeBytes(v as Uint8List); break;
  }
}

dynamic decodeField(SpecReader r, FieldSchema field) {
  if (field.isArray) {
    final arr = <dynamic>[];
    r.beginArray();
    while (r.hasNextElement()) {
      if (field.isModel) arr.add(decodeModelObj(r, field.type));
      else arr.add(readScalarValue(r, field.type));
    }
    r.endArray();
    return arr;
  }
  if (field.isModel) return decodeModelObj(r, field.type);
  return readScalarValue(r, field.type);
}

Map<String, dynamic> decodeModelObj(SpecReader r, String modelName) {
  final ms = schema[modelName]!;
  final o = <String, dynamic>{};
  r.beginObject();
  while (r.hasNextField()) {
    final k = r.readFieldName();
    final field = ms.fields.cast<FieldSchema?>().firstWhere(
      (f) => f?.name == k, orElse: () => null);
    if (field != null) {
      o[k] = decodeField(r, field);
    } else {
      r.skip();
    }
  }
  r.endObject();
  return o;
}

dynamic readScalarGron(GronReader r, String typ) {
  switch (typ) {
    case 'string': return r.readString();
    case 'boolean': return r.readBool();
    case 'int8': case 'int16': case 'int32': return r.readInt32();
    case 'int64': return r.readInt64();
    case 'uint8': case 'uint16': case 'uint32': return r.readUint32();
    case 'uint64': return r.readUint64();
    case 'float32': return r.readFloat32();
    case 'float64': return r.readFloat64();
    case 'bytes': return r.readBytes();
    default: throw Exception('unknown scalar: $typ');
  }
}

dynamic decodeFieldGron(GronReader r, FieldSchema field) {
  if (field.isArray) {
    final arr = <dynamic>[];
    r.beginArray();
    while (r.hasNextElement()) {
      r.nextElement();
      if (field.isModel) arr.add(decodeModelGron(r, field.type));
      else arr.add(readScalarGron(r, field.type));
    }
    r.endArray();
    return arr;
  }
  if (field.isModel) return decodeModelGron(r, field.type);
  return readScalarGron(r, field.type);
}

Map<String, dynamic> decodeModelGron(GronReader r, String modelName) {
  final ms = schema[modelName]!;
  final o = <String, dynamic>{};
  r.beginObject();
  while (r.hasNextField()) {
    final k = r.readFieldName();
    final field = ms.fields.cast<FieldSchema?>().firstWhere(
      (f) => f?.name == k, orElse: () => null);
    if (field != null) {
      o[k] = decodeFieldGron(r, field);
    } else {
      r.skip();
    }
  }
  r.endObject();
  return o;
}

void encodeFieldMP(MsgPackWriter w, dynamic v, FieldSchema field) {
  if (field.isArray) {
    final arr = v as List;
    w.beginArray(arr.length);
    for (final item in arr) {
      if (field.isModel) encodeModelInlineMP(w, item as Map<String, dynamic>, field.type);
      else writeScalarMP(w, item, field.type);
    }
    w.endArray();
    return;
  }
  if (field.isModel) {
    encodeModelInlineMP(w, v as Map<String, dynamic>, field.type);
    return;
  }
  writeScalarMP(w, v, field.type);
}

Uint8List encodeModelMP(Map<String, dynamic> o, String modelName) {
  final w = MsgPackWriter();
  encodeModelInlineMP(w, o, modelName);
  return w.toBytes();
}

void encodeModelInlineMP(MsgPackWriter w, Map<String, dynamic> o, String modelName) {
  final ms = schema[modelName]!;
  var count = 0;
  for (final f in ms.fields) {
    if (f.optional && !o.containsKey(f.name)) continue;
    count++;
  }
  w.beginObject(count);
  for (final f in ms.fields) {
    if (f.optional && !o.containsKey(f.name)) continue;
    w.writeField(f.name);
    encodeFieldMP(w, o[f.name], f);
  }
  w.endObject();
}

void encodeFieldJSON(JsonWriter w, dynamic v, FieldSchema field) {
  if (field.isArray) {
    final arr = v as List;
    w.beginArray();
    for (final item in arr) {
      w.nextElement();
      if (field.isModel) encodeModelInlineJSON(w, item as Map<String, dynamic>, field.type);
      else writeScalarJSON(w, item, field.type);
    }
    w.endArray();
    return;
  }
  if (field.isModel) {
    encodeModelInlineJSON(w, v as Map<String, dynamic>, field.type);
    return;
  }
  writeScalarJSON(w, v, field.type);
}

Uint8List encodeModelJSON(Map<String, dynamic> o, String modelName) {
  final w = JsonWriter();
  encodeModelInlineJSON(w, o, modelName);
  return w.toBytes();
}

void encodeModelInlineJSON(JsonWriter w, Map<String, dynamic> o, String modelName) {
  final ms = schema[modelName]!;
  w.beginObject();
  for (final f in ms.fields) {
    if (f.optional && !o.containsKey(f.name)) continue;
    w.writeField(f.name);
    encodeFieldJSON(w, o[f.name], f);
  }
  w.endObject();
}

void encodeFieldGRON(GronWriter w, dynamic v, FieldSchema field) {
  if (field.isArray) {
    final arr = v as List;
    w.beginArray(arr.length);
    for (final item in arr) {
      w.nextElement();
      if (field.isModel) encodeModelInlineGRON(w, item as Map<String, dynamic>, field.type);
      else writeScalarGRON(w, item, field.type);
    }
    w.endArray();
    return;
  }
  if (field.isModel) {
    encodeModelInlineGRON(w, v as Map<String, dynamic>, field.type);
    return;
  }
  writeScalarGRON(w, v, field.type);
}

Uint8List encodeModelGRON(Map<String, dynamic> o, String modelName) {
  final w = GronWriter();
  encodeModelInlineGRON(w, o, modelName);
  return Uint8List.fromList(w.toBytes());
}

void encodeModelInlineGRON(GronWriter w, Map<String, dynamic> o, String modelName) {
  final ms = schema[modelName]!;
  var count = 0;
  for (final f in ms.fields) {
    if (f.optional && !o.containsKey(f.name)) continue;
    count++;
  }
  w.beginObject(count);
  for (final f in ms.fields) {
    if (f.optional && !o.containsKey(f.name)) continue;
    w.writeField(f.name);
    encodeFieldGRON(w, o[f.name], f);
  }
  w.endObject();
}

Map<String, bool> processObject(String name) {
  var mpOk = false;
  var jsonOk = false;
  var gronOk = false;

  try {
    final mpBuf = File('${vecDir.path}/$name.msgpack').readAsBytesSync();
    final o1 = decodeModelObj(MsgPackReader(mpBuf), name);
    File('${outDir.path}/$name.msgpack').writeAsBytesSync(encodeModelMP(o1, name));
    mpOk = true;
  } catch (e) {
    print('  FAIL $name.msgpack: $e');
  }

  Uint8List? compactOut;
  try {
    final jsonBuf = File('${vecDir.path}/$name.json').readAsBytesSync();
    final o2 = decodeModelObj(JsonReader(jsonBuf), name);
    compactOut = encodeModelJSON(o2, name);
    File('${outDir.path}/$name.json').writeAsBytesSync(compactOut);
    jsonOk = true;
  } catch (e) {
    print('  FAIL $name.json: $e');
  }

  if (compactOut != null) {
    final prettyFile = File('${vecDir.path}/$name.pretty.json');
    if (prettyFile.existsSync()) {
      try {
        final o3 = decodeModelObj(JsonReader(prettyFile.readAsBytesSync()), name);
        final prettyOut = encodeModelJSON(o3, name);
        if (!_bytesEqual(prettyOut, compactOut)) {
          print('  FAIL $name.pretty.json: re-encoded bytes differ');
          jsonOk = false;
        }
      } catch (e) {
        print('  FAIL $name.pretty.json: $e');
        jsonOk = false;
      }
    }
  }

  try {
    final gronBuf = File('${vecDir.path}/$name.gron').readAsBytesSync();
    final o4 = decodeModelGron(GronReader(gronBuf), name);
    File('${outDir.path}/$name.gron').writeAsBytesSync(encodeModelGRON(o4, name));
    gronOk = true;
  } catch (e) {
    print('  FAIL $name.gron: $e');
  }

  return {'mp': mpOk, 'json': jsonOk, 'gron': gronOk};
}

bool _bytesEqual(Uint8List a, Uint8List b) {
  if (a.length != b.length) return false;
  for (var i = 0; i < a.length; i++) { if (a[i] != b[i]) return false; }
  return true;
}

void writeResults(Map<String, bool> scalarResults, Map<String, Map<String, bool>> objectResults) {
  final sb = StringBuffer();
  sb.write('{"scalars":{');
  var first = true;
  for (final entry in scalarResults.entries) {
    if (!first) sb.write(',');
    sb.write('"${entry.key}":{"pass":${entry.value}}');
    first = false;
  }
  sb.write('},"objects":{');
  first = true;
  for (final entry in objectResults.entries) {
    if (!first) sb.write(',');
    sb.write('"${entry.key}":{"mp":${entry.value['mp']},"json":${entry.value['json']},"gron":${entry.value['gron']}}');
    first = false;
  }
  sb.write('}}');
  File('${outDir.path}/results.json').writeAsStringSync(sb.toString());
}
