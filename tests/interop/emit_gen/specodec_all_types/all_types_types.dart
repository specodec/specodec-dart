library specodec_all_types;

import 'dart:typed_data';
import 'package:specodec/specodec.dart';

class Inner {
  final int x;
  final int y;
  Inner({required this.x, required this.y});
}

void writeInner(SpecWriter w, Inner obj) {
  w.beginObject(2);
  w.writeField('x'); w.writeInt32(obj.x);
  w.writeField('y'); w.writeInt32(obj.y);
  w.endObject();
}

final SpecCodec<Inner> InnerCodec = SpecCodec<Inner>(
  encode: (w, obj) => writeInner(w, obj),
  decode: (r) {
    int xVal = 0;
    int yVal = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'x': xVal = r.readInt32(); break;
        case 'y': yVal = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Inner(x: xVal, y: yVal);
  },
);

class Coord {
  final double lat;
  final double lng;
  Coord({required this.lat, required this.lng});
}

void writeCoord(SpecWriter w, Coord obj) {
  w.beginObject(2);
  w.writeField('lat'); w.writeFloat64(obj.lat);
  w.writeField('lng'); w.writeFloat64(obj.lng);
  w.endObject();
}

final SpecCodec<Coord> CoordCodec = SpecCodec<Coord>(
  encode: (w, obj) => writeCoord(w, obj),
  decode: (r) {
    double latVal = 0.0;
    double lngVal = 0.0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'lat': latVal = r.readFloat64(); break;
        case 'lng': lngVal = r.readFloat64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Coord(lat: latVal, lng: lngVal);
  },
);

class IdVal {
  final String id;
  final int value;
  IdVal({required this.id, required this.value});
}

void writeIdVal(SpecWriter w, IdVal obj) {
  w.beginObject(2);
  w.writeField('id'); w.writeString(obj.id);
  w.writeField('value'); w.writeInt32(obj.value);
  w.endObject();
}

final SpecCodec<IdVal> IdValCodec = SpecCodec<IdVal>(
  encode: (w, obj) => writeIdVal(w, obj),
  decode: (r) {
    String idVal = '';
    int valueVal = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'id': idVal = r.readString(); break;
        case 'value': valueVal = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return IdVal(id: idVal, value: valueVal);
  },
);

class Label {
  final String key;
  final String text;
  Label({required this.key, required this.text});
}

void writeLabel(SpecWriter w, Label obj) {
  w.beginObject(2);
  w.writeField('key'); w.writeString(obj.key);
  w.writeField('text'); w.writeString(obj.text);
  w.endObject();
}

final SpecCodec<Label> LabelCodec = SpecCodec<Label>(
  encode: (w, obj) => writeLabel(w, obj),
  decode: (r) {
    String keyVal = '';
    String textVal = '';
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'key': keyVal = r.readString(); break;
        case 'text': textVal = r.readString(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Label(key: keyVal, text: textVal);
  },
);

class Money {
  final BigInt amount;
  final String currency;
  Money({required this.amount, required this.currency});
}

void writeMoney(SpecWriter w, Money obj) {
  w.beginObject(2);
  w.writeField('amount'); w.writeInt64(obj.amount);
  w.writeField('currency'); w.writeString(obj.currency);
  w.endObject();
}

final SpecCodec<Money> MoneyCodec = SpecCodec<Money>(
  encode: (w, obj) => writeMoney(w, obj),
  decode: (r) {
    BigInt amountVal = BigInt.zero;
    String currencyVal = '';
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'amount': amountVal = r.readInt64(); break;
        case 'currency': currencyVal = r.readString(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Money(amount: amountVal, currency: currencyVal);
  },
);

class Range32 {
  final int min;
  final int max;
  Range32({required this.min, required this.max});
}

void writeRange32(SpecWriter w, Range32 obj) {
  w.beginObject(2);
  w.writeField('min'); w.writeInt32(obj.min);
  w.writeField('max'); w.writeInt32(obj.max);
  w.endObject();
}

final SpecCodec<Range32> Range32Codec = SpecCodec<Range32>(
  encode: (w, obj) => writeRange32(w, obj),
  decode: (r) {
    int minVal = 0;
    int maxVal = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'min': minVal = r.readInt32(); break;
        case 'max': maxVal = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Range32(min: minVal, max: maxVal);
  },
);

class Addr {
  final String street;
  final String city;
  final String zip;
  Addr({required this.street, required this.city, required this.zip});
}

void writeAddr(SpecWriter w, Addr obj) {
  w.beginObject(3);
  w.writeField('street'); w.writeString(obj.street);
  w.writeField('city'); w.writeString(obj.city);
  w.writeField('zip'); w.writeString(obj.zip);
  w.endObject();
}

final SpecCodec<Addr> AddrCodec = SpecCodec<Addr>(
  encode: (w, obj) => writeAddr(w, obj),
  decode: (r) {
    String streetVal = '';
    String cityVal = '';
    String zipVal = '';
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'street': streetVal = r.readString(); break;
        case 'city': cityVal = r.readString(); break;
        case 'zip': zipVal = r.readString(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Addr(street: streetVal, city: cityVal, zip: zipVal);
  },
);

class Point3 {
  final double x;
  final double y;
  final double z;
  Point3({required this.x, required this.y, required this.z});
}

void writePoint3(SpecWriter w, Point3 obj) {
  w.beginObject(3);
  w.writeField('x'); w.writeFloat64(obj.x);
  w.writeField('y'); w.writeFloat64(obj.y);
  w.writeField('z'); w.writeFloat64(obj.z);
  w.endObject();
}

final SpecCodec<Point3> Point3Codec = SpecCodec<Point3>(
  encode: (w, obj) => writePoint3(w, obj),
  decode: (r) {
    double xVal = 0.0;
    double yVal = 0.0;
    double zVal = 0.0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'x': xVal = r.readFloat64(); break;
        case 'y': yVal = r.readFloat64(); break;
        case 'z': zVal = r.readFloat64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Point3(x: xVal, y: yVal, z: zVal);
  },
);

class OptInner {
  final String? name;
  final double? score;
  final String? tag;
  OptInner({this.name, this.score, this.tag});
}

void writeOptInner(SpecWriter w, OptInner obj) {
  var fieldCount = 0;
  if (obj.name != null) fieldCount++;
  if (obj.score != null) fieldCount++;
  if (obj.tag != null) fieldCount++;
  w.beginObject(fieldCount);
  if (obj.name != null) { w.writeField('name'); w.writeString(obj.name!); }
  if (obj.score != null) { w.writeField('score'); w.writeFloat64(obj.score!); }
  if (obj.tag != null) { w.writeField('tag'); w.writeString(obj.tag!); }
  w.endObject();
}

final SpecCodec<OptInner> OptInnerCodec = SpecCodec<OptInner>(
  encode: (w, obj) => writeOptInner(w, obj),
  decode: (r) {
    String? nameVal;
    double? scoreVal;
    String? tagVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'name': nameVal = r.readString(); break;
        case 'score': scoreVal = r.readFloat64(); break;
        case 'tag': tagVal = r.readString(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptInner(name: nameVal, score: scoreVal, tag: tagVal);
  },
);

class SingleString {
  final String v;
  SingleString({required this.v});
}

void writeSingleString(SpecWriter w, SingleString obj) {
  w.beginObject(1);
  w.writeField('v'); w.writeString(obj.v);
  w.endObject();
}

final SpecCodec<SingleString> SingleStringCodec = SpecCodec<SingleString>(
  encode: (w, obj) => writeSingleString(w, obj),
  decode: (r) {
    String vVal = '';
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'v': vVal = r.readString(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return SingleString(v: vVal);
  },
);

class SingleBoolean {
  final bool v;
  SingleBoolean({required this.v});
}

void writeSingleBoolean(SpecWriter w, SingleBoolean obj) {
  w.beginObject(1);
  w.writeField('v'); w.writeBool(obj.v);
  w.endObject();
}

final SpecCodec<SingleBoolean> SingleBooleanCodec = SpecCodec<SingleBoolean>(
  encode: (w, obj) => writeSingleBoolean(w, obj),
  decode: (r) {
    bool vVal = false;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'v': vVal = r.readBool(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return SingleBoolean(v: vVal);
  },
);

class SingleInt8 {
  final int v;
  SingleInt8({required this.v});
}

void writeSingleInt8(SpecWriter w, SingleInt8 obj) {
  w.beginObject(1);
  w.writeField('v'); w.writeInt32(obj.v);
  w.endObject();
}

final SpecCodec<SingleInt8> SingleInt8Codec = SpecCodec<SingleInt8>(
  encode: (w, obj) => writeSingleInt8(w, obj),
  decode: (r) {
    int vVal = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'v': vVal = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return SingleInt8(v: vVal);
  },
);

class SingleInt16 {
  final int v;
  SingleInt16({required this.v});
}

void writeSingleInt16(SpecWriter w, SingleInt16 obj) {
  w.beginObject(1);
  w.writeField('v'); w.writeInt32(obj.v);
  w.endObject();
}

final SpecCodec<SingleInt16> SingleInt16Codec = SpecCodec<SingleInt16>(
  encode: (w, obj) => writeSingleInt16(w, obj),
  decode: (r) {
    int vVal = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'v': vVal = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return SingleInt16(v: vVal);
  },
);

class SingleInt32 {
  final int v;
  SingleInt32({required this.v});
}

void writeSingleInt32(SpecWriter w, SingleInt32 obj) {
  w.beginObject(1);
  w.writeField('v'); w.writeInt32(obj.v);
  w.endObject();
}

final SpecCodec<SingleInt32> SingleInt32Codec = SpecCodec<SingleInt32>(
  encode: (w, obj) => writeSingleInt32(w, obj),
  decode: (r) {
    int vVal = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'v': vVal = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return SingleInt32(v: vVal);
  },
);

class SingleInt64 {
  final BigInt v;
  SingleInt64({required this.v});
}

void writeSingleInt64(SpecWriter w, SingleInt64 obj) {
  w.beginObject(1);
  w.writeField('v'); w.writeInt64(obj.v);
  w.endObject();
}

final SpecCodec<SingleInt64> SingleInt64Codec = SpecCodec<SingleInt64>(
  encode: (w, obj) => writeSingleInt64(w, obj),
  decode: (r) {
    BigInt vVal = BigInt.zero;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'v': vVal = r.readInt64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return SingleInt64(v: vVal);
  },
);

class SingleUint8 {
  final int v;
  SingleUint8({required this.v});
}

void writeSingleUint8(SpecWriter w, SingleUint8 obj) {
  w.beginObject(1);
  w.writeField('v'); w.writeUint32(obj.v);
  w.endObject();
}

final SpecCodec<SingleUint8> SingleUint8Codec = SpecCodec<SingleUint8>(
  encode: (w, obj) => writeSingleUint8(w, obj),
  decode: (r) {
    int vVal = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'v': vVal = r.readUint32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return SingleUint8(v: vVal);
  },
);

class SingleUint16 {
  final int v;
  SingleUint16({required this.v});
}

void writeSingleUint16(SpecWriter w, SingleUint16 obj) {
  w.beginObject(1);
  w.writeField('v'); w.writeUint32(obj.v);
  w.endObject();
}

final SpecCodec<SingleUint16> SingleUint16Codec = SpecCodec<SingleUint16>(
  encode: (w, obj) => writeSingleUint16(w, obj),
  decode: (r) {
    int vVal = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'v': vVal = r.readUint32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return SingleUint16(v: vVal);
  },
);

class SingleUint32 {
  final int v;
  SingleUint32({required this.v});
}

void writeSingleUint32(SpecWriter w, SingleUint32 obj) {
  w.beginObject(1);
  w.writeField('v'); w.writeUint32(obj.v);
  w.endObject();
}

final SpecCodec<SingleUint32> SingleUint32Codec = SpecCodec<SingleUint32>(
  encode: (w, obj) => writeSingleUint32(w, obj),
  decode: (r) {
    int vVal = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'v': vVal = r.readUint32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return SingleUint32(v: vVal);
  },
);

class SingleUint64 {
  final BigInt v;
  SingleUint64({required this.v});
}

void writeSingleUint64(SpecWriter w, SingleUint64 obj) {
  w.beginObject(1);
  w.writeField('v'); w.writeUint64(obj.v);
  w.endObject();
}

final SpecCodec<SingleUint64> SingleUint64Codec = SpecCodec<SingleUint64>(
  encode: (w, obj) => writeSingleUint64(w, obj),
  decode: (r) {
    BigInt vVal = BigInt.zero;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'v': vVal = r.readUint64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return SingleUint64(v: vVal);
  },
);

class SingleFloat32 {
  final double v;
  SingleFloat32({required this.v});
}

void writeSingleFloat32(SpecWriter w, SingleFloat32 obj) {
  w.beginObject(1);
  w.writeField('v'); w.writeFloat32(obj.v);
  w.endObject();
}

final SpecCodec<SingleFloat32> SingleFloat32Codec = SpecCodec<SingleFloat32>(
  encode: (w, obj) => writeSingleFloat32(w, obj),
  decode: (r) {
    double vVal = 0.0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'v': vVal = r.readFloat32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return SingleFloat32(v: vVal);
  },
);

class SingleFloat64 {
  final double v;
  SingleFloat64({required this.v});
}

void writeSingleFloat64(SpecWriter w, SingleFloat64 obj) {
  w.beginObject(1);
  w.writeField('v'); w.writeFloat64(obj.v);
  w.endObject();
}

final SpecCodec<SingleFloat64> SingleFloat64Codec = SpecCodec<SingleFloat64>(
  encode: (w, obj) => writeSingleFloat64(w, obj),
  decode: (r) {
    double vVal = 0.0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'v': vVal = r.readFloat64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return SingleFloat64(v: vVal);
  },
);

class SingleBytes {
  final Uint8List v;
  SingleBytes({required this.v});
}

void writeSingleBytes(SpecWriter w, SingleBytes obj) {
  w.beginObject(1);
  w.writeField('v'); w.writeBytes(obj.v);
  w.endObject();
}

final SpecCodec<SingleBytes> SingleBytesCodec = SpecCodec<SingleBytes>(
  encode: (w, obj) => writeSingleBytes(w, obj),
  decode: (r) {
    Uint8List vVal = Uint8List(0);
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'v': vVal = r.readBytes(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return SingleBytes(v: vVal);
  },
);

class OptSingleString {
  final String? v;
  OptSingleString({this.v});
}

void writeOptSingleString(SpecWriter w, OptSingleString obj) {
  var fieldCount = 0;
  if (obj.v != null) fieldCount++;
  w.beginObject(fieldCount);
  if (obj.v != null) { w.writeField('v'); w.writeString(obj.v!); }
  w.endObject();
}

final SpecCodec<OptSingleString> OptSingleStringCodec = SpecCodec<OptSingleString>(
  encode: (w, obj) => writeOptSingleString(w, obj),
  decode: (r) {
    String? vVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'v': vVal = r.readString(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptSingleString(v: vVal);
  },
);

class OptSingleBoolean {
  final bool? v;
  OptSingleBoolean({this.v});
}

void writeOptSingleBoolean(SpecWriter w, OptSingleBoolean obj) {
  var fieldCount = 0;
  if (obj.v != null) fieldCount++;
  w.beginObject(fieldCount);
  if (obj.v != null) { w.writeField('v'); w.writeBool(obj.v!); }
  w.endObject();
}

final SpecCodec<OptSingleBoolean> OptSingleBooleanCodec = SpecCodec<OptSingleBoolean>(
  encode: (w, obj) => writeOptSingleBoolean(w, obj),
  decode: (r) {
    bool? vVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'v': vVal = r.readBool(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptSingleBoolean(v: vVal);
  },
);

class OptSingleInt8 {
  final int? v;
  OptSingleInt8({this.v});
}

void writeOptSingleInt8(SpecWriter w, OptSingleInt8 obj) {
  var fieldCount = 0;
  if (obj.v != null) fieldCount++;
  w.beginObject(fieldCount);
  if (obj.v != null) { w.writeField('v'); w.writeInt32(obj.v!); }
  w.endObject();
}

final SpecCodec<OptSingleInt8> OptSingleInt8Codec = SpecCodec<OptSingleInt8>(
  encode: (w, obj) => writeOptSingleInt8(w, obj),
  decode: (r) {
    int? vVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'v': vVal = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptSingleInt8(v: vVal);
  },
);

class OptSingleInt16 {
  final int? v;
  OptSingleInt16({this.v});
}

void writeOptSingleInt16(SpecWriter w, OptSingleInt16 obj) {
  var fieldCount = 0;
  if (obj.v != null) fieldCount++;
  w.beginObject(fieldCount);
  if (obj.v != null) { w.writeField('v'); w.writeInt32(obj.v!); }
  w.endObject();
}

final SpecCodec<OptSingleInt16> OptSingleInt16Codec = SpecCodec<OptSingleInt16>(
  encode: (w, obj) => writeOptSingleInt16(w, obj),
  decode: (r) {
    int? vVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'v': vVal = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptSingleInt16(v: vVal);
  },
);

class OptSingleInt32 {
  final int? v;
  OptSingleInt32({this.v});
}

void writeOptSingleInt32(SpecWriter w, OptSingleInt32 obj) {
  var fieldCount = 0;
  if (obj.v != null) fieldCount++;
  w.beginObject(fieldCount);
  if (obj.v != null) { w.writeField('v'); w.writeInt32(obj.v!); }
  w.endObject();
}

final SpecCodec<OptSingleInt32> OptSingleInt32Codec = SpecCodec<OptSingleInt32>(
  encode: (w, obj) => writeOptSingleInt32(w, obj),
  decode: (r) {
    int? vVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'v': vVal = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptSingleInt32(v: vVal);
  },
);

class OptSingleInt64 {
  final BigInt? v;
  OptSingleInt64({this.v});
}

void writeOptSingleInt64(SpecWriter w, OptSingleInt64 obj) {
  var fieldCount = 0;
  if (obj.v != null) fieldCount++;
  w.beginObject(fieldCount);
  if (obj.v != null) { w.writeField('v'); w.writeInt64(obj.v!); }
  w.endObject();
}

final SpecCodec<OptSingleInt64> OptSingleInt64Codec = SpecCodec<OptSingleInt64>(
  encode: (w, obj) => writeOptSingleInt64(w, obj),
  decode: (r) {
    BigInt? vVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'v': vVal = r.readInt64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptSingleInt64(v: vVal);
  },
);

class OptSingleUint8 {
  final int? v;
  OptSingleUint8({this.v});
}

void writeOptSingleUint8(SpecWriter w, OptSingleUint8 obj) {
  var fieldCount = 0;
  if (obj.v != null) fieldCount++;
  w.beginObject(fieldCount);
  if (obj.v != null) { w.writeField('v'); w.writeUint32(obj.v!); }
  w.endObject();
}

final SpecCodec<OptSingleUint8> OptSingleUint8Codec = SpecCodec<OptSingleUint8>(
  encode: (w, obj) => writeOptSingleUint8(w, obj),
  decode: (r) {
    int? vVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'v': vVal = r.readUint32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptSingleUint8(v: vVal);
  },
);

class OptSingleUint16 {
  final int? v;
  OptSingleUint16({this.v});
}

void writeOptSingleUint16(SpecWriter w, OptSingleUint16 obj) {
  var fieldCount = 0;
  if (obj.v != null) fieldCount++;
  w.beginObject(fieldCount);
  if (obj.v != null) { w.writeField('v'); w.writeUint32(obj.v!); }
  w.endObject();
}

final SpecCodec<OptSingleUint16> OptSingleUint16Codec = SpecCodec<OptSingleUint16>(
  encode: (w, obj) => writeOptSingleUint16(w, obj),
  decode: (r) {
    int? vVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'v': vVal = r.readUint32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptSingleUint16(v: vVal);
  },
);

class OptSingleUint32 {
  final int? v;
  OptSingleUint32({this.v});
}

void writeOptSingleUint32(SpecWriter w, OptSingleUint32 obj) {
  var fieldCount = 0;
  if (obj.v != null) fieldCount++;
  w.beginObject(fieldCount);
  if (obj.v != null) { w.writeField('v'); w.writeUint32(obj.v!); }
  w.endObject();
}

final SpecCodec<OptSingleUint32> OptSingleUint32Codec = SpecCodec<OptSingleUint32>(
  encode: (w, obj) => writeOptSingleUint32(w, obj),
  decode: (r) {
    int? vVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'v': vVal = r.readUint32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptSingleUint32(v: vVal);
  },
);

class OptSingleUint64 {
  final BigInt? v;
  OptSingleUint64({this.v});
}

void writeOptSingleUint64(SpecWriter w, OptSingleUint64 obj) {
  var fieldCount = 0;
  if (obj.v != null) fieldCount++;
  w.beginObject(fieldCount);
  if (obj.v != null) { w.writeField('v'); w.writeUint64(obj.v!); }
  w.endObject();
}

final SpecCodec<OptSingleUint64> OptSingleUint64Codec = SpecCodec<OptSingleUint64>(
  encode: (w, obj) => writeOptSingleUint64(w, obj),
  decode: (r) {
    BigInt? vVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'v': vVal = r.readUint64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptSingleUint64(v: vVal);
  },
);

class OptSingleFloat32 {
  final double? v;
  OptSingleFloat32({this.v});
}

void writeOptSingleFloat32(SpecWriter w, OptSingleFloat32 obj) {
  var fieldCount = 0;
  if (obj.v != null) fieldCount++;
  w.beginObject(fieldCount);
  if (obj.v != null) { w.writeField('v'); w.writeFloat32(obj.v!); }
  w.endObject();
}

final SpecCodec<OptSingleFloat32> OptSingleFloat32Codec = SpecCodec<OptSingleFloat32>(
  encode: (w, obj) => writeOptSingleFloat32(w, obj),
  decode: (r) {
    double? vVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'v': vVal = r.readFloat32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptSingleFloat32(v: vVal);
  },
);

class OptSingleFloat64 {
  final double? v;
  OptSingleFloat64({this.v});
}

void writeOptSingleFloat64(SpecWriter w, OptSingleFloat64 obj) {
  var fieldCount = 0;
  if (obj.v != null) fieldCount++;
  w.beginObject(fieldCount);
  if (obj.v != null) { w.writeField('v'); w.writeFloat64(obj.v!); }
  w.endObject();
}

final SpecCodec<OptSingleFloat64> OptSingleFloat64Codec = SpecCodec<OptSingleFloat64>(
  encode: (w, obj) => writeOptSingleFloat64(w, obj),
  decode: (r) {
    double? vVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'v': vVal = r.readFloat64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptSingleFloat64(v: vVal);
  },
);

class OptSingleBytes {
  final Uint8List? v;
  OptSingleBytes({this.v});
}

void writeOptSingleBytes(SpecWriter w, OptSingleBytes obj) {
  var fieldCount = 0;
  if (obj.v != null) fieldCount++;
  w.beginObject(fieldCount);
  if (obj.v != null) { w.writeField('v'); w.writeBytes(obj.v!); }
  w.endObject();
}

final SpecCodec<OptSingleBytes> OptSingleBytesCodec = SpecCodec<OptSingleBytes>(
  encode: (w, obj) => writeOptSingleBytes(w, obj),
  decode: (r) {
    Uint8List? vVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'v': vVal = r.readBytes(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptSingleBytes(v: vVal);
  },
);

class PairString {
  final String a;
  final String b;
  PairString({required this.a, required this.b});
}

void writePairString(SpecWriter w, PairString obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeString(obj.a);
  w.writeField('b'); w.writeString(obj.b);
  w.endObject();
}

final SpecCodec<PairString> PairStringCodec = SpecCodec<PairString>(
  encode: (w, obj) => writePairString(w, obj),
  decode: (r) {
    String aVal = '';
    String bVal = '';
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readString(); break;
        case 'b': bVal = r.readString(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return PairString(a: aVal, b: bVal);
  },
);

class PairBoolean {
  final bool a;
  final bool b;
  PairBoolean({required this.a, required this.b});
}

void writePairBoolean(SpecWriter w, PairBoolean obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeBool(obj.a);
  w.writeField('b'); w.writeBool(obj.b);
  w.endObject();
}

final SpecCodec<PairBoolean> PairBooleanCodec = SpecCodec<PairBoolean>(
  encode: (w, obj) => writePairBoolean(w, obj),
  decode: (r) {
    bool aVal = false;
    bool bVal = false;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readBool(); break;
        case 'b': bVal = r.readBool(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return PairBoolean(a: aVal, b: bVal);
  },
);

class PairInt8 {
  final int a;
  final int b;
  PairInt8({required this.a, required this.b});
}

void writePairInt8(SpecWriter w, PairInt8 obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeInt32(obj.a);
  w.writeField('b'); w.writeInt32(obj.b);
  w.endObject();
}

final SpecCodec<PairInt8> PairInt8Codec = SpecCodec<PairInt8>(
  encode: (w, obj) => writePairInt8(w, obj),
  decode: (r) {
    int aVal = 0;
    int bVal = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readInt32(); break;
        case 'b': bVal = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return PairInt8(a: aVal, b: bVal);
  },
);

class PairInt16 {
  final int a;
  final int b;
  PairInt16({required this.a, required this.b});
}

void writePairInt16(SpecWriter w, PairInt16 obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeInt32(obj.a);
  w.writeField('b'); w.writeInt32(obj.b);
  w.endObject();
}

final SpecCodec<PairInt16> PairInt16Codec = SpecCodec<PairInt16>(
  encode: (w, obj) => writePairInt16(w, obj),
  decode: (r) {
    int aVal = 0;
    int bVal = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readInt32(); break;
        case 'b': bVal = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return PairInt16(a: aVal, b: bVal);
  },
);

class PairInt32 {
  final int a;
  final int b;
  PairInt32({required this.a, required this.b});
}

void writePairInt32(SpecWriter w, PairInt32 obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeInt32(obj.a);
  w.writeField('b'); w.writeInt32(obj.b);
  w.endObject();
}

final SpecCodec<PairInt32> PairInt32Codec = SpecCodec<PairInt32>(
  encode: (w, obj) => writePairInt32(w, obj),
  decode: (r) {
    int aVal = 0;
    int bVal = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readInt32(); break;
        case 'b': bVal = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return PairInt32(a: aVal, b: bVal);
  },
);

class PairInt64 {
  final BigInt a;
  final BigInt b;
  PairInt64({required this.a, required this.b});
}

void writePairInt64(SpecWriter w, PairInt64 obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeInt64(obj.a);
  w.writeField('b'); w.writeInt64(obj.b);
  w.endObject();
}

final SpecCodec<PairInt64> PairInt64Codec = SpecCodec<PairInt64>(
  encode: (w, obj) => writePairInt64(w, obj),
  decode: (r) {
    BigInt aVal = BigInt.zero;
    BigInt bVal = BigInt.zero;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readInt64(); break;
        case 'b': bVal = r.readInt64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return PairInt64(a: aVal, b: bVal);
  },
);

class PairUint8 {
  final int a;
  final int b;
  PairUint8({required this.a, required this.b});
}

void writePairUint8(SpecWriter w, PairUint8 obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeUint32(obj.a);
  w.writeField('b'); w.writeUint32(obj.b);
  w.endObject();
}

final SpecCodec<PairUint8> PairUint8Codec = SpecCodec<PairUint8>(
  encode: (w, obj) => writePairUint8(w, obj),
  decode: (r) {
    int aVal = 0;
    int bVal = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readUint32(); break;
        case 'b': bVal = r.readUint32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return PairUint8(a: aVal, b: bVal);
  },
);

class PairUint16 {
  final int a;
  final int b;
  PairUint16({required this.a, required this.b});
}

void writePairUint16(SpecWriter w, PairUint16 obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeUint32(obj.a);
  w.writeField('b'); w.writeUint32(obj.b);
  w.endObject();
}

final SpecCodec<PairUint16> PairUint16Codec = SpecCodec<PairUint16>(
  encode: (w, obj) => writePairUint16(w, obj),
  decode: (r) {
    int aVal = 0;
    int bVal = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readUint32(); break;
        case 'b': bVal = r.readUint32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return PairUint16(a: aVal, b: bVal);
  },
);

class PairUint32 {
  final int a;
  final int b;
  PairUint32({required this.a, required this.b});
}

void writePairUint32(SpecWriter w, PairUint32 obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeUint32(obj.a);
  w.writeField('b'); w.writeUint32(obj.b);
  w.endObject();
}

final SpecCodec<PairUint32> PairUint32Codec = SpecCodec<PairUint32>(
  encode: (w, obj) => writePairUint32(w, obj),
  decode: (r) {
    int aVal = 0;
    int bVal = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readUint32(); break;
        case 'b': bVal = r.readUint32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return PairUint32(a: aVal, b: bVal);
  },
);

class PairUint64 {
  final BigInt a;
  final BigInt b;
  PairUint64({required this.a, required this.b});
}

void writePairUint64(SpecWriter w, PairUint64 obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeUint64(obj.a);
  w.writeField('b'); w.writeUint64(obj.b);
  w.endObject();
}

final SpecCodec<PairUint64> PairUint64Codec = SpecCodec<PairUint64>(
  encode: (w, obj) => writePairUint64(w, obj),
  decode: (r) {
    BigInt aVal = BigInt.zero;
    BigInt bVal = BigInt.zero;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readUint64(); break;
        case 'b': bVal = r.readUint64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return PairUint64(a: aVal, b: bVal);
  },
);

class PairFloat32 {
  final double a;
  final double b;
  PairFloat32({required this.a, required this.b});
}

void writePairFloat32(SpecWriter w, PairFloat32 obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeFloat32(obj.a);
  w.writeField('b'); w.writeFloat32(obj.b);
  w.endObject();
}

final SpecCodec<PairFloat32> PairFloat32Codec = SpecCodec<PairFloat32>(
  encode: (w, obj) => writePairFloat32(w, obj),
  decode: (r) {
    double aVal = 0.0;
    double bVal = 0.0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readFloat32(); break;
        case 'b': bVal = r.readFloat32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return PairFloat32(a: aVal, b: bVal);
  },
);

class PairFloat64 {
  final double a;
  final double b;
  PairFloat64({required this.a, required this.b});
}

void writePairFloat64(SpecWriter w, PairFloat64 obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeFloat64(obj.a);
  w.writeField('b'); w.writeFloat64(obj.b);
  w.endObject();
}

final SpecCodec<PairFloat64> PairFloat64Codec = SpecCodec<PairFloat64>(
  encode: (w, obj) => writePairFloat64(w, obj),
  decode: (r) {
    double aVal = 0.0;
    double bVal = 0.0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readFloat64(); break;
        case 'b': bVal = r.readFloat64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return PairFloat64(a: aVal, b: bVal);
  },
);

class PairBytes {
  final Uint8List a;
  final Uint8List b;
  PairBytes({required this.a, required this.b});
}

void writePairBytes(SpecWriter w, PairBytes obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeBytes(obj.a);
  w.writeField('b'); w.writeBytes(obj.b);
  w.endObject();
}

final SpecCodec<PairBytes> PairBytesCodec = SpecCodec<PairBytes>(
  encode: (w, obj) => writePairBytes(w, obj),
  decode: (r) {
    Uint8List aVal = Uint8List(0);
    Uint8List bVal = Uint8List(0);
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readBytes(); break;
        case 'b': bVal = r.readBytes(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return PairBytes(a: aVal, b: bVal);
  },
);

class DualStringInt32 {
  final String a;
  final int b;
  DualStringInt32({required this.a, required this.b});
}

void writeDualStringInt32(SpecWriter w, DualStringInt32 obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeString(obj.a);
  w.writeField('b'); w.writeInt32(obj.b);
  w.endObject();
}

final SpecCodec<DualStringInt32> DualStringInt32Codec = SpecCodec<DualStringInt32>(
  encode: (w, obj) => writeDualStringInt32(w, obj),
  decode: (r) {
    String aVal = '';
    int bVal = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readString(); break;
        case 'b': bVal = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DualStringInt32(a: aVal, b: bVal);
  },
);

class DualStringBoolean {
  final String a;
  final bool b;
  DualStringBoolean({required this.a, required this.b});
}

void writeDualStringBoolean(SpecWriter w, DualStringBoolean obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeString(obj.a);
  w.writeField('b'); w.writeBool(obj.b);
  w.endObject();
}

final SpecCodec<DualStringBoolean> DualStringBooleanCodec = SpecCodec<DualStringBoolean>(
  encode: (w, obj) => writeDualStringBoolean(w, obj),
  decode: (r) {
    String aVal = '';
    bool bVal = false;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readString(); break;
        case 'b': bVal = r.readBool(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DualStringBoolean(a: aVal, b: bVal);
  },
);

class DualStringFloat64 {
  final String a;
  final double b;
  DualStringFloat64({required this.a, required this.b});
}

void writeDualStringFloat64(SpecWriter w, DualStringFloat64 obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeString(obj.a);
  w.writeField('b'); w.writeFloat64(obj.b);
  w.endObject();
}

final SpecCodec<DualStringFloat64> DualStringFloat64Codec = SpecCodec<DualStringFloat64>(
  encode: (w, obj) => writeDualStringFloat64(w, obj),
  decode: (r) {
    String aVal = '';
    double bVal = 0.0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readString(); break;
        case 'b': bVal = r.readFloat64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DualStringFloat64(a: aVal, b: bVal);
  },
);

class DualStringBytes {
  final String a;
  final Uint8List b;
  DualStringBytes({required this.a, required this.b});
}

void writeDualStringBytes(SpecWriter w, DualStringBytes obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeString(obj.a);
  w.writeField('b'); w.writeBytes(obj.b);
  w.endObject();
}

final SpecCodec<DualStringBytes> DualStringBytesCodec = SpecCodec<DualStringBytes>(
  encode: (w, obj) => writeDualStringBytes(w, obj),
  decode: (r) {
    String aVal = '';
    Uint8List bVal = Uint8List(0);
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readString(); break;
        case 'b': bVal = r.readBytes(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DualStringBytes(a: aVal, b: bVal);
  },
);

class DualInt32Boolean {
  final int a;
  final bool b;
  DualInt32Boolean({required this.a, required this.b});
}

void writeDualInt32Boolean(SpecWriter w, DualInt32Boolean obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeInt32(obj.a);
  w.writeField('b'); w.writeBool(obj.b);
  w.endObject();
}

final SpecCodec<DualInt32Boolean> DualInt32BooleanCodec = SpecCodec<DualInt32Boolean>(
  encode: (w, obj) => writeDualInt32Boolean(w, obj),
  decode: (r) {
    int aVal = 0;
    bool bVal = false;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readInt32(); break;
        case 'b': bVal = r.readBool(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DualInt32Boolean(a: aVal, b: bVal);
  },
);

class DualInt32Float64 {
  final int a;
  final double b;
  DualInt32Float64({required this.a, required this.b});
}

void writeDualInt32Float64(SpecWriter w, DualInt32Float64 obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeInt32(obj.a);
  w.writeField('b'); w.writeFloat64(obj.b);
  w.endObject();
}

final SpecCodec<DualInt32Float64> DualInt32Float64Codec = SpecCodec<DualInt32Float64>(
  encode: (w, obj) => writeDualInt32Float64(w, obj),
  decode: (r) {
    int aVal = 0;
    double bVal = 0.0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readInt32(); break;
        case 'b': bVal = r.readFloat64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DualInt32Float64(a: aVal, b: bVal);
  },
);

class DualInt32Int64 {
  final int a;
  final BigInt b;
  DualInt32Int64({required this.a, required this.b});
}

void writeDualInt32Int64(SpecWriter w, DualInt32Int64 obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeInt32(obj.a);
  w.writeField('b'); w.writeInt64(obj.b);
  w.endObject();
}

final SpecCodec<DualInt32Int64> DualInt32Int64Codec = SpecCodec<DualInt32Int64>(
  encode: (w, obj) => writeDualInt32Int64(w, obj),
  decode: (r) {
    int aVal = 0;
    BigInt bVal = BigInt.zero;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readInt32(); break;
        case 'b': bVal = r.readInt64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DualInt32Int64(a: aVal, b: bVal);
  },
);

class DualInt32Uint32 {
  final int a;
  final int b;
  DualInt32Uint32({required this.a, required this.b});
}

void writeDualInt32Uint32(SpecWriter w, DualInt32Uint32 obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeInt32(obj.a);
  w.writeField('b'); w.writeUint32(obj.b);
  w.endObject();
}

final SpecCodec<DualInt32Uint32> DualInt32Uint32Codec = SpecCodec<DualInt32Uint32>(
  encode: (w, obj) => writeDualInt32Uint32(w, obj),
  decode: (r) {
    int aVal = 0;
    int bVal = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readInt32(); break;
        case 'b': bVal = r.readUint32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DualInt32Uint32(a: aVal, b: bVal);
  },
);

class DualInt64Uint64 {
  final BigInt a;
  final BigInt b;
  DualInt64Uint64({required this.a, required this.b});
}

void writeDualInt64Uint64(SpecWriter w, DualInt64Uint64 obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeInt64(obj.a);
  w.writeField('b'); w.writeUint64(obj.b);
  w.endObject();
}

final SpecCodec<DualInt64Uint64> DualInt64Uint64Codec = SpecCodec<DualInt64Uint64>(
  encode: (w, obj) => writeDualInt64Uint64(w, obj),
  decode: (r) {
    BigInt aVal = BigInt.zero;
    BigInt bVal = BigInt.zero;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readInt64(); break;
        case 'b': bVal = r.readUint64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DualInt64Uint64(a: aVal, b: bVal);
  },
);

class DualFloat32Float64 {
  final double a;
  final double b;
  DualFloat32Float64({required this.a, required this.b});
}

void writeDualFloat32Float64(SpecWriter w, DualFloat32Float64 obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeFloat32(obj.a);
  w.writeField('b'); w.writeFloat64(obj.b);
  w.endObject();
}

final SpecCodec<DualFloat32Float64> DualFloat32Float64Codec = SpecCodec<DualFloat32Float64>(
  encode: (w, obj) => writeDualFloat32Float64(w, obj),
  decode: (r) {
    double aVal = 0.0;
    double bVal = 0.0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readFloat32(); break;
        case 'b': bVal = r.readFloat64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DualFloat32Float64(a: aVal, b: bVal);
  },
);

class DualFloat64Boolean {
  final double a;
  final bool b;
  DualFloat64Boolean({required this.a, required this.b});
}

void writeDualFloat64Boolean(SpecWriter w, DualFloat64Boolean obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeFloat64(obj.a);
  w.writeField('b'); w.writeBool(obj.b);
  w.endObject();
}

final SpecCodec<DualFloat64Boolean> DualFloat64BooleanCodec = SpecCodec<DualFloat64Boolean>(
  encode: (w, obj) => writeDualFloat64Boolean(w, obj),
  decode: (r) {
    double aVal = 0.0;
    bool bVal = false;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readFloat64(); break;
        case 'b': bVal = r.readBool(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DualFloat64Boolean(a: aVal, b: bVal);
  },
);

class DualFloat64Bytes {
  final double a;
  final Uint8List b;
  DualFloat64Bytes({required this.a, required this.b});
}

void writeDualFloat64Bytes(SpecWriter w, DualFloat64Bytes obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeFloat64(obj.a);
  w.writeField('b'); w.writeBytes(obj.b);
  w.endObject();
}

final SpecCodec<DualFloat64Bytes> DualFloat64BytesCodec = SpecCodec<DualFloat64Bytes>(
  encode: (w, obj) => writeDualFloat64Bytes(w, obj),
  decode: (r) {
    double aVal = 0.0;
    Uint8List bVal = Uint8List(0);
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readFloat64(); break;
        case 'b': bVal = r.readBytes(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DualFloat64Bytes(a: aVal, b: bVal);
  },
);

class DualUint32Uint64 {
  final int a;
  final BigInt b;
  DualUint32Uint64({required this.a, required this.b});
}

void writeDualUint32Uint64(SpecWriter w, DualUint32Uint64 obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeUint32(obj.a);
  w.writeField('b'); w.writeUint64(obj.b);
  w.endObject();
}

final SpecCodec<DualUint32Uint64> DualUint32Uint64Codec = SpecCodec<DualUint32Uint64>(
  encode: (w, obj) => writeDualUint32Uint64(w, obj),
  decode: (r) {
    int aVal = 0;
    BigInt bVal = BigInt.zero;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readUint32(); break;
        case 'b': bVal = r.readUint64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DualUint32Uint64(a: aVal, b: bVal);
  },
);

class DualBooleanBytes {
  final bool a;
  final Uint8List b;
  DualBooleanBytes({required this.a, required this.b});
}

void writeDualBooleanBytes(SpecWriter w, DualBooleanBytes obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeBool(obj.a);
  w.writeField('b'); w.writeBytes(obj.b);
  w.endObject();
}

final SpecCodec<DualBooleanBytes> DualBooleanBytesCodec = SpecCodec<DualBooleanBytes>(
  encode: (w, obj) => writeDualBooleanBytes(w, obj),
  decode: (r) {
    bool aVal = false;
    Uint8List bVal = Uint8List(0);
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readBool(); break;
        case 'b': bVal = r.readBytes(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DualBooleanBytes(a: aVal, b: bVal);
  },
);

class DualInt8Uint8 {
  final int a;
  final int b;
  DualInt8Uint8({required this.a, required this.b});
}

void writeDualInt8Uint8(SpecWriter w, DualInt8Uint8 obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeInt32(obj.a);
  w.writeField('b'); w.writeUint32(obj.b);
  w.endObject();
}

final SpecCodec<DualInt8Uint8> DualInt8Uint8Codec = SpecCodec<DualInt8Uint8>(
  encode: (w, obj) => writeDualInt8Uint8(w, obj),
  decode: (r) {
    int aVal = 0;
    int bVal = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readInt32(); break;
        case 'b': bVal = r.readUint32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DualInt8Uint8(a: aVal, b: bVal);
  },
);

class DualInt16Uint16 {
  final int a;
  final int b;
  DualInt16Uint16({required this.a, required this.b});
}

void writeDualInt16Uint16(SpecWriter w, DualInt16Uint16 obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeInt32(obj.a);
  w.writeField('b'); w.writeUint32(obj.b);
  w.endObject();
}

final SpecCodec<DualInt16Uint16> DualInt16Uint16Codec = SpecCodec<DualInt16Uint16>(
  encode: (w, obj) => writeDualInt16Uint16(w, obj),
  decode: (r) {
    int aVal = 0;
    int bVal = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readInt32(); break;
        case 'b': bVal = r.readUint32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DualInt16Uint16(a: aVal, b: bVal);
  },
);

class DualStringInt64 {
  final String a;
  final BigInt b;
  DualStringInt64({required this.a, required this.b});
}

void writeDualStringInt64(SpecWriter w, DualStringInt64 obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeString(obj.a);
  w.writeField('b'); w.writeInt64(obj.b);
  w.endObject();
}

final SpecCodec<DualStringInt64> DualStringInt64Codec = SpecCodec<DualStringInt64>(
  encode: (w, obj) => writeDualStringInt64(w, obj),
  decode: (r) {
    String aVal = '';
    BigInt bVal = BigInt.zero;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readString(); break;
        case 'b': bVal = r.readInt64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DualStringInt64(a: aVal, b: bVal);
  },
);

class DualStringUint64 {
  final String a;
  final BigInt b;
  DualStringUint64({required this.a, required this.b});
}

void writeDualStringUint64(SpecWriter w, DualStringUint64 obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeString(obj.a);
  w.writeField('b'); w.writeUint64(obj.b);
  w.endObject();
}

final SpecCodec<DualStringUint64> DualStringUint64Codec = SpecCodec<DualStringUint64>(
  encode: (w, obj) => writeDualStringUint64(w, obj),
  decode: (r) {
    String aVal = '';
    BigInt bVal = BigInt.zero;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readString(); break;
        case 'b': bVal = r.readUint64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DualStringUint64(a: aVal, b: bVal);
  },
);

class DualInt32Bytes {
  final int a;
  final Uint8List b;
  DualInt32Bytes({required this.a, required this.b});
}

void writeDualInt32Bytes(SpecWriter w, DualInt32Bytes obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeInt32(obj.a);
  w.writeField('b'); w.writeBytes(obj.b);
  w.endObject();
}

final SpecCodec<DualInt32Bytes> DualInt32BytesCodec = SpecCodec<DualInt32Bytes>(
  encode: (w, obj) => writeDualInt32Bytes(w, obj),
  decode: (r) {
    int aVal = 0;
    Uint8List bVal = Uint8List(0);
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readInt32(); break;
        case 'b': bVal = r.readBytes(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DualInt32Bytes(a: aVal, b: bVal);
  },
);

class DualFloat64Int32 {
  final double a;
  final int b;
  DualFloat64Int32({required this.a, required this.b});
}

void writeDualFloat64Int32(SpecWriter w, DualFloat64Int32 obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeFloat64(obj.a);
  w.writeField('b'); w.writeInt32(obj.b);
  w.endObject();
}

final SpecCodec<DualFloat64Int32> DualFloat64Int32Codec = SpecCodec<DualFloat64Int32>(
  encode: (w, obj) => writeDualFloat64Int32(w, obj),
  decode: (r) {
    double aVal = 0.0;
    int bVal = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readFloat64(); break;
        case 'b': bVal = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DualFloat64Int32(a: aVal, b: bVal);
  },
);

class DualBooleanInt32 {
  final bool a;
  final int b;
  DualBooleanInt32({required this.a, required this.b});
}

void writeDualBooleanInt32(SpecWriter w, DualBooleanInt32 obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeBool(obj.a);
  w.writeField('b'); w.writeInt32(obj.b);
  w.endObject();
}

final SpecCodec<DualBooleanInt32> DualBooleanInt32Codec = SpecCodec<DualBooleanInt32>(
  encode: (w, obj) => writeDualBooleanInt32(w, obj),
  decode: (r) {
    bool aVal = false;
    int bVal = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readBool(); break;
        case 'b': bVal = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DualBooleanInt32(a: aVal, b: bVal);
  },
);

class DualBytesInt64 {
  final Uint8List a;
  final BigInt b;
  DualBytesInt64({required this.a, required this.b});
}

void writeDualBytesInt64(SpecWriter w, DualBytesInt64 obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeBytes(obj.a);
  w.writeField('b'); w.writeInt64(obj.b);
  w.endObject();
}

final SpecCodec<DualBytesInt64> DualBytesInt64Codec = SpecCodec<DualBytesInt64>(
  encode: (w, obj) => writeDualBytesInt64(w, obj),
  decode: (r) {
    Uint8List aVal = Uint8List(0);
    BigInt bVal = BigInt.zero;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readBytes(); break;
        case 'b': bVal = r.readInt64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DualBytesInt64(a: aVal, b: bVal);
  },
);

class DualInt8Float32 {
  final int a;
  final double b;
  DualInt8Float32({required this.a, required this.b});
}

void writeDualInt8Float32(SpecWriter w, DualInt8Float32 obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeInt32(obj.a);
  w.writeField('b'); w.writeFloat32(obj.b);
  w.endObject();
}

final SpecCodec<DualInt8Float32> DualInt8Float32Codec = SpecCodec<DualInt8Float32>(
  encode: (w, obj) => writeDualInt8Float32(w, obj),
  decode: (r) {
    int aVal = 0;
    double bVal = 0.0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readInt32(); break;
        case 'b': bVal = r.readFloat32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DualInt8Float32(a: aVal, b: bVal);
  },
);

class DualUint8Int16 {
  final int a;
  final int b;
  DualUint8Int16({required this.a, required this.b});
}

void writeDualUint8Int16(SpecWriter w, DualUint8Int16 obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeUint32(obj.a);
  w.writeField('b'); w.writeInt32(obj.b);
  w.endObject();
}

final SpecCodec<DualUint8Int16> DualUint8Int16Codec = SpecCodec<DualUint8Int16>(
  encode: (w, obj) => writeDualUint8Int16(w, obj),
  decode: (r) {
    int aVal = 0;
    int bVal = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readUint32(); break;
        case 'b': bVal = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DualUint8Int16(a: aVal, b: bVal);
  },
);

class DualInt64Float64 {
  final BigInt a;
  final double b;
  DualInt64Float64({required this.a, required this.b});
}

void writeDualInt64Float64(SpecWriter w, DualInt64Float64 obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeInt64(obj.a);
  w.writeField('b'); w.writeFloat64(obj.b);
  w.endObject();
}

final SpecCodec<DualInt64Float64> DualInt64Float64Codec = SpecCodec<DualInt64Float64>(
  encode: (w, obj) => writeDualInt64Float64(w, obj),
  decode: (r) {
    BigInt aVal = BigInt.zero;
    double bVal = 0.0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readInt64(); break;
        case 'b': bVal = r.readFloat64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DualInt64Float64(a: aVal, b: bVal);
  },
);

class DualUint64String {
  final BigInt a;
  final String b;
  DualUint64String({required this.a, required this.b});
}

void writeDualUint64String(SpecWriter w, DualUint64String obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeUint64(obj.a);
  w.writeField('b'); w.writeString(obj.b);
  w.endObject();
}

final SpecCodec<DualUint64String> DualUint64StringCodec = SpecCodec<DualUint64String>(
  encode: (w, obj) => writeDualUint64String(w, obj),
  decode: (r) {
    BigInt aVal = BigInt.zero;
    String bVal = '';
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readUint64(); break;
        case 'b': bVal = r.readString(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DualUint64String(a: aVal, b: bVal);
  },
);

class Triple01 {
  final String a;
  final int b;
  final bool c;
  Triple01({required this.a, required this.b, required this.c});
}

void writeTriple01(SpecWriter w, Triple01 obj) {
  w.beginObject(3);
  w.writeField('a'); w.writeString(obj.a);
  w.writeField('b'); w.writeInt32(obj.b);
  w.writeField('c'); w.writeBool(obj.c);
  w.endObject();
}

final SpecCodec<Triple01> Triple01Codec = SpecCodec<Triple01>(
  encode: (w, obj) => writeTriple01(w, obj),
  decode: (r) {
    String aVal = '';
    int bVal = 0;
    bool cVal = false;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readString(); break;
        case 'b': bVal = r.readInt32(); break;
        case 'c': cVal = r.readBool(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Triple01(a: aVal, b: bVal, c: cVal);
  },
);

class Triple02 {
  final double a;
  final double b;
  final double c;
  Triple02({required this.a, required this.b, required this.c});
}

void writeTriple02(SpecWriter w, Triple02 obj) {
  w.beginObject(3);
  w.writeField('a'); w.writeFloat64(obj.a);
  w.writeField('b'); w.writeFloat64(obj.b);
  w.writeField('c'); w.writeFloat64(obj.c);
  w.endObject();
}

final SpecCodec<Triple02> Triple02Codec = SpecCodec<Triple02>(
  encode: (w, obj) => writeTriple02(w, obj),
  decode: (r) {
    double aVal = 0.0;
    double bVal = 0.0;
    double cVal = 0.0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readFloat64(); break;
        case 'b': bVal = r.readFloat64(); break;
        case 'c': cVal = r.readFloat64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Triple02(a: aVal, b: bVal, c: cVal);
  },
);

class Triple03 {
  final int a;
  final int b;
  final int c;
  Triple03({required this.a, required this.b, required this.c});
}

void writeTriple03(SpecWriter w, Triple03 obj) {
  w.beginObject(3);
  w.writeField('a'); w.writeInt32(obj.a);
  w.writeField('b'); w.writeInt32(obj.b);
  w.writeField('c'); w.writeInt32(obj.c);
  w.endObject();
}

final SpecCodec<Triple03> Triple03Codec = SpecCodec<Triple03>(
  encode: (w, obj) => writeTriple03(w, obj),
  decode: (r) {
    int aVal = 0;
    int bVal = 0;
    int cVal = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readInt32(); break;
        case 'b': bVal = r.readInt32(); break;
        case 'c': cVal = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Triple03(a: aVal, b: bVal, c: cVal);
  },
);

class Triple04 {
  final String a;
  final String b;
  final int c;
  Triple04({required this.a, required this.b, required this.c});
}

void writeTriple04(SpecWriter w, Triple04 obj) {
  w.beginObject(3);
  w.writeField('a'); w.writeString(obj.a);
  w.writeField('b'); w.writeString(obj.b);
  w.writeField('c'); w.writeInt32(obj.c);
  w.endObject();
}

final SpecCodec<Triple04> Triple04Codec = SpecCodec<Triple04>(
  encode: (w, obj) => writeTriple04(w, obj),
  decode: (r) {
    String aVal = '';
    String bVal = '';
    int cVal = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readString(); break;
        case 'b': bVal = r.readString(); break;
        case 'c': cVal = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Triple04(a: aVal, b: bVal, c: cVal);
  },
);

class Triple05 {
  final BigInt a;
  final String b;
  final bool c;
  Triple05({required this.a, required this.b, required this.c});
}

void writeTriple05(SpecWriter w, Triple05 obj) {
  w.beginObject(3);
  w.writeField('a'); w.writeInt64(obj.a);
  w.writeField('b'); w.writeString(obj.b);
  w.writeField('c'); w.writeBool(obj.c);
  w.endObject();
}

final SpecCodec<Triple05> Triple05Codec = SpecCodec<Triple05>(
  encode: (w, obj) => writeTriple05(w, obj),
  decode: (r) {
    BigInt aVal = BigInt.zero;
    String bVal = '';
    bool cVal = false;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readInt64(); break;
        case 'b': bVal = r.readString(); break;
        case 'c': cVal = r.readBool(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Triple05(a: aVal, b: bVal, c: cVal);
  },
);

class Triple06 {
  final int a;
  final BigInt b;
  final String c;
  Triple06({required this.a, required this.b, required this.c});
}

void writeTriple06(SpecWriter w, Triple06 obj) {
  w.beginObject(3);
  w.writeField('a'); w.writeUint32(obj.a);
  w.writeField('b'); w.writeUint64(obj.b);
  w.writeField('c'); w.writeString(obj.c);
  w.endObject();
}

final SpecCodec<Triple06> Triple06Codec = SpecCodec<Triple06>(
  encode: (w, obj) => writeTriple06(w, obj),
  decode: (r) {
    int aVal = 0;
    BigInt bVal = BigInt.zero;
    String cVal = '';
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readUint32(); break;
        case 'b': bVal = r.readUint64(); break;
        case 'c': cVal = r.readString(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Triple06(a: aVal, b: bVal, c: cVal);
  },
);

class Triple07 {
  final Uint8List a;
  final String b;
  final int c;
  Triple07({required this.a, required this.b, required this.c});
}

void writeTriple07(SpecWriter w, Triple07 obj) {
  w.beginObject(3);
  w.writeField('a'); w.writeBytes(obj.a);
  w.writeField('b'); w.writeString(obj.b);
  w.writeField('c'); w.writeInt32(obj.c);
  w.endObject();
}

final SpecCodec<Triple07> Triple07Codec = SpecCodec<Triple07>(
  encode: (w, obj) => writeTriple07(w, obj),
  decode: (r) {
    Uint8List aVal = Uint8List(0);
    String bVal = '';
    int cVal = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readBytes(); break;
        case 'b': bVal = r.readString(); break;
        case 'c': cVal = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Triple07(a: aVal, b: bVal, c: cVal);
  },
);

class Triple08 {
  final double a;
  final int b;
  final bool c;
  Triple08({required this.a, required this.b, required this.c});
}

void writeTriple08(SpecWriter w, Triple08 obj) {
  w.beginObject(3);
  w.writeField('a'); w.writeFloat32(obj.a);
  w.writeField('b'); w.writeInt32(obj.b);
  w.writeField('c'); w.writeBool(obj.c);
  w.endObject();
}

final SpecCodec<Triple08> Triple08Codec = SpecCodec<Triple08>(
  encode: (w, obj) => writeTriple08(w, obj),
  decode: (r) {
    double aVal = 0.0;
    int bVal = 0;
    bool cVal = false;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readFloat32(); break;
        case 'b': bVal = r.readInt32(); break;
        case 'c': cVal = r.readBool(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Triple08(a: aVal, b: bVal, c: cVal);
  },
);

class Triple09 {
  final String a;
  final BigInt b;
  final double c;
  Triple09({required this.a, required this.b, required this.c});
}

void writeTriple09(SpecWriter w, Triple09 obj) {
  w.beginObject(3);
  w.writeField('a'); w.writeString(obj.a);
  w.writeField('b'); w.writeInt64(obj.b);
  w.writeField('c'); w.writeFloat64(obj.c);
  w.endObject();
}

final SpecCodec<Triple09> Triple09Codec = SpecCodec<Triple09>(
  encode: (w, obj) => writeTriple09(w, obj),
  decode: (r) {
    String aVal = '';
    BigInt bVal = BigInt.zero;
    double cVal = 0.0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readString(); break;
        case 'b': bVal = r.readInt64(); break;
        case 'c': cVal = r.readFloat64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Triple09(a: aVal, b: bVal, c: cVal);
  },
);

class Triple10 {
  final bool a;
  final bool b;
  final bool c;
  Triple10({required this.a, required this.b, required this.c});
}

void writeTriple10(SpecWriter w, Triple10 obj) {
  w.beginObject(3);
  w.writeField('a'); w.writeBool(obj.a);
  w.writeField('b'); w.writeBool(obj.b);
  w.writeField('c'); w.writeBool(obj.c);
  w.endObject();
}

final SpecCodec<Triple10> Triple10Codec = SpecCodec<Triple10>(
  encode: (w, obj) => writeTriple10(w, obj),
  decode: (r) {
    bool aVal = false;
    bool bVal = false;
    bool cVal = false;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readBool(); break;
        case 'b': bVal = r.readBool(); break;
        case 'c': cVal = r.readBool(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Triple10(a: aVal, b: bVal, c: cVal);
  },
);

class Triple11 {
  final int a;
  final int b;
  final int c;
  Triple11({required this.a, required this.b, required this.c});
}

void writeTriple11(SpecWriter w, Triple11 obj) {
  w.beginObject(3);
  w.writeField('a'); w.writeInt32(obj.a);
  w.writeField('b'); w.writeInt32(obj.b);
  w.writeField('c'); w.writeInt32(obj.c);
  w.endObject();
}

final SpecCodec<Triple11> Triple11Codec = SpecCodec<Triple11>(
  encode: (w, obj) => writeTriple11(w, obj),
  decode: (r) {
    int aVal = 0;
    int bVal = 0;
    int cVal = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readInt32(); break;
        case 'b': bVal = r.readInt32(); break;
        case 'c': cVal = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Triple11(a: aVal, b: bVal, c: cVal);
  },
);

class Triple12 {
  final int a;
  final int b;
  final int c;
  Triple12({required this.a, required this.b, required this.c});
}

void writeTriple12(SpecWriter w, Triple12 obj) {
  w.beginObject(3);
  w.writeField('a'); w.writeUint32(obj.a);
  w.writeField('b'); w.writeUint32(obj.b);
  w.writeField('c'); w.writeUint32(obj.c);
  w.endObject();
}

final SpecCodec<Triple12> Triple12Codec = SpecCodec<Triple12>(
  encode: (w, obj) => writeTriple12(w, obj),
  decode: (r) {
    int aVal = 0;
    int bVal = 0;
    int cVal = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readUint32(); break;
        case 'b': bVal = r.readUint32(); break;
        case 'c': cVal = r.readUint32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Triple12(a: aVal, b: bVal, c: cVal);
  },
);

class Triple13 {
  final String a;
  final Uint8List b;
  final double c;
  Triple13({required this.a, required this.b, required this.c});
}

void writeTriple13(SpecWriter w, Triple13 obj) {
  w.beginObject(3);
  w.writeField('a'); w.writeString(obj.a);
  w.writeField('b'); w.writeBytes(obj.b);
  w.writeField('c'); w.writeFloat64(obj.c);
  w.endObject();
}

final SpecCodec<Triple13> Triple13Codec = SpecCodec<Triple13>(
  encode: (w, obj) => writeTriple13(w, obj),
  decode: (r) {
    String aVal = '';
    Uint8List bVal = Uint8List(0);
    double cVal = 0.0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readString(); break;
        case 'b': bVal = r.readBytes(); break;
        case 'c': cVal = r.readFloat64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Triple13(a: aVal, b: bVal, c: cVal);
  },
);

class Triple14 {
  final BigInt a;
  final BigInt b;
  final bool c;
  Triple14({required this.a, required this.b, required this.c});
}

void writeTriple14(SpecWriter w, Triple14 obj) {
  w.beginObject(3);
  w.writeField('a'); w.writeInt64(obj.a);
  w.writeField('b'); w.writeUint64(obj.b);
  w.writeField('c'); w.writeBool(obj.c);
  w.endObject();
}

final SpecCodec<Triple14> Triple14Codec = SpecCodec<Triple14>(
  encode: (w, obj) => writeTriple14(w, obj),
  decode: (r) {
    BigInt aVal = BigInt.zero;
    BigInt bVal = BigInt.zero;
    bool cVal = false;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readInt64(); break;
        case 'b': bVal = r.readUint64(); break;
        case 'c': cVal = r.readBool(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Triple14(a: aVal, b: bVal, c: cVal);
  },
);

class Triple15 {
  final double a;
  final String b;
  final Uint8List c;
  Triple15({required this.a, required this.b, required this.c});
}

void writeTriple15(SpecWriter w, Triple15 obj) {
  w.beginObject(3);
  w.writeField('a'); w.writeFloat64(obj.a);
  w.writeField('b'); w.writeString(obj.b);
  w.writeField('c'); w.writeBytes(obj.c);
  w.endObject();
}

final SpecCodec<Triple15> Triple15Codec = SpecCodec<Triple15>(
  encode: (w, obj) => writeTriple15(w, obj),
  decode: (r) {
    double aVal = 0.0;
    String bVal = '';
    Uint8List cVal = Uint8List(0);
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readFloat64(); break;
        case 'b': bVal = r.readString(); break;
        case 'c': cVal = r.readBytes(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Triple15(a: aVal, b: bVal, c: cVal);
  },
);

class Five01 {
  final String f1;
  final int f2;
  final bool f3;
  final double f4;
  final Uint8List f5;
  Five01({required this.f1, required this.f2, required this.f3, required this.f4, required this.f5});
}

void writeFive01(SpecWriter w, Five01 obj) {
  w.beginObject(5);
  w.writeField('f1'); w.writeString(obj.f1);
  w.writeField('f2'); w.writeInt32(obj.f2);
  w.writeField('f3'); w.writeBool(obj.f3);
  w.writeField('f4'); w.writeFloat64(obj.f4);
  w.writeField('f5'); w.writeBytes(obj.f5);
  w.endObject();
}

final SpecCodec<Five01> Five01Codec = SpecCodec<Five01>(
  encode: (w, obj) => writeFive01(w, obj),
  decode: (r) {
    String f1Val = '';
    int f2Val = 0;
    bool f3Val = false;
    double f4Val = 0.0;
    Uint8List f5Val = Uint8List(0);
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'f1': f1Val = r.readString(); break;
        case 'f2': f2Val = r.readInt32(); break;
        case 'f3': f3Val = r.readBool(); break;
        case 'f4': f4Val = r.readFloat64(); break;
        case 'f5': f5Val = r.readBytes(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Five01(f1: f1Val, f2: f2Val, f3: f3Val, f4: f4Val, f5: f5Val);
  },
);

class Five02 {
  final int f1;
  final int f2;
  final int f3;
  final int f4;
  final int f5;
  Five02({required this.f1, required this.f2, required this.f3, required this.f4, required this.f5});
}

void writeFive02(SpecWriter w, Five02 obj) {
  w.beginObject(5);
  w.writeField('f1'); w.writeInt32(obj.f1);
  w.writeField('f2'); w.writeInt32(obj.f2);
  w.writeField('f3'); w.writeInt32(obj.f3);
  w.writeField('f4'); w.writeInt32(obj.f4);
  w.writeField('f5'); w.writeInt32(obj.f5);
  w.endObject();
}

final SpecCodec<Five02> Five02Codec = SpecCodec<Five02>(
  encode: (w, obj) => writeFive02(w, obj),
  decode: (r) {
    int f1Val = 0;
    int f2Val = 0;
    int f3Val = 0;
    int f4Val = 0;
    int f5Val = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'f1': f1Val = r.readInt32(); break;
        case 'f2': f2Val = r.readInt32(); break;
        case 'f3': f3Val = r.readInt32(); break;
        case 'f4': f4Val = r.readInt32(); break;
        case 'f5': f5Val = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Five02(f1: f1Val, f2: f2Val, f3: f3Val, f4: f4Val, f5: f5Val);
  },
);

class Five03 {
  final String f1;
  final String f2;
  final String f3;
  final String f4;
  final String f5;
  Five03({required this.f1, required this.f2, required this.f3, required this.f4, required this.f5});
}

void writeFive03(SpecWriter w, Five03 obj) {
  w.beginObject(5);
  w.writeField('f1'); w.writeString(obj.f1);
  w.writeField('f2'); w.writeString(obj.f2);
  w.writeField('f3'); w.writeString(obj.f3);
  w.writeField('f4'); w.writeString(obj.f4);
  w.writeField('f5'); w.writeString(obj.f5);
  w.endObject();
}

final SpecCodec<Five03> Five03Codec = SpecCodec<Five03>(
  encode: (w, obj) => writeFive03(w, obj),
  decode: (r) {
    String f1Val = '';
    String f2Val = '';
    String f3Val = '';
    String f4Val = '';
    String f5Val = '';
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'f1': f1Val = r.readString(); break;
        case 'f2': f2Val = r.readString(); break;
        case 'f3': f3Val = r.readString(); break;
        case 'f4': f4Val = r.readString(); break;
        case 'f5': f5Val = r.readString(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Five03(f1: f1Val, f2: f2Val, f3: f3Val, f4: f4Val, f5: f5Val);
  },
);

class Five04 {
  final double f1;
  final int f2;
  final String f3;
  final bool f4;
  final Uint8List f5;
  Five04({required this.f1, required this.f2, required this.f3, required this.f4, required this.f5});
}

void writeFive04(SpecWriter w, Five04 obj) {
  w.beginObject(5);
  w.writeField('f1'); w.writeFloat64(obj.f1);
  w.writeField('f2'); w.writeInt32(obj.f2);
  w.writeField('f3'); w.writeString(obj.f3);
  w.writeField('f4'); w.writeBool(obj.f4);
  w.writeField('f5'); w.writeBytes(obj.f5);
  w.endObject();
}

final SpecCodec<Five04> Five04Codec = SpecCodec<Five04>(
  encode: (w, obj) => writeFive04(w, obj),
  decode: (r) {
    double f1Val = 0.0;
    int f2Val = 0;
    String f3Val = '';
    bool f4Val = false;
    Uint8List f5Val = Uint8List(0);
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'f1': f1Val = r.readFloat64(); break;
        case 'f2': f2Val = r.readInt32(); break;
        case 'f3': f3Val = r.readString(); break;
        case 'f4': f4Val = r.readBool(); break;
        case 'f5': f5Val = r.readBytes(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Five04(f1: f1Val, f2: f2Val, f3: f3Val, f4: f4Val, f5: f5Val);
  },
);

class Five05 {
  final BigInt f1;
  final BigInt f2;
  final String f3;
  final double f4;
  final int f5;
  Five05({required this.f1, required this.f2, required this.f3, required this.f4, required this.f5});
}

void writeFive05(SpecWriter w, Five05 obj) {
  w.beginObject(5);
  w.writeField('f1'); w.writeInt64(obj.f1);
  w.writeField('f2'); w.writeUint64(obj.f2);
  w.writeField('f3'); w.writeString(obj.f3);
  w.writeField('f4'); w.writeFloat32(obj.f4);
  w.writeField('f5'); w.writeInt32(obj.f5);
  w.endObject();
}

final SpecCodec<Five05> Five05Codec = SpecCodec<Five05>(
  encode: (w, obj) => writeFive05(w, obj),
  decode: (r) {
    BigInt f1Val = BigInt.zero;
    BigInt f2Val = BigInt.zero;
    String f3Val = '';
    double f4Val = 0.0;
    int f5Val = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'f1': f1Val = r.readInt64(); break;
        case 'f2': f2Val = r.readUint64(); break;
        case 'f3': f3Val = r.readString(); break;
        case 'f4': f4Val = r.readFloat32(); break;
        case 'f5': f5Val = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Five05(f1: f1Val, f2: f2Val, f3: f3Val, f4: f4Val, f5: f5Val);
  },
);

class Five06 {
  final bool f1;
  final String f2;
  final int f3;
  final double f4;
  final int f5;
  Five06({required this.f1, required this.f2, required this.f3, required this.f4, required this.f5});
}

void writeFive06(SpecWriter w, Five06 obj) {
  w.beginObject(5);
  w.writeField('f1'); w.writeBool(obj.f1);
  w.writeField('f2'); w.writeString(obj.f2);
  w.writeField('f3'); w.writeInt32(obj.f3);
  w.writeField('f4'); w.writeFloat64(obj.f4);
  w.writeField('f5'); w.writeUint32(obj.f5);
  w.endObject();
}

final SpecCodec<Five06> Five06Codec = SpecCodec<Five06>(
  encode: (w, obj) => writeFive06(w, obj),
  decode: (r) {
    bool f1Val = false;
    String f2Val = '';
    int f3Val = 0;
    double f4Val = 0.0;
    int f5Val = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'f1': f1Val = r.readBool(); break;
        case 'f2': f2Val = r.readString(); break;
        case 'f3': f3Val = r.readInt32(); break;
        case 'f4': f4Val = r.readFloat64(); break;
        case 'f5': f5Val = r.readUint32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Five06(f1: f1Val, f2: f2Val, f3: f3Val, f4: f4Val, f5: f5Val);
  },
);

class Five07 {
  final Uint8List f1;
  final Uint8List f2;
  final String f3;
  final int f4;
  final double f5;
  Five07({required this.f1, required this.f2, required this.f3, required this.f4, required this.f5});
}

void writeFive07(SpecWriter w, Five07 obj) {
  w.beginObject(5);
  w.writeField('f1'); w.writeBytes(obj.f1);
  w.writeField('f2'); w.writeBytes(obj.f2);
  w.writeField('f3'); w.writeString(obj.f3);
  w.writeField('f4'); w.writeInt32(obj.f4);
  w.writeField('f5'); w.writeFloat64(obj.f5);
  w.endObject();
}

final SpecCodec<Five07> Five07Codec = SpecCodec<Five07>(
  encode: (w, obj) => writeFive07(w, obj),
  decode: (r) {
    Uint8List f1Val = Uint8List(0);
    Uint8List f2Val = Uint8List(0);
    String f3Val = '';
    int f4Val = 0;
    double f5Val = 0.0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'f1': f1Val = r.readBytes(); break;
        case 'f2': f2Val = r.readBytes(); break;
        case 'f3': f3Val = r.readString(); break;
        case 'f4': f4Val = r.readInt32(); break;
        case 'f5': f5Val = r.readFloat64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Five07(f1: f1Val, f2: f2Val, f3: f3Val, f4: f4Val, f5: f5Val);
  },
);

class Five08 {
  final int f1;
  final int f2;
  final int f3;
  final int f4;
  final int f5;
  Five08({required this.f1, required this.f2, required this.f3, required this.f4, required this.f5});
}

void writeFive08(SpecWriter w, Five08 obj) {
  w.beginObject(5);
  w.writeField('f1'); w.writeUint32(obj.f1);
  w.writeField('f2'); w.writeUint32(obj.f2);
  w.writeField('f3'); w.writeUint32(obj.f3);
  w.writeField('f4'); w.writeInt32(obj.f4);
  w.writeField('f5'); w.writeInt32(obj.f5);
  w.endObject();
}

final SpecCodec<Five08> Five08Codec = SpecCodec<Five08>(
  encode: (w, obj) => writeFive08(w, obj),
  decode: (r) {
    int f1Val = 0;
    int f2Val = 0;
    int f3Val = 0;
    int f4Val = 0;
    int f5Val = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'f1': f1Val = r.readUint32(); break;
        case 'f2': f2Val = r.readUint32(); break;
        case 'f3': f3Val = r.readUint32(); break;
        case 'f4': f4Val = r.readInt32(); break;
        case 'f5': f5Val = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Five08(f1: f1Val, f2: f2Val, f3: f3Val, f4: f4Val, f5: f5Val);
  },
);

class Five09 {
  final double f1;
  final double f2;
  final int f3;
  final BigInt f4;
  final String f5;
  Five09({required this.f1, required this.f2, required this.f3, required this.f4, required this.f5});
}

void writeFive09(SpecWriter w, Five09 obj) {
  w.beginObject(5);
  w.writeField('f1'); w.writeFloat32(obj.f1);
  w.writeField('f2'); w.writeFloat64(obj.f2);
  w.writeField('f3'); w.writeInt32(obj.f3);
  w.writeField('f4'); w.writeInt64(obj.f4);
  w.writeField('f5'); w.writeString(obj.f5);
  w.endObject();
}

final SpecCodec<Five09> Five09Codec = SpecCodec<Five09>(
  encode: (w, obj) => writeFive09(w, obj),
  decode: (r) {
    double f1Val = 0.0;
    double f2Val = 0.0;
    int f3Val = 0;
    BigInt f4Val = BigInt.zero;
    String f5Val = '';
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'f1': f1Val = r.readFloat32(); break;
        case 'f2': f2Val = r.readFloat64(); break;
        case 'f3': f3Val = r.readInt32(); break;
        case 'f4': f4Val = r.readInt64(); break;
        case 'f5': f5Val = r.readString(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Five09(f1: f1Val, f2: f2Val, f3: f3Val, f4: f4Val, f5: f5Val);
  },
);

class Five10 {
  final String f1;
  final bool f2;
  final BigInt f3;
  final BigInt f4;
  final double f5;
  Five10({required this.f1, required this.f2, required this.f3, required this.f4, required this.f5});
}

void writeFive10(SpecWriter w, Five10 obj) {
  w.beginObject(5);
  w.writeField('f1'); w.writeString(obj.f1);
  w.writeField('f2'); w.writeBool(obj.f2);
  w.writeField('f3'); w.writeInt64(obj.f3);
  w.writeField('f4'); w.writeUint64(obj.f4);
  w.writeField('f5'); w.writeFloat64(obj.f5);
  w.endObject();
}

final SpecCodec<Five10> Five10Codec = SpecCodec<Five10>(
  encode: (w, obj) => writeFive10(w, obj),
  decode: (r) {
    String f1Val = '';
    bool f2Val = false;
    BigInt f3Val = BigInt.zero;
    BigInt f4Val = BigInt.zero;
    double f5Val = 0.0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'f1': f1Val = r.readString(); break;
        case 'f2': f2Val = r.readBool(); break;
        case 'f3': f3Val = r.readInt64(); break;
        case 'f4': f4Val = r.readUint64(); break;
        case 'f5': f5Val = r.readFloat64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Five10(f1: f1Val, f2: f2Val, f3: f3Val, f4: f4Val, f5: f5Val);
  },
);

class Ten01 {
  final String f1;
  final bool f2;
  final int f3;
  final int f4;
  final int f5;
  final BigInt f6;
  final int f7;
  final int f8;
  final int f9;
  final BigInt f10;
  Ten01({required this.f1, required this.f2, required this.f3, required this.f4, required this.f5, required this.f6, required this.f7, required this.f8, required this.f9, required this.f10});
}

void writeTen01(SpecWriter w, Ten01 obj) {
  w.beginObject(10);
  w.writeField('f1'); w.writeString(obj.f1);
  w.writeField('f2'); w.writeBool(obj.f2);
  w.writeField('f3'); w.writeInt32(obj.f3);
  w.writeField('f4'); w.writeInt32(obj.f4);
  w.writeField('f5'); w.writeInt32(obj.f5);
  w.writeField('f6'); w.writeInt64(obj.f6);
  w.writeField('f7'); w.writeUint32(obj.f7);
  w.writeField('f8'); w.writeUint32(obj.f8);
  w.writeField('f9'); w.writeUint32(obj.f9);
  w.writeField('f10'); w.writeUint64(obj.f10);
  w.endObject();
}

final SpecCodec<Ten01> Ten01Codec = SpecCodec<Ten01>(
  encode: (w, obj) => writeTen01(w, obj),
  decode: (r) {
    String f1Val = '';
    bool f2Val = false;
    int f3Val = 0;
    int f4Val = 0;
    int f5Val = 0;
    BigInt f6Val = BigInt.zero;
    int f7Val = 0;
    int f8Val = 0;
    int f9Val = 0;
    BigInt f10Val = BigInt.zero;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'f1': f1Val = r.readString(); break;
        case 'f2': f2Val = r.readBool(); break;
        case 'f3': f3Val = r.readInt32(); break;
        case 'f4': f4Val = r.readInt32(); break;
        case 'f5': f5Val = r.readInt32(); break;
        case 'f6': f6Val = r.readInt64(); break;
        case 'f7': f7Val = r.readUint32(); break;
        case 'f8': f8Val = r.readUint32(); break;
        case 'f9': f9Val = r.readUint32(); break;
        case 'f10': f10Val = r.readUint64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Ten01(f1: f1Val, f2: f2Val, f3: f3Val, f4: f4Val, f5: f5Val, f6: f6Val, f7: f7Val, f8: f8Val, f9: f9Val, f10: f10Val);
  },
);

class Ten02 {
  final int f1;
  final int f2;
  final BigInt f3;
  final int f4;
  final int f5;
  final int f6;
  final BigInt f7;
  final double f8;
  final double f9;
  final Uint8List f10;
  Ten02({required this.f1, required this.f2, required this.f3, required this.f4, required this.f5, required this.f6, required this.f7, required this.f8, required this.f9, required this.f10});
}

void writeTen02(SpecWriter w, Ten02 obj) {
  w.beginObject(10);
  w.writeField('f1'); w.writeInt32(obj.f1);
  w.writeField('f2'); w.writeInt32(obj.f2);
  w.writeField('f3'); w.writeInt64(obj.f3);
  w.writeField('f4'); w.writeUint32(obj.f4);
  w.writeField('f5'); w.writeUint32(obj.f5);
  w.writeField('f6'); w.writeUint32(obj.f6);
  w.writeField('f7'); w.writeUint64(obj.f7);
  w.writeField('f8'); w.writeFloat32(obj.f8);
  w.writeField('f9'); w.writeFloat64(obj.f9);
  w.writeField('f10'); w.writeBytes(obj.f10);
  w.endObject();
}

final SpecCodec<Ten02> Ten02Codec = SpecCodec<Ten02>(
  encode: (w, obj) => writeTen02(w, obj),
  decode: (r) {
    int f1Val = 0;
    int f2Val = 0;
    BigInt f3Val = BigInt.zero;
    int f4Val = 0;
    int f5Val = 0;
    int f6Val = 0;
    BigInt f7Val = BigInt.zero;
    double f8Val = 0.0;
    double f9Val = 0.0;
    Uint8List f10Val = Uint8List(0);
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'f1': f1Val = r.readInt32(); break;
        case 'f2': f2Val = r.readInt32(); break;
        case 'f3': f3Val = r.readInt64(); break;
        case 'f4': f4Val = r.readUint32(); break;
        case 'f5': f5Val = r.readUint32(); break;
        case 'f6': f6Val = r.readUint32(); break;
        case 'f7': f7Val = r.readUint64(); break;
        case 'f8': f8Val = r.readFloat32(); break;
        case 'f9': f9Val = r.readFloat64(); break;
        case 'f10': f10Val = r.readBytes(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Ten02(f1: f1Val, f2: f2Val, f3: f3Val, f4: f4Val, f5: f5Val, f6: f6Val, f7: f7Val, f8: f8Val, f9: f9Val, f10: f10Val);
  },
);

class Ten03 {
  final int f1;
  final int f2;
  final int f3;
  final BigInt f4;
  final double f5;
  final double f6;
  final Uint8List f7;
  final String f8;
  final bool f9;
  final int f10;
  Ten03({required this.f1, required this.f2, required this.f3, required this.f4, required this.f5, required this.f6, required this.f7, required this.f8, required this.f9, required this.f10});
}

void writeTen03(SpecWriter w, Ten03 obj) {
  w.beginObject(10);
  w.writeField('f1'); w.writeUint32(obj.f1);
  w.writeField('f2'); w.writeUint32(obj.f2);
  w.writeField('f3'); w.writeUint32(obj.f3);
  w.writeField('f4'); w.writeUint64(obj.f4);
  w.writeField('f5'); w.writeFloat32(obj.f5);
  w.writeField('f6'); w.writeFloat64(obj.f6);
  w.writeField('f7'); w.writeBytes(obj.f7);
  w.writeField('f8'); w.writeString(obj.f8);
  w.writeField('f9'); w.writeBool(obj.f9);
  w.writeField('f10'); w.writeInt32(obj.f10);
  w.endObject();
}

final SpecCodec<Ten03> Ten03Codec = SpecCodec<Ten03>(
  encode: (w, obj) => writeTen03(w, obj),
  decode: (r) {
    int f1Val = 0;
    int f2Val = 0;
    int f3Val = 0;
    BigInt f4Val = BigInt.zero;
    double f5Val = 0.0;
    double f6Val = 0.0;
    Uint8List f7Val = Uint8List(0);
    String f8Val = '';
    bool f9Val = false;
    int f10Val = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'f1': f1Val = r.readUint32(); break;
        case 'f2': f2Val = r.readUint32(); break;
        case 'f3': f3Val = r.readUint32(); break;
        case 'f4': f4Val = r.readUint64(); break;
        case 'f5': f5Val = r.readFloat32(); break;
        case 'f6': f6Val = r.readFloat64(); break;
        case 'f7': f7Val = r.readBytes(); break;
        case 'f8': f8Val = r.readString(); break;
        case 'f9': f9Val = r.readBool(); break;
        case 'f10': f10Val = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Ten03(f1: f1Val, f2: f2Val, f3: f3Val, f4: f4Val, f5: f5Val, f6: f6Val, f7: f7Val, f8: f8Val, f9: f9Val, f10: f10Val);
  },
);

class Ten04 {
  final BigInt f1;
  final double f2;
  final double f3;
  final Uint8List f4;
  final String f5;
  final bool f6;
  final int f7;
  final int f8;
  final int f9;
  final BigInt f10;
  Ten04({required this.f1, required this.f2, required this.f3, required this.f4, required this.f5, required this.f6, required this.f7, required this.f8, required this.f9, required this.f10});
}

void writeTen04(SpecWriter w, Ten04 obj) {
  w.beginObject(10);
  w.writeField('f1'); w.writeUint64(obj.f1);
  w.writeField('f2'); w.writeFloat32(obj.f2);
  w.writeField('f3'); w.writeFloat64(obj.f3);
  w.writeField('f4'); w.writeBytes(obj.f4);
  w.writeField('f5'); w.writeString(obj.f5);
  w.writeField('f6'); w.writeBool(obj.f6);
  w.writeField('f7'); w.writeInt32(obj.f7);
  w.writeField('f8'); w.writeInt32(obj.f8);
  w.writeField('f9'); w.writeInt32(obj.f9);
  w.writeField('f10'); w.writeInt64(obj.f10);
  w.endObject();
}

final SpecCodec<Ten04> Ten04Codec = SpecCodec<Ten04>(
  encode: (w, obj) => writeTen04(w, obj),
  decode: (r) {
    BigInt f1Val = BigInt.zero;
    double f2Val = 0.0;
    double f3Val = 0.0;
    Uint8List f4Val = Uint8List(0);
    String f5Val = '';
    bool f6Val = false;
    int f7Val = 0;
    int f8Val = 0;
    int f9Val = 0;
    BigInt f10Val = BigInt.zero;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'f1': f1Val = r.readUint64(); break;
        case 'f2': f2Val = r.readFloat32(); break;
        case 'f3': f3Val = r.readFloat64(); break;
        case 'f4': f4Val = r.readBytes(); break;
        case 'f5': f5Val = r.readString(); break;
        case 'f6': f6Val = r.readBool(); break;
        case 'f7': f7Val = r.readInt32(); break;
        case 'f8': f8Val = r.readInt32(); break;
        case 'f9': f9Val = r.readInt32(); break;
        case 'f10': f10Val = r.readInt64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Ten04(f1: f1Val, f2: f2Val, f3: f3Val, f4: f4Val, f5: f5Val, f6: f6Val, f7: f7Val, f8: f8Val, f9: f9Val, f10: f10Val);
  },
);

class Ten05 {
  final Uint8List f1;
  final String f2;
  final bool f3;
  final int f4;
  final int f5;
  final int f6;
  final BigInt f7;
  final int f8;
  final int f9;
  final int f10;
  Ten05({required this.f1, required this.f2, required this.f3, required this.f4, required this.f5, required this.f6, required this.f7, required this.f8, required this.f9, required this.f10});
}

void writeTen05(SpecWriter w, Ten05 obj) {
  w.beginObject(10);
  w.writeField('f1'); w.writeBytes(obj.f1);
  w.writeField('f2'); w.writeString(obj.f2);
  w.writeField('f3'); w.writeBool(obj.f3);
  w.writeField('f4'); w.writeInt32(obj.f4);
  w.writeField('f5'); w.writeInt32(obj.f5);
  w.writeField('f6'); w.writeInt32(obj.f6);
  w.writeField('f7'); w.writeInt64(obj.f7);
  w.writeField('f8'); w.writeUint32(obj.f8);
  w.writeField('f9'); w.writeUint32(obj.f9);
  w.writeField('f10'); w.writeUint32(obj.f10);
  w.endObject();
}

final SpecCodec<Ten05> Ten05Codec = SpecCodec<Ten05>(
  encode: (w, obj) => writeTen05(w, obj),
  decode: (r) {
    Uint8List f1Val = Uint8List(0);
    String f2Val = '';
    bool f3Val = false;
    int f4Val = 0;
    int f5Val = 0;
    int f6Val = 0;
    BigInt f7Val = BigInt.zero;
    int f8Val = 0;
    int f9Val = 0;
    int f10Val = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'f1': f1Val = r.readBytes(); break;
        case 'f2': f2Val = r.readString(); break;
        case 'f3': f3Val = r.readBool(); break;
        case 'f4': f4Val = r.readInt32(); break;
        case 'f5': f5Val = r.readInt32(); break;
        case 'f6': f6Val = r.readInt32(); break;
        case 'f7': f7Val = r.readInt64(); break;
        case 'f8': f8Val = r.readUint32(); break;
        case 'f9': f9Val = r.readUint32(); break;
        case 'f10': f10Val = r.readUint32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Ten05(f1: f1Val, f2: f2Val, f3: f3Val, f4: f4Val, f5: f5Val, f6: f6Val, f7: f7Val, f8: f8Val, f9: f9Val, f10: f10Val);
  },
);

class ArrString {
  final List<String> items;
  ArrString({required this.items});
}

void writeArrString(SpecWriter w, ArrString obj) {
  w.beginObject(1);
  w.writeField('items'); w.beginArray(obj.items.length); for (final item in obj.items) { w.nextElement(); w.writeString(item); } w.endArray();
  w.endObject();
}

final SpecCodec<ArrString> ArrStringCodec = SpecCodec<ArrString>(
  encode: (w, obj) => writeArrString(w, obj),
  decode: (r) {
    List<String> itemsVal = [];
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'items': itemsVal = () { final list = <String>[]; r.beginArray(); while (r.hasNextElement()) { list.add(r.readString()); } r.endArray(); return list; }(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return ArrString(items: itemsVal);
  },
);

class ArrInt32 {
  final List<int> items;
  ArrInt32({required this.items});
}

void writeArrInt32(SpecWriter w, ArrInt32 obj) {
  w.beginObject(1);
  w.writeField('items'); w.beginArray(obj.items.length); for (final item in obj.items) { w.nextElement(); w.writeInt32(item); } w.endArray();
  w.endObject();
}

final SpecCodec<ArrInt32> ArrInt32Codec = SpecCodec<ArrInt32>(
  encode: (w, obj) => writeArrInt32(w, obj),
  decode: (r) {
    List<int> itemsVal = [];
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'items': itemsVal = () { final list = <int>[]; r.beginArray(); while (r.hasNextElement()) { list.add(r.readInt32()); } r.endArray(); return list; }(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return ArrInt32(items: itemsVal);
  },
);

class ArrBoolean {
  final List<bool> items;
  ArrBoolean({required this.items});
}

void writeArrBoolean(SpecWriter w, ArrBoolean obj) {
  w.beginObject(1);
  w.writeField('items'); w.beginArray(obj.items.length); for (final item in obj.items) { w.nextElement(); w.writeBool(item); } w.endArray();
  w.endObject();
}

final SpecCodec<ArrBoolean> ArrBooleanCodec = SpecCodec<ArrBoolean>(
  encode: (w, obj) => writeArrBoolean(w, obj),
  decode: (r) {
    List<bool> itemsVal = [];
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'items': itemsVal = () { final list = <bool>[]; r.beginArray(); while (r.hasNextElement()) { list.add(r.readBool()); } r.endArray(); return list; }(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return ArrBoolean(items: itemsVal);
  },
);

class ArrFloat64 {
  final List<double> items;
  ArrFloat64({required this.items});
}

void writeArrFloat64(SpecWriter w, ArrFloat64 obj) {
  w.beginObject(1);
  w.writeField('items'); w.beginArray(obj.items.length); for (final item in obj.items) { w.nextElement(); w.writeFloat64(item); } w.endArray();
  w.endObject();
}

final SpecCodec<ArrFloat64> ArrFloat64Codec = SpecCodec<ArrFloat64>(
  encode: (w, obj) => writeArrFloat64(w, obj),
  decode: (r) {
    List<double> itemsVal = [];
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'items': itemsVal = () { final list = <double>[]; r.beginArray(); while (r.hasNextElement()) { list.add(r.readFloat64()); } r.endArray(); return list; }(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return ArrFloat64(items: itemsVal);
  },
);

class ArrBytes {
  final List<Uint8List> items;
  ArrBytes({required this.items});
}

void writeArrBytes(SpecWriter w, ArrBytes obj) {
  w.beginObject(1);
  w.writeField('items'); w.beginArray(obj.items.length); for (final item in obj.items) { w.nextElement(); w.writeBytes(item); } w.endArray();
  w.endObject();
}

final SpecCodec<ArrBytes> ArrBytesCodec = SpecCodec<ArrBytes>(
  encode: (w, obj) => writeArrBytes(w, obj),
  decode: (r) {
    List<Uint8List> itemsVal = [];
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'items': itemsVal = () { final list = <Uint8List>[]; r.beginArray(); while (r.hasNextElement()) { list.add(r.readBytes()); } r.endArray(); return list; }(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return ArrBytes(items: itemsVal);
  },
);

class ArrInt64 {
  final List<BigInt> items;
  ArrInt64({required this.items});
}

void writeArrInt64(SpecWriter w, ArrInt64 obj) {
  w.beginObject(1);
  w.writeField('items'); w.beginArray(obj.items.length); for (final item in obj.items) { w.nextElement(); w.writeInt64(item); } w.endArray();
  w.endObject();
}

final SpecCodec<ArrInt64> ArrInt64Codec = SpecCodec<ArrInt64>(
  encode: (w, obj) => writeArrInt64(w, obj),
  decode: (r) {
    List<BigInt> itemsVal = [];
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'items': itemsVal = () { final list = <BigInt>[]; r.beginArray(); while (r.hasNextElement()) { list.add(r.readInt64()); } r.endArray(); return list; }(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return ArrInt64(items: itemsVal);
  },
);

class ArrUint64 {
  final List<BigInt> items;
  ArrUint64({required this.items});
}

void writeArrUint64(SpecWriter w, ArrUint64 obj) {
  w.beginObject(1);
  w.writeField('items'); w.beginArray(obj.items.length); for (final item in obj.items) { w.nextElement(); w.writeUint64(item); } w.endArray();
  w.endObject();
}

final SpecCodec<ArrUint64> ArrUint64Codec = SpecCodec<ArrUint64>(
  encode: (w, obj) => writeArrUint64(w, obj),
  decode: (r) {
    List<BigInt> itemsVal = [];
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'items': itemsVal = () { final list = <BigInt>[]; r.beginArray(); while (r.hasNextElement()) { list.add(r.readUint64()); } r.endArray(); return list; }(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return ArrUint64(items: itemsVal);
  },
);

class MultiArr1 {
  final List<String> names;
  final List<int> scores;
  MultiArr1({required this.names, required this.scores});
}

void writeMultiArr1(SpecWriter w, MultiArr1 obj) {
  w.beginObject(2);
  w.writeField('names'); w.beginArray(obj.names.length); for (final item in obj.names) { w.nextElement(); w.writeString(item); } w.endArray();
  w.writeField('scores'); w.beginArray(obj.scores.length); for (final item in obj.scores) { w.nextElement(); w.writeInt32(item); } w.endArray();
  w.endObject();
}

final SpecCodec<MultiArr1> MultiArr1Codec = SpecCodec<MultiArr1>(
  encode: (w, obj) => writeMultiArr1(w, obj),
  decode: (r) {
    List<String> namesVal = [];
    List<int> scoresVal = [];
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'names': namesVal = () { final list = <String>[]; r.beginArray(); while (r.hasNextElement()) { list.add(r.readString()); } r.endArray(); return list; }(); break;
        case 'scores': scoresVal = () { final list = <int>[]; r.beginArray(); while (r.hasNextElement()) { list.add(r.readInt32()); } r.endArray(); return list; }(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return MultiArr1(names: namesVal, scores: scoresVal);
  },
);

class MultiArr2 {
  final List<bool> flags;
  final List<double> values;
  final List<Uint8List> payload;
  MultiArr2({required this.flags, required this.values, required this.payload});
}

void writeMultiArr2(SpecWriter w, MultiArr2 obj) {
  w.beginObject(3);
  w.writeField('flags'); w.beginArray(obj.flags.length); for (final item in obj.flags) { w.nextElement(); w.writeBool(item); } w.endArray();
  w.writeField('values'); w.beginArray(obj.values.length); for (final item in obj.values) { w.nextElement(); w.writeFloat64(item); } w.endArray();
  w.writeField('payload'); w.beginArray(obj.payload.length); for (final item in obj.payload) { w.nextElement(); w.writeBytes(item); } w.endArray();
  w.endObject();
}

final SpecCodec<MultiArr2> MultiArr2Codec = SpecCodec<MultiArr2>(
  encode: (w, obj) => writeMultiArr2(w, obj),
  decode: (r) {
    List<bool> flagsVal = [];
    List<double> valuesVal = [];
    List<Uint8List> payloadVal = [];
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'flags': flagsVal = () { final list = <bool>[]; r.beginArray(); while (r.hasNextElement()) { list.add(r.readBool()); } r.endArray(); return list; }(); break;
        case 'values': valuesVal = () { final list = <double>[]; r.beginArray(); while (r.hasNextElement()) { list.add(r.readFloat64()); } r.endArray(); return list; }(); break;
        case 'payload': payloadVal = () { final list = <Uint8List>[]; r.beginArray(); while (r.hasNextElement()) { list.add(r.readBytes()); } r.endArray(); return list; }(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return MultiArr2(flags: flagsVal, values: valuesVal, payload: payloadVal);
  },
);

class MultiArr3 {
  final List<String> a;
  final List<int> b;
  final List<double> c;
  MultiArr3({required this.a, required this.b, required this.c});
}

void writeMultiArr3(SpecWriter w, MultiArr3 obj) {
  w.beginObject(3);
  w.writeField('a'); w.beginArray(obj.a.length); for (final item in obj.a) { w.nextElement(); w.writeString(item); } w.endArray();
  w.writeField('b'); w.beginArray(obj.b.length); for (final item in obj.b) { w.nextElement(); w.writeInt32(item); } w.endArray();
  w.writeField('c'); w.beginArray(obj.c.length); for (final item in obj.c) { w.nextElement(); w.writeFloat64(item); } w.endArray();
  w.endObject();
}

final SpecCodec<MultiArr3> MultiArr3Codec = SpecCodec<MultiArr3>(
  encode: (w, obj) => writeMultiArr3(w, obj),
  decode: (r) {
    List<String> aVal = [];
    List<int> bVal = [];
    List<double> cVal = [];
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = () { final list = <String>[]; r.beginArray(); while (r.hasNextElement()) { list.add(r.readString()); } r.endArray(); return list; }(); break;
        case 'b': bVal = () { final list = <int>[]; r.beginArray(); while (r.hasNextElement()) { list.add(r.readInt32()); } r.endArray(); return list; }(); break;
        case 'c': cVal = () { final list = <double>[]; r.beginArray(); while (r.hasNextElement()) { list.add(r.readFloat64()); } r.endArray(); return list; }(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return MultiArr3(a: aVal, b: bVal, c: cVal);
  },
);

class MultiArr4 {
  final List<BigInt> ids;
  final List<String> tags;
  MultiArr4({required this.ids, required this.tags});
}

void writeMultiArr4(SpecWriter w, MultiArr4 obj) {
  w.beginObject(2);
  w.writeField('ids'); w.beginArray(obj.ids.length); for (final item in obj.ids) { w.nextElement(); w.writeInt64(item); } w.endArray();
  w.writeField('tags'); w.beginArray(obj.tags.length); for (final item in obj.tags) { w.nextElement(); w.writeString(item); } w.endArray();
  w.endObject();
}

final SpecCodec<MultiArr4> MultiArr4Codec = SpecCodec<MultiArr4>(
  encode: (w, obj) => writeMultiArr4(w, obj),
  decode: (r) {
    List<BigInt> idsVal = [];
    List<String> tagsVal = [];
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'ids': idsVal = () { final list = <BigInt>[]; r.beginArray(); while (r.hasNextElement()) { list.add(r.readInt64()); } r.endArray(); return list; }(); break;
        case 'tags': tagsVal = () { final list = <String>[]; r.beginArray(); while (r.hasNextElement()) { list.add(r.readString()); } r.endArray(); return list; }(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return MultiArr4(ids: idsVal, tags: tagsVal);
  },
);

class MultiArr5 {
  final List<BigInt> xs;
  final List<double> ys;
  final List<bool> zs;
  MultiArr5({required this.xs, required this.ys, required this.zs});
}

void writeMultiArr5(SpecWriter w, MultiArr5 obj) {
  w.beginObject(3);
  w.writeField('xs'); w.beginArray(obj.xs.length); for (final item in obj.xs) { w.nextElement(); w.writeUint64(item); } w.endArray();
  w.writeField('ys'); w.beginArray(obj.ys.length); for (final item in obj.ys) { w.nextElement(); w.writeFloat32(item); } w.endArray();
  w.writeField('zs'); w.beginArray(obj.zs.length); for (final item in obj.zs) { w.nextElement(); w.writeBool(item); } w.endArray();
  w.endObject();
}

final SpecCodec<MultiArr5> MultiArr5Codec = SpecCodec<MultiArr5>(
  encode: (w, obj) => writeMultiArr5(w, obj),
  decode: (r) {
    List<BigInt> xsVal = [];
    List<double> ysVal = [];
    List<bool> zsVal = [];
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'xs': xsVal = () { final list = <BigInt>[]; r.beginArray(); while (r.hasNextElement()) { list.add(r.readUint64()); } r.endArray(); return list; }(); break;
        case 'ys': ysVal = () { final list = <double>[]; r.beginArray(); while (r.hasNextElement()) { list.add(r.readFloat32()); } r.endArray(); return list; }(); break;
        case 'zs': zsVal = () { final list = <bool>[]; r.beginArray(); while (r.hasNextElement()) { list.add(r.readBool()); } r.endArray(); return list; }(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return MultiArr5(xs: xsVal, ys: ysVal, zs: zsVal);
  },
);

class OptCombo1 {
  final String req;
  final int? opt_a;
  OptCombo1({required this.req, this.opt_a});
}

void writeOptCombo1(SpecWriter w, OptCombo1 obj) {
  var fieldCount = 1;
  if (obj.opt_a != null) fieldCount++;
  w.beginObject(fieldCount);
  w.writeField('req'); w.writeString(obj.req);
  if (obj.opt_a != null) { w.writeField('opt_a'); w.writeInt32(obj.opt_a!); }
  w.endObject();
}

final SpecCodec<OptCombo1> OptCombo1Codec = SpecCodec<OptCombo1>(
  encode: (w, obj) => writeOptCombo1(w, obj),
  decode: (r) {
    String reqVal = '';
    int? opt_aVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'req': reqVal = r.readString(); break;
        case 'opt_a': opt_aVal = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptCombo1(req: reqVal, opt_a: opt_aVal);
  },
);

class OptCombo2 {
  final String req;
  final int? opt_a;
  final bool? opt_b;
  OptCombo2({required this.req, this.opt_a, this.opt_b});
}

void writeOptCombo2(SpecWriter w, OptCombo2 obj) {
  var fieldCount = 1;
  if (obj.opt_a != null) fieldCount++;
  if (obj.opt_b != null) fieldCount++;
  w.beginObject(fieldCount);
  w.writeField('req'); w.writeString(obj.req);
  if (obj.opt_a != null) { w.writeField('opt_a'); w.writeInt32(obj.opt_a!); }
  if (obj.opt_b != null) { w.writeField('opt_b'); w.writeBool(obj.opt_b!); }
  w.endObject();
}

final SpecCodec<OptCombo2> OptCombo2Codec = SpecCodec<OptCombo2>(
  encode: (w, obj) => writeOptCombo2(w, obj),
  decode: (r) {
    String reqVal = '';
    int? opt_aVal;
    bool? opt_bVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'req': reqVal = r.readString(); break;
        case 'opt_a': opt_aVal = r.readInt32(); break;
        case 'opt_b': opt_bVal = r.readBool(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptCombo2(req: reqVal, opt_a: opt_aVal, opt_b: opt_bVal);
  },
);

class OptCombo3 {
  final String req;
  final int? opt_a;
  final bool? opt_b;
  final double? opt_c;
  OptCombo3({required this.req, this.opt_a, this.opt_b, this.opt_c});
}

void writeOptCombo3(SpecWriter w, OptCombo3 obj) {
  var fieldCount = 1;
  if (obj.opt_a != null) fieldCount++;
  if (obj.opt_b != null) fieldCount++;
  if (obj.opt_c != null) fieldCount++;
  w.beginObject(fieldCount);
  w.writeField('req'); w.writeString(obj.req);
  if (obj.opt_a != null) { w.writeField('opt_a'); w.writeInt32(obj.opt_a!); }
  if (obj.opt_b != null) { w.writeField('opt_b'); w.writeBool(obj.opt_b!); }
  if (obj.opt_c != null) { w.writeField('opt_c'); w.writeFloat64(obj.opt_c!); }
  w.endObject();
}

final SpecCodec<OptCombo3> OptCombo3Codec = SpecCodec<OptCombo3>(
  encode: (w, obj) => writeOptCombo3(w, obj),
  decode: (r) {
    String reqVal = '';
    int? opt_aVal;
    bool? opt_bVal;
    double? opt_cVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'req': reqVal = r.readString(); break;
        case 'opt_a': opt_aVal = r.readInt32(); break;
        case 'opt_b': opt_bVal = r.readBool(); break;
        case 'opt_c': opt_cVal = r.readFloat64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptCombo3(req: reqVal, opt_a: opt_aVal, opt_b: opt_bVal, opt_c: opt_cVal);
  },
);

class OptCombo4 {
  final int req;
  final String? opt_a;
  final Uint8List? opt_b;
  OptCombo4({required this.req, this.opt_a, this.opt_b});
}

void writeOptCombo4(SpecWriter w, OptCombo4 obj) {
  var fieldCount = 1;
  if (obj.opt_a != null) fieldCount++;
  if (obj.opt_b != null) fieldCount++;
  w.beginObject(fieldCount);
  w.writeField('req'); w.writeInt32(obj.req);
  if (obj.opt_a != null) { w.writeField('opt_a'); w.writeString(obj.opt_a!); }
  if (obj.opt_b != null) { w.writeField('opt_b'); w.writeBytes(obj.opt_b!); }
  w.endObject();
}

final SpecCodec<OptCombo4> OptCombo4Codec = SpecCodec<OptCombo4>(
  encode: (w, obj) => writeOptCombo4(w, obj),
  decode: (r) {
    int reqVal = 0;
    String? opt_aVal;
    Uint8List? opt_bVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'req': reqVal = r.readInt32(); break;
        case 'opt_a': opt_aVal = r.readString(); break;
        case 'opt_b': opt_bVal = r.readBytes(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptCombo4(req: reqVal, opt_a: opt_aVal, opt_b: opt_bVal);
  },
);

class OptCombo5 {
  final String req1;
  final int req2;
  final bool? opt_a;
  final double? opt_b;
  OptCombo5({required this.req1, required this.req2, this.opt_a, this.opt_b});
}

void writeOptCombo5(SpecWriter w, OptCombo5 obj) {
  var fieldCount = 2;
  if (obj.opt_a != null) fieldCount++;
  if (obj.opt_b != null) fieldCount++;
  w.beginObject(fieldCount);
  w.writeField('req1'); w.writeString(obj.req1);
  w.writeField('req2'); w.writeInt32(obj.req2);
  if (obj.opt_a != null) { w.writeField('opt_a'); w.writeBool(obj.opt_a!); }
  if (obj.opt_b != null) { w.writeField('opt_b'); w.writeFloat64(obj.opt_b!); }
  w.endObject();
}

final SpecCodec<OptCombo5> OptCombo5Codec = SpecCodec<OptCombo5>(
  encode: (w, obj) => writeOptCombo5(w, obj),
  decode: (r) {
    String req1Val = '';
    int req2Val = 0;
    bool? opt_aVal;
    double? opt_bVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'req1': req1Val = r.readString(); break;
        case 'req2': req2Val = r.readInt32(); break;
        case 'opt_a': opt_aVal = r.readBool(); break;
        case 'opt_b': opt_bVal = r.readFloat64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptCombo5(req1: req1Val, req2: req2Val, opt_a: opt_aVal, opt_b: opt_bVal);
  },
);

class OptCombo6 {
  final String req;
  final String? opt_s;
  final int? opt_i;
  final double? opt_f;
  final Uint8List? opt_b;
  OptCombo6({required this.req, this.opt_s, this.opt_i, this.opt_f, this.opt_b});
}

void writeOptCombo6(SpecWriter w, OptCombo6 obj) {
  var fieldCount = 1;
  if (obj.opt_s != null) fieldCount++;
  if (obj.opt_i != null) fieldCount++;
  if (obj.opt_f != null) fieldCount++;
  if (obj.opt_b != null) fieldCount++;
  w.beginObject(fieldCount);
  w.writeField('req'); w.writeString(obj.req);
  if (obj.opt_s != null) { w.writeField('opt_s'); w.writeString(obj.opt_s!); }
  if (obj.opt_i != null) { w.writeField('opt_i'); w.writeInt32(obj.opt_i!); }
  if (obj.opt_f != null) { w.writeField('opt_f'); w.writeFloat64(obj.opt_f!); }
  if (obj.opt_b != null) { w.writeField('opt_b'); w.writeBytes(obj.opt_b!); }
  w.endObject();
}

final SpecCodec<OptCombo6> OptCombo6Codec = SpecCodec<OptCombo6>(
  encode: (w, obj) => writeOptCombo6(w, obj),
  decode: (r) {
    String reqVal = '';
    String? opt_sVal;
    int? opt_iVal;
    double? opt_fVal;
    Uint8List? opt_bVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'req': reqVal = r.readString(); break;
        case 'opt_s': opt_sVal = r.readString(); break;
        case 'opt_i': opt_iVal = r.readInt32(); break;
        case 'opt_f': opt_fVal = r.readFloat64(); break;
        case 'opt_b': opt_bVal = r.readBytes(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptCombo6(req: reqVal, opt_s: opt_sVal, opt_i: opt_iVal, opt_f: opt_fVal, opt_b: opt_bVal);
  },
);

class OptCombo7 {
  final BigInt req;
  final BigInt? opt_u64;
  final String? opt_str;
  OptCombo7({required this.req, this.opt_u64, this.opt_str});
}

void writeOptCombo7(SpecWriter w, OptCombo7 obj) {
  var fieldCount = 1;
  if (obj.opt_u64 != null) fieldCount++;
  if (obj.opt_str != null) fieldCount++;
  w.beginObject(fieldCount);
  w.writeField('req'); w.writeInt64(obj.req);
  if (obj.opt_u64 != null) { w.writeField('opt_u64'); w.writeUint64(obj.opt_u64!); }
  if (obj.opt_str != null) { w.writeField('opt_str'); w.writeString(obj.opt_str!); }
  w.endObject();
}

final SpecCodec<OptCombo7> OptCombo7Codec = SpecCodec<OptCombo7>(
  encode: (w, obj) => writeOptCombo7(w, obj),
  decode: (r) {
    BigInt reqVal = BigInt.zero;
    BigInt? opt_u64Val;
    String? opt_strVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'req': reqVal = r.readInt64(); break;
        case 'opt_u64': opt_u64Val = r.readUint64(); break;
        case 'opt_str': opt_strVal = r.readString(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptCombo7(req: reqVal, opt_u64: opt_u64Val, opt_str: opt_strVal);
  },
);

class OptCombo8 {
  final String a;
  final int? b;
  final double? c;
  final bool? d;
  final Uint8List? e;
  final BigInt? f;
  OptCombo8({required this.a, this.b, this.c, this.d, this.e, this.f});
}

void writeOptCombo8(SpecWriter w, OptCombo8 obj) {
  var fieldCount = 1;
  if (obj.b != null) fieldCount++;
  if (obj.c != null) fieldCount++;
  if (obj.d != null) fieldCount++;
  if (obj.e != null) fieldCount++;
  if (obj.f != null) fieldCount++;
  w.beginObject(fieldCount);
  w.writeField('a'); w.writeString(obj.a);
  if (obj.b != null) { w.writeField('b'); w.writeInt32(obj.b!); }
  if (obj.c != null) { w.writeField('c'); w.writeFloat64(obj.c!); }
  if (obj.d != null) { w.writeField('d'); w.writeBool(obj.d!); }
  if (obj.e != null) { w.writeField('e'); w.writeBytes(obj.e!); }
  if (obj.f != null) { w.writeField('f'); w.writeInt64(obj.f!); }
  w.endObject();
}

final SpecCodec<OptCombo8> OptCombo8Codec = SpecCodec<OptCombo8>(
  encode: (w, obj) => writeOptCombo8(w, obj),
  decode: (r) {
    String aVal = '';
    int? bVal;
    double? cVal;
    bool? dVal;
    Uint8List? eVal;
    BigInt? fVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readString(); break;
        case 'b': bVal = r.readInt32(); break;
        case 'c': cVal = r.readFloat64(); break;
        case 'd': dVal = r.readBool(); break;
        case 'e': eVal = r.readBytes(); break;
        case 'f': fVal = r.readInt64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptCombo8(a: aVal, b: bVal, c: cVal, d: dVal, e: eVal, f: fVal);
  },
);

class OptCombo9 {
  final String id;
  final String? name;
  final int? age;
  final double? score;
  OptCombo9({required this.id, this.name, this.age, this.score});
}

void writeOptCombo9(SpecWriter w, OptCombo9 obj) {
  var fieldCount = 1;
  if (obj.name != null) fieldCount++;
  if (obj.age != null) fieldCount++;
  if (obj.score != null) fieldCount++;
  w.beginObject(fieldCount);
  w.writeField('id'); w.writeString(obj.id);
  if (obj.name != null) { w.writeField('name'); w.writeString(obj.name!); }
  if (obj.age != null) { w.writeField('age'); w.writeInt32(obj.age!); }
  if (obj.score != null) { w.writeField('score'); w.writeFloat64(obj.score!); }
  w.endObject();
}

final SpecCodec<OptCombo9> OptCombo9Codec = SpecCodec<OptCombo9>(
  encode: (w, obj) => writeOptCombo9(w, obj),
  decode: (r) {
    String idVal = '';
    String? nameVal;
    int? ageVal;
    double? scoreVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'id': idVal = r.readString(); break;
        case 'name': nameVal = r.readString(); break;
        case 'age': ageVal = r.readInt32(); break;
        case 'score': scoreVal = r.readFloat64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptCombo9(id: idVal, name: nameVal, age: ageVal, score: scoreVal);
  },
);

class OptCombo10 {
  final int code;
  final String? msg;
  final String? detail;
  final bool? retry;
  OptCombo10({required this.code, this.msg, this.detail, this.retry});
}

void writeOptCombo10(SpecWriter w, OptCombo10 obj) {
  var fieldCount = 1;
  if (obj.msg != null) fieldCount++;
  if (obj.detail != null) fieldCount++;
  if (obj.retry != null) fieldCount++;
  w.beginObject(fieldCount);
  w.writeField('code'); w.writeInt32(obj.code);
  if (obj.msg != null) { w.writeField('msg'); w.writeString(obj.msg!); }
  if (obj.detail != null) { w.writeField('detail'); w.writeString(obj.detail!); }
  if (obj.retry != null) { w.writeField('retry'); w.writeBool(obj.retry!); }
  w.endObject();
}

final SpecCodec<OptCombo10> OptCombo10Codec = SpecCodec<OptCombo10>(
  encode: (w, obj) => writeOptCombo10(w, obj),
  decode: (r) {
    int codeVal = 0;
    String? msgVal;
    String? detailVal;
    bool? retryVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'code': codeVal = r.readInt32(); break;
        case 'msg': msgVal = r.readString(); break;
        case 'detail': detailVal = r.readString(); break;
        case 'retry': retryVal = r.readBool(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptCombo10(code: codeVal, msg: msgVal, detail: detailVal, retry: retryVal);
  },
);

class NestInner {
  final Inner nested;
  NestInner({required this.nested});
}

void writeNestInner(SpecWriter w, NestInner obj) {
  w.beginObject(1);
  w.writeField('nested'); writeInner(w, obj.nested);
  w.endObject();
}

final SpecCodec<NestInner> NestInnerCodec = SpecCodec<NestInner>(
  encode: (w, obj) => writeNestInner(w, obj),
  decode: (r) {
    late Inner nestedVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'nested': nestedVal = InnerCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return NestInner(nested: nestedVal);
  },
);

class NestCoord {
  final Coord nested;
  NestCoord({required this.nested});
}

void writeNestCoord(SpecWriter w, NestCoord obj) {
  w.beginObject(1);
  w.writeField('nested'); writeCoord(w, obj.nested);
  w.endObject();
}

final SpecCodec<NestCoord> NestCoordCodec = SpecCodec<NestCoord>(
  encode: (w, obj) => writeNestCoord(w, obj),
  decode: (r) {
    late Coord nestedVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'nested': nestedVal = CoordCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return NestCoord(nested: nestedVal);
  },
);

class NestIdVal {
  final IdVal nested;
  NestIdVal({required this.nested});
}

void writeNestIdVal(SpecWriter w, NestIdVal obj) {
  w.beginObject(1);
  w.writeField('nested'); writeIdVal(w, obj.nested);
  w.endObject();
}

final SpecCodec<NestIdVal> NestIdValCodec = SpecCodec<NestIdVal>(
  encode: (w, obj) => writeNestIdVal(w, obj),
  decode: (r) {
    late IdVal nestedVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'nested': nestedVal = IdValCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return NestIdVal(nested: nestedVal);
  },
);

class NestLabel {
  final Label nested;
  NestLabel({required this.nested});
}

void writeNestLabel(SpecWriter w, NestLabel obj) {
  w.beginObject(1);
  w.writeField('nested'); writeLabel(w, obj.nested);
  w.endObject();
}

final SpecCodec<NestLabel> NestLabelCodec = SpecCodec<NestLabel>(
  encode: (w, obj) => writeNestLabel(w, obj),
  decode: (r) {
    late Label nestedVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'nested': nestedVal = LabelCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return NestLabel(nested: nestedVal);
  },
);

class NestMoney {
  final Money nested;
  NestMoney({required this.nested});
}

void writeNestMoney(SpecWriter w, NestMoney obj) {
  w.beginObject(1);
  w.writeField('nested'); writeMoney(w, obj.nested);
  w.endObject();
}

final SpecCodec<NestMoney> NestMoneyCodec = SpecCodec<NestMoney>(
  encode: (w, obj) => writeNestMoney(w, obj),
  decode: (r) {
    late Money nestedVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'nested': nestedVal = MoneyCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return NestMoney(nested: nestedVal);
  },
);

class NestRange32 {
  final Range32 nested;
  NestRange32({required this.nested});
}

void writeNestRange32(SpecWriter w, NestRange32 obj) {
  w.beginObject(1);
  w.writeField('nested'); writeRange32(w, obj.nested);
  w.endObject();
}

final SpecCodec<NestRange32> NestRange32Codec = SpecCodec<NestRange32>(
  encode: (w, obj) => writeNestRange32(w, obj),
  decode: (r) {
    late Range32 nestedVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'nested': nestedVal = Range32Codec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return NestRange32(nested: nestedVal);
  },
);

class NestAddr {
  final Addr nested;
  NestAddr({required this.nested});
}

void writeNestAddr(SpecWriter w, NestAddr obj) {
  w.beginObject(1);
  w.writeField('nested'); writeAddr(w, obj.nested);
  w.endObject();
}

final SpecCodec<NestAddr> NestAddrCodec = SpecCodec<NestAddr>(
  encode: (w, obj) => writeNestAddr(w, obj),
  decode: (r) {
    late Addr nestedVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'nested': nestedVal = AddrCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return NestAddr(nested: nestedVal);
  },
);

class NestPoint3 {
  final Point3 nested;
  NestPoint3({required this.nested});
}

void writeNestPoint3(SpecWriter w, NestPoint3 obj) {
  w.beginObject(1);
  w.writeField('nested'); writePoint3(w, obj.nested);
  w.endObject();
}

final SpecCodec<NestPoint3> NestPoint3Codec = SpecCodec<NestPoint3>(
  encode: (w, obj) => writeNestPoint3(w, obj),
  decode: (r) {
    late Point3 nestedVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'nested': nestedVal = Point3Codec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return NestPoint3(nested: nestedVal);
  },
);

class OptNestInner {
  final String label;
  final Inner? nested;
  OptNestInner({required this.label, this.nested});
}

void writeOptNestInner(SpecWriter w, OptNestInner obj) {
  var fieldCount = 1;
  if (obj.nested != null) fieldCount++;
  w.beginObject(fieldCount);
  w.writeField('label'); w.writeString(obj.label);
  if (obj.nested != null) { w.writeField('nested'); writeInner(w, obj.nested!); }
  w.endObject();
}

final SpecCodec<OptNestInner> OptNestInnerCodec = SpecCodec<OptNestInner>(
  encode: (w, obj) => writeOptNestInner(w, obj),
  decode: (r) {
    String labelVal = '';
    Inner? nestedVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'label': labelVal = r.readString(); break;
        case 'nested': nestedVal = r.isNull() ? (() { r.readNull(); return null; })() : InnerCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptNestInner(label: labelVal, nested: nestedVal);
  },
);

class OptNestCoord {
  final String label;
  final Coord? nested;
  OptNestCoord({required this.label, this.nested});
}

void writeOptNestCoord(SpecWriter w, OptNestCoord obj) {
  var fieldCount = 1;
  if (obj.nested != null) fieldCount++;
  w.beginObject(fieldCount);
  w.writeField('label'); w.writeString(obj.label);
  if (obj.nested != null) { w.writeField('nested'); writeCoord(w, obj.nested!); }
  w.endObject();
}

final SpecCodec<OptNestCoord> OptNestCoordCodec = SpecCodec<OptNestCoord>(
  encode: (w, obj) => writeOptNestCoord(w, obj),
  decode: (r) {
    String labelVal = '';
    Coord? nestedVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'label': labelVal = r.readString(); break;
        case 'nested': nestedVal = r.isNull() ? (() { r.readNull(); return null; })() : CoordCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptNestCoord(label: labelVal, nested: nestedVal);
  },
);

class OptNestIdVal {
  final String label;
  final IdVal? nested;
  OptNestIdVal({required this.label, this.nested});
}

void writeOptNestIdVal(SpecWriter w, OptNestIdVal obj) {
  var fieldCount = 1;
  if (obj.nested != null) fieldCount++;
  w.beginObject(fieldCount);
  w.writeField('label'); w.writeString(obj.label);
  if (obj.nested != null) { w.writeField('nested'); writeIdVal(w, obj.nested!); }
  w.endObject();
}

final SpecCodec<OptNestIdVal> OptNestIdValCodec = SpecCodec<OptNestIdVal>(
  encode: (w, obj) => writeOptNestIdVal(w, obj),
  decode: (r) {
    String labelVal = '';
    IdVal? nestedVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'label': labelVal = r.readString(); break;
        case 'nested': nestedVal = r.isNull() ? (() { r.readNull(); return null; })() : IdValCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptNestIdVal(label: labelVal, nested: nestedVal);
  },
);

class OptNestLabel {
  final String label;
  final Label? nested;
  OptNestLabel({required this.label, this.nested});
}

void writeOptNestLabel(SpecWriter w, OptNestLabel obj) {
  var fieldCount = 1;
  if (obj.nested != null) fieldCount++;
  w.beginObject(fieldCount);
  w.writeField('label'); w.writeString(obj.label);
  if (obj.nested != null) { w.writeField('nested'); writeLabel(w, obj.nested!); }
  w.endObject();
}

final SpecCodec<OptNestLabel> OptNestLabelCodec = SpecCodec<OptNestLabel>(
  encode: (w, obj) => writeOptNestLabel(w, obj),
  decode: (r) {
    String labelVal = '';
    Label? nestedVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'label': labelVal = r.readString(); break;
        case 'nested': nestedVal = r.isNull() ? (() { r.readNull(); return null; })() : LabelCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptNestLabel(label: labelVal, nested: nestedVal);
  },
);

class OptNestMoney {
  final String label;
  final Money? nested;
  OptNestMoney({required this.label, this.nested});
}

void writeOptNestMoney(SpecWriter w, OptNestMoney obj) {
  var fieldCount = 1;
  if (obj.nested != null) fieldCount++;
  w.beginObject(fieldCount);
  w.writeField('label'); w.writeString(obj.label);
  if (obj.nested != null) { w.writeField('nested'); writeMoney(w, obj.nested!); }
  w.endObject();
}

final SpecCodec<OptNestMoney> OptNestMoneyCodec = SpecCodec<OptNestMoney>(
  encode: (w, obj) => writeOptNestMoney(w, obj),
  decode: (r) {
    String labelVal = '';
    Money? nestedVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'label': labelVal = r.readString(); break;
        case 'nested': nestedVal = r.isNull() ? (() { r.readNull(); return null; })() : MoneyCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptNestMoney(label: labelVal, nested: nestedVal);
  },
);

class OptNestRange32 {
  final String label;
  final Range32? nested;
  OptNestRange32({required this.label, this.nested});
}

void writeOptNestRange32(SpecWriter w, OptNestRange32 obj) {
  var fieldCount = 1;
  if (obj.nested != null) fieldCount++;
  w.beginObject(fieldCount);
  w.writeField('label'); w.writeString(obj.label);
  if (obj.nested != null) { w.writeField('nested'); writeRange32(w, obj.nested!); }
  w.endObject();
}

final SpecCodec<OptNestRange32> OptNestRange32Codec = SpecCodec<OptNestRange32>(
  encode: (w, obj) => writeOptNestRange32(w, obj),
  decode: (r) {
    String labelVal = '';
    Range32? nestedVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'label': labelVal = r.readString(); break;
        case 'nested': nestedVal = r.isNull() ? (() { r.readNull(); return null; })() : Range32Codec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptNestRange32(label: labelVal, nested: nestedVal);
  },
);

class OptNestAddr {
  final String label;
  final Addr? nested;
  OptNestAddr({required this.label, this.nested});
}

void writeOptNestAddr(SpecWriter w, OptNestAddr obj) {
  var fieldCount = 1;
  if (obj.nested != null) fieldCount++;
  w.beginObject(fieldCount);
  w.writeField('label'); w.writeString(obj.label);
  if (obj.nested != null) { w.writeField('nested'); writeAddr(w, obj.nested!); }
  w.endObject();
}

final SpecCodec<OptNestAddr> OptNestAddrCodec = SpecCodec<OptNestAddr>(
  encode: (w, obj) => writeOptNestAddr(w, obj),
  decode: (r) {
    String labelVal = '';
    Addr? nestedVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'label': labelVal = r.readString(); break;
        case 'nested': nestedVal = r.isNull() ? (() { r.readNull(); return null; })() : AddrCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptNestAddr(label: labelVal, nested: nestedVal);
  },
);

class OptNestPoint3 {
  final String label;
  final Point3? nested;
  OptNestPoint3({required this.label, this.nested});
}

void writeOptNestPoint3(SpecWriter w, OptNestPoint3 obj) {
  var fieldCount = 1;
  if (obj.nested != null) fieldCount++;
  w.beginObject(fieldCount);
  w.writeField('label'); w.writeString(obj.label);
  if (obj.nested != null) { w.writeField('nested'); writePoint3(w, obj.nested!); }
  w.endObject();
}

final SpecCodec<OptNestPoint3> OptNestPoint3Codec = SpecCodec<OptNestPoint3>(
  encode: (w, obj) => writeOptNestPoint3(w, obj),
  decode: (r) {
    String labelVal = '';
    Point3? nestedVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'label': labelVal = r.readString(); break;
        case 'nested': nestedVal = r.isNull() ? (() { r.readNull(); return null; })() : Point3Codec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptNestPoint3(label: labelVal, nested: nestedVal);
  },
);

class ModelArr1 {
  final List<Inner> points;
  ModelArr1({required this.points});
}

void writeModelArr1(SpecWriter w, ModelArr1 obj) {
  w.beginObject(1);
  w.writeField('points'); w.beginArray(obj.points.length); for (final item in obj.points) { w.nextElement(); writeInner(w, item); } w.endArray();
  w.endObject();
}

final SpecCodec<ModelArr1> ModelArr1Codec = SpecCodec<ModelArr1>(
  encode: (w, obj) => writeModelArr1(w, obj),
  decode: (r) {
    List<Inner> pointsVal = [];
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'points': pointsVal = () { final list = <Inner>[]; r.beginArray(); while (r.hasNextElement()) { list.add(InnerCodec.decode(r)); } r.endArray(); return list; }(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return ModelArr1(points: pointsVal);
  },
);

class ModelArr2 {
  final List<Coord> coords;
  ModelArr2({required this.coords});
}

void writeModelArr2(SpecWriter w, ModelArr2 obj) {
  w.beginObject(1);
  w.writeField('coords'); w.beginArray(obj.coords.length); for (final item in obj.coords) { w.nextElement(); writeCoord(w, item); } w.endArray();
  w.endObject();
}

final SpecCodec<ModelArr2> ModelArr2Codec = SpecCodec<ModelArr2>(
  encode: (w, obj) => writeModelArr2(w, obj),
  decode: (r) {
    List<Coord> coordsVal = [];
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'coords': coordsVal = () { final list = <Coord>[]; r.beginArray(); while (r.hasNextElement()) { list.add(CoordCodec.decode(r)); } r.endArray(); return list; }(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return ModelArr2(coords: coordsVal);
  },
);

class ModelArr3 {
  final List<IdVal> items;
  final String tag;
  ModelArr3({required this.items, required this.tag});
}

void writeModelArr3(SpecWriter w, ModelArr3 obj) {
  w.beginObject(2);
  w.writeField('items'); w.beginArray(obj.items.length); for (final item in obj.items) { w.nextElement(); writeIdVal(w, item); } w.endArray();
  w.writeField('tag'); w.writeString(obj.tag);
  w.endObject();
}

final SpecCodec<ModelArr3> ModelArr3Codec = SpecCodec<ModelArr3>(
  encode: (w, obj) => writeModelArr3(w, obj),
  decode: (r) {
    List<IdVal> itemsVal = [];
    String tagVal = '';
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'items': itemsVal = () { final list = <IdVal>[]; r.beginArray(); while (r.hasNextElement()) { list.add(IdValCodec.decode(r)); } r.endArray(); return list; }(); break;
        case 'tag': tagVal = r.readString(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return ModelArr3(items: itemsVal, tag: tagVal);
  },
);

class ModelArr4 {
  final List<Label> labels;
  final int count;
  ModelArr4({required this.labels, required this.count});
}

void writeModelArr4(SpecWriter w, ModelArr4 obj) {
  w.beginObject(2);
  w.writeField('labels'); w.beginArray(obj.labels.length); for (final item in obj.labels) { w.nextElement(); writeLabel(w, item); } w.endArray();
  w.writeField('count'); w.writeInt32(obj.count);
  w.endObject();
}

final SpecCodec<ModelArr4> ModelArr4Codec = SpecCodec<ModelArr4>(
  encode: (w, obj) => writeModelArr4(w, obj),
  decode: (r) {
    List<Label> labelsVal = [];
    int countVal = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'labels': labelsVal = () { final list = <Label>[]; r.beginArray(); while (r.hasNextElement()) { list.add(LabelCodec.decode(r)); } r.endArray(); return list; }(); break;
        case 'count': countVal = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return ModelArr4(labels: labelsVal, count: countVal);
  },
);

class ModelArr5 {
  final List<Money> arr;
  final List<Addr> bs;
  ModelArr5({required this.arr, required this.bs});
}

void writeModelArr5(SpecWriter w, ModelArr5 obj) {
  w.beginObject(2);
  w.writeField('arr'); w.beginArray(obj.arr.length); for (final item in obj.arr) { w.nextElement(); writeMoney(w, item); } w.endArray();
  w.writeField('bs'); w.beginArray(obj.bs.length); for (final item in obj.bs) { w.nextElement(); writeAddr(w, item); } w.endArray();
  w.endObject();
}

final SpecCodec<ModelArr5> ModelArr5Codec = SpecCodec<ModelArr5>(
  encode: (w, obj) => writeModelArr5(w, obj),
  decode: (r) {
    List<Money> arrVal = [];
    List<Addr> bsVal = [];
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'arr': arrVal = () { final list = <Money>[]; r.beginArray(); while (r.hasNextElement()) { list.add(MoneyCodec.decode(r)); } r.endArray(); return list; }(); break;
        case 'bs': bsVal = () { final list = <Addr>[]; r.beginArray(); while (r.hasNextElement()) { list.add(AddrCodec.decode(r)); } r.endArray(); return list; }(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return ModelArr5(arr: arrVal, bs: bsVal);
  },
);

class Mix01 {
  final String name;
  final int value;
  final Inner point;
  Mix01({required this.name, required this.value, required this.point});
}

void writeMix01(SpecWriter w, Mix01 obj) {
  w.beginObject(3);
  w.writeField('name'); w.writeString(obj.name);
  w.writeField('value'); w.writeInt32(obj.value);
  w.writeField('point'); writeInner(w, obj.point);
  w.endObject();
}

final SpecCodec<Mix01> Mix01Codec = SpecCodec<Mix01>(
  encode: (w, obj) => writeMix01(w, obj),
  decode: (r) {
    String nameVal = '';
    int valueVal = 0;
    late Inner pointVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'name': nameVal = r.readString(); break;
        case 'value': valueVal = r.readInt32(); break;
        case 'point': pointVal = InnerCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Mix01(name: nameVal, value: valueVal, point: pointVal);
  },
);

class Mix02 {
  final String id;
  final Coord loc;
  final List<String> tags;
  Mix02({required this.id, required this.loc, required this.tags});
}

void writeMix02(SpecWriter w, Mix02 obj) {
  w.beginObject(3);
  w.writeField('id'); w.writeString(obj.id);
  w.writeField('loc'); writeCoord(w, obj.loc);
  w.writeField('tags'); w.beginArray(obj.tags.length); for (final item in obj.tags) { w.nextElement(); w.writeString(item); } w.endArray();
  w.endObject();
}

final SpecCodec<Mix02> Mix02Codec = SpecCodec<Mix02>(
  encode: (w, obj) => writeMix02(w, obj),
  decode: (r) {
    String idVal = '';
    late Coord locVal;
    List<String> tagsVal = [];
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'id': idVal = r.readString(); break;
        case 'loc': locVal = CoordCodec.decode(r); break;
        case 'tags': tagsVal = () { final list = <String>[]; r.beginArray(); while (r.hasNextElement()) { list.add(r.readString()); } r.endArray(); return list; }(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Mix02(id: idVal, loc: locVal, tags: tagsVal);
  },
);

class Mix03 {
  final String label;
  final Range32 value_range;
  final bool active;
  Mix03({required this.label, required this.value_range, required this.active});
}

void writeMix03(SpecWriter w, Mix03 obj) {
  w.beginObject(3);
  w.writeField('label'); w.writeString(obj.label);
  w.writeField('value_range'); writeRange32(w, obj.value_range);
  w.writeField('active'); w.writeBool(obj.active);
  w.endObject();
}

final SpecCodec<Mix03> Mix03Codec = SpecCodec<Mix03>(
  encode: (w, obj) => writeMix03(w, obj),
  decode: (r) {
    String labelVal = '';
    late Range32 value_rangeVal;
    bool activeVal = false;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'label': labelVal = r.readString(); break;
        case 'value_range': value_rangeVal = Range32Codec.decode(r); break;
        case 'active': activeVal = r.readBool(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Mix03(label: labelVal, value_range: value_rangeVal, active: activeVal);
  },
);

class Mix04 {
  final String title;
  final Money price;
  final bool inStock;
  final double rating;
  Mix04({required this.title, required this.price, required this.inStock, required this.rating});
}

void writeMix04(SpecWriter w, Mix04 obj) {
  w.beginObject(4);
  w.writeField('title'); w.writeString(obj.title);
  w.writeField('price'); writeMoney(w, obj.price);
  w.writeField('inStock'); w.writeBool(obj.inStock);
  w.writeField('rating'); w.writeFloat64(obj.rating);
  w.endObject();
}

final SpecCodec<Mix04> Mix04Codec = SpecCodec<Mix04>(
  encode: (w, obj) => writeMix04(w, obj),
  decode: (r) {
    String titleVal = '';
    late Money priceVal;
    bool inStockVal = false;
    double ratingVal = 0.0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'title': titleVal = r.readString(); break;
        case 'price': priceVal = MoneyCodec.decode(r); break;
        case 'inStock': inStockVal = r.readBool(); break;
        case 'rating': ratingVal = r.readFloat64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Mix04(title: titleVal, price: priceVal, inStock: inStockVal, rating: ratingVal);
  },
);

class Mix05 {
  final Addr addr;
  final List<Coord> coords;
  Mix05({required this.addr, required this.coords});
}

void writeMix05(SpecWriter w, Mix05 obj) {
  w.beginObject(2);
  w.writeField('addr'); writeAddr(w, obj.addr);
  w.writeField('coords'); w.beginArray(obj.coords.length); for (final item in obj.coords) { w.nextElement(); writeCoord(w, item); } w.endArray();
  w.endObject();
}

final SpecCodec<Mix05> Mix05Codec = SpecCodec<Mix05>(
  encode: (w, obj) => writeMix05(w, obj),
  decode: (r) {
    late Addr addrVal;
    List<Coord> coordsVal = [];
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'addr': addrVal = AddrCodec.decode(r); break;
        case 'coords': coordsVal = () { final list = <Coord>[]; r.beginArray(); while (r.hasNextElement()) { list.add(CoordCodec.decode(r)); } r.endArray(); return list; }(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Mix05(addr: addrVal, coords: coordsVal);
  },
);

class Mix06 {
  final String name;
  final int age;
  final Addr? address;
  final String? email;
  Mix06({required this.name, required this.age, this.address, this.email});
}

void writeMix06(SpecWriter w, Mix06 obj) {
  var fieldCount = 2;
  if (obj.address != null) fieldCount++;
  if (obj.email != null) fieldCount++;
  w.beginObject(fieldCount);
  w.writeField('name'); w.writeString(obj.name);
  w.writeField('age'); w.writeInt32(obj.age);
  if (obj.address != null) { w.writeField('address'); writeAddr(w, obj.address!); }
  if (obj.email != null) { w.writeField('email'); w.writeString(obj.email!); }
  w.endObject();
}

final SpecCodec<Mix06> Mix06Codec = SpecCodec<Mix06>(
  encode: (w, obj) => writeMix06(w, obj),
  decode: (r) {
    String nameVal = '';
    int ageVal = 0;
    Addr? addressVal;
    String? emailVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'name': nameVal = r.readString(); break;
        case 'age': ageVal = r.readInt32(); break;
        case 'address': addressVal = r.isNull() ? (() { r.readNull(); return null; })() : AddrCodec.decode(r); break;
        case 'email': emailVal = r.readString(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Mix06(name: nameVal, age: ageVal, address: addressVal, email: emailVal);
  },
);

class Mix07 {
  final Point3 origin;
  final Point3 dest;
  final double distance;
  Mix07({required this.origin, required this.dest, required this.distance});
}

void writeMix07(SpecWriter w, Mix07 obj) {
  w.beginObject(3);
  w.writeField('origin'); writePoint3(w, obj.origin);
  w.writeField('dest'); writePoint3(w, obj.dest);
  w.writeField('distance'); w.writeFloat64(obj.distance);
  w.endObject();
}

final SpecCodec<Mix07> Mix07Codec = SpecCodec<Mix07>(
  encode: (w, obj) => writeMix07(w, obj),
  decode: (r) {
    late Point3 originVal;
    late Point3 destVal;
    double distanceVal = 0.0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'origin': originVal = Point3Codec.decode(r); break;
        case 'dest': destVal = Point3Codec.decode(r); break;
        case 'distance': distanceVal = r.readFloat64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Mix07(origin: originVal, dest: destVal, distance: distanceVal);
  },
);

class Mix08 {
  final List<String> keys;
  final List<int> values;
  final Label? meta;
  Mix08({required this.keys, required this.values, this.meta});
}

void writeMix08(SpecWriter w, Mix08 obj) {
  var fieldCount = 2;
  if (obj.meta != null) fieldCount++;
  w.beginObject(fieldCount);
  w.writeField('keys'); w.beginArray(obj.keys.length); for (final item in obj.keys) { w.nextElement(); w.writeString(item); } w.endArray();
  w.writeField('values'); w.beginArray(obj.values.length); for (final item in obj.values) { w.nextElement(); w.writeInt32(item); } w.endArray();
  if (obj.meta != null) { w.writeField('meta'); writeLabel(w, obj.meta!); }
  w.endObject();
}

final SpecCodec<Mix08> Mix08Codec = SpecCodec<Mix08>(
  encode: (w, obj) => writeMix08(w, obj),
  decode: (r) {
    List<String> keysVal = [];
    List<int> valuesVal = [];
    Label? metaVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'keys': keysVal = () { final list = <String>[]; r.beginArray(); while (r.hasNextElement()) { list.add(r.readString()); } r.endArray(); return list; }(); break;
        case 'values': valuesVal = () { final list = <int>[]; r.beginArray(); while (r.hasNextElement()) { list.add(r.readInt32()); } r.endArray(); return list; }(); break;
        case 'meta': metaVal = r.isNull() ? (() { r.readNull(); return null; })() : LabelCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Mix08(keys: keysVal, values: valuesVal, meta: metaVal);
  },
);

class Mix09 {
  final BigInt id;
  final Uint8List payload;
  final int checksum;
  final IdVal? prev;
  Mix09({required this.id, required this.payload, required this.checksum, this.prev});
}

void writeMix09(SpecWriter w, Mix09 obj) {
  var fieldCount = 3;
  if (obj.prev != null) fieldCount++;
  w.beginObject(fieldCount);
  w.writeField('id'); w.writeInt64(obj.id);
  w.writeField('payload'); w.writeBytes(obj.payload);
  w.writeField('checksum'); w.writeUint32(obj.checksum);
  if (obj.prev != null) { w.writeField('prev'); writeIdVal(w, obj.prev!); }
  w.endObject();
}

final SpecCodec<Mix09> Mix09Codec = SpecCodec<Mix09>(
  encode: (w, obj) => writeMix09(w, obj),
  decode: (r) {
    BigInt idVal = BigInt.zero;
    Uint8List payloadVal = Uint8List(0);
    int checksumVal = 0;
    IdVal? prevVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'id': idVal = r.readInt64(); break;
        case 'payload': payloadVal = r.readBytes(); break;
        case 'checksum': checksumVal = r.readUint32(); break;
        case 'prev': prevVal = r.isNull() ? (() { r.readNull(); return null; })() : IdValCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Mix09(id: idVal, payload: payloadVal, checksum: checksumVal, prev: prevVal);
  },
);

class Mix10 {
  final List<String> items;
  final int total;
  final double avg;
  final Range32 value_range;
  Mix10({required this.items, required this.total, required this.avg, required this.value_range});
}

void writeMix10(SpecWriter w, Mix10 obj) {
  w.beginObject(4);
  w.writeField('items'); w.beginArray(obj.items.length); for (final item in obj.items) { w.nextElement(); w.writeString(item); } w.endArray();
  w.writeField('total'); w.writeInt32(obj.total);
  w.writeField('avg'); w.writeFloat64(obj.avg);
  w.writeField('value_range'); writeRange32(w, obj.value_range);
  w.endObject();
}

final SpecCodec<Mix10> Mix10Codec = SpecCodec<Mix10>(
  encode: (w, obj) => writeMix10(w, obj),
  decode: (r) {
    List<String> itemsVal = [];
    int totalVal = 0;
    double avgVal = 0.0;
    late Range32 value_rangeVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'items': itemsVal = () { final list = <String>[]; r.beginArray(); while (r.hasNextElement()) { list.add(r.readString()); } r.endArray(); return list; }(); break;
        case 'total': totalVal = r.readInt32(); break;
        case 'avg': avgVal = r.readFloat64(); break;
        case 'value_range': value_rangeVal = Range32Codec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Mix10(items: itemsVal, total: totalVal, avg: avgVal, value_range: value_rangeVal);
  },
);

class Mix11 {
  final String name;
  final List<double> values;
  final Inner? nested;
  final bool? flag;
  Mix11({required this.name, required this.values, this.nested, this.flag});
}

void writeMix11(SpecWriter w, Mix11 obj) {
  var fieldCount = 2;
  if (obj.nested != null) fieldCount++;
  if (obj.flag != null) fieldCount++;
  w.beginObject(fieldCount);
  w.writeField('name'); w.writeString(obj.name);
  w.writeField('values'); w.beginArray(obj.values.length); for (final item in obj.values) { w.nextElement(); w.writeFloat64(item); } w.endArray();
  if (obj.nested != null) { w.writeField('nested'); writeInner(w, obj.nested!); }
  if (obj.flag != null) { w.writeField('flag'); w.writeBool(obj.flag!); }
  w.endObject();
}

final SpecCodec<Mix11> Mix11Codec = SpecCodec<Mix11>(
  encode: (w, obj) => writeMix11(w, obj),
  decode: (r) {
    String nameVal = '';
    List<double> valuesVal = [];
    Inner? nestedVal;
    bool? flagVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'name': nameVal = r.readString(); break;
        case 'values': valuesVal = () { final list = <double>[]; r.beginArray(); while (r.hasNextElement()) { list.add(r.readFloat64()); } r.endArray(); return list; }(); break;
        case 'nested': nestedVal = r.isNull() ? (() { r.readNull(); return null; })() : InnerCodec.decode(r); break;
        case 'flag': flagVal = r.readBool(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Mix11(name: nameVal, values: valuesVal, nested: nestedVal, flag: flagVal);
  },
);

class Mix12 {
  final String header;
  final List<IdVal> entries;
  final String? footer;
  Mix12({required this.header, required this.entries, this.footer});
}

void writeMix12(SpecWriter w, Mix12 obj) {
  var fieldCount = 2;
  if (obj.footer != null) fieldCount++;
  w.beginObject(fieldCount);
  w.writeField('header'); w.writeString(obj.header);
  w.writeField('entries'); w.beginArray(obj.entries.length); for (final item in obj.entries) { w.nextElement(); writeIdVal(w, item); } w.endArray();
  if (obj.footer != null) { w.writeField('footer'); w.writeString(obj.footer!); }
  w.endObject();
}

final SpecCodec<Mix12> Mix12Codec = SpecCodec<Mix12>(
  encode: (w, obj) => writeMix12(w, obj),
  decode: (r) {
    String headerVal = '';
    List<IdVal> entriesVal = [];
    String? footerVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'header': headerVal = r.readString(); break;
        case 'entries': entriesVal = () { final list = <IdVal>[]; r.beginArray(); while (r.hasNextElement()) { list.add(IdValCodec.decode(r)); } r.endArray(); return list; }(); break;
        case 'footer': footerVal = r.readString(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Mix12(header: headerVal, entries: entriesVal, footer: footerVal);
  },
);

class Mix13 {
  final int a;
  final double b;
  final String c;
  final bool d;
  final Uint8List e;
  final Inner nested;
  Mix13({required this.a, required this.b, required this.c, required this.d, required this.e, required this.nested});
}

void writeMix13(SpecWriter w, Mix13 obj) {
  w.beginObject(6);
  w.writeField('a'); w.writeInt32(obj.a);
  w.writeField('b'); w.writeFloat64(obj.b);
  w.writeField('c'); w.writeString(obj.c);
  w.writeField('d'); w.writeBool(obj.d);
  w.writeField('e'); w.writeBytes(obj.e);
  w.writeField('nested'); writeInner(w, obj.nested);
  w.endObject();
}

final SpecCodec<Mix13> Mix13Codec = SpecCodec<Mix13>(
  encode: (w, obj) => writeMix13(w, obj),
  decode: (r) {
    int aVal = 0;
    double bVal = 0.0;
    String cVal = '';
    bool dVal = false;
    Uint8List eVal = Uint8List(0);
    late Inner nestedVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readInt32(); break;
        case 'b': bVal = r.readFloat64(); break;
        case 'c': cVal = r.readString(); break;
        case 'd': dVal = r.readBool(); break;
        case 'e': eVal = r.readBytes(); break;
        case 'nested': nestedVal = InnerCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Mix13(a: aVal, b: bVal, c: cVal, d: dVal, e: eVal, nested: nestedVal);
  },
);

class Mix14 {
  final List<Money> amounts;
  final BigInt total;
  final String currency;
  Mix14({required this.amounts, required this.total, required this.currency});
}

void writeMix14(SpecWriter w, Mix14 obj) {
  w.beginObject(3);
  w.writeField('amounts'); w.beginArray(obj.amounts.length); for (final item in obj.amounts) { w.nextElement(); writeMoney(w, item); } w.endArray();
  w.writeField('total'); w.writeInt64(obj.total);
  w.writeField('currency'); w.writeString(obj.currency);
  w.endObject();
}

final SpecCodec<Mix14> Mix14Codec = SpecCodec<Mix14>(
  encode: (w, obj) => writeMix14(w, obj),
  decode: (r) {
    List<Money> amountsVal = [];
    BigInt totalVal = BigInt.zero;
    String currencyVal = '';
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'amounts': amountsVal = () { final list = <Money>[]; r.beginArray(); while (r.hasNextElement()) { list.add(MoneyCodec.decode(r)); } r.endArray(); return list; }(); break;
        case 'total': totalVal = r.readInt64(); break;
        case 'currency': currencyVal = r.readString(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Mix14(amounts: amountsVal, total: totalVal, currency: currencyVal);
  },
);

class Mix15 {
  final Addr src_addr;
  final Addr dst_addr;
  final double distance;
  final double duration;
  Mix15({required this.src_addr, required this.dst_addr, required this.distance, required this.duration});
}

void writeMix15(SpecWriter w, Mix15 obj) {
  w.beginObject(4);
  w.writeField('src_addr'); writeAddr(w, obj.src_addr);
  w.writeField('dst_addr'); writeAddr(w, obj.dst_addr);
  w.writeField('distance'); w.writeFloat64(obj.distance);
  w.writeField('duration'); w.writeFloat64(obj.duration);
  w.endObject();
}

final SpecCodec<Mix15> Mix15Codec = SpecCodec<Mix15>(
  encode: (w, obj) => writeMix15(w, obj),
  decode: (r) {
    late Addr src_addrVal;
    late Addr dst_addrVal;
    double distanceVal = 0.0;
    double durationVal = 0.0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'src_addr': src_addrVal = AddrCodec.decode(r); break;
        case 'dst_addr': dst_addrVal = AddrCodec.decode(r); break;
        case 'distance': distanceVal = r.readFloat64(); break;
        case 'duration': durationVal = r.readFloat64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Mix15(src_addr: src_addrVal, dst_addr: dst_addrVal, distance: distanceVal, duration: durationVal);
  },
);

class AllOpt1 {
  final String? a;
  final int? b;
  final bool? c;
  AllOpt1({this.a, this.b, this.c});
}

void writeAllOpt1(SpecWriter w, AllOpt1 obj) {
  var fieldCount = 0;
  if (obj.a != null) fieldCount++;
  if (obj.b != null) fieldCount++;
  if (obj.c != null) fieldCount++;
  w.beginObject(fieldCount);
  if (obj.a != null) { w.writeField('a'); w.writeString(obj.a!); }
  if (obj.b != null) { w.writeField('b'); w.writeInt32(obj.b!); }
  if (obj.c != null) { w.writeField('c'); w.writeBool(obj.c!); }
  w.endObject();
}

final SpecCodec<AllOpt1> AllOpt1Codec = SpecCodec<AllOpt1>(
  encode: (w, obj) => writeAllOpt1(w, obj),
  decode: (r) {
    String? aVal;
    int? bVal;
    bool? cVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readString(); break;
        case 'b': bVal = r.readInt32(); break;
        case 'c': cVal = r.readBool(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return AllOpt1(a: aVal, b: bVal, c: cVal);
  },
);

class AllOpt2 {
  final double? x;
  final Uint8List? y;
  final BigInt? z;
  AllOpt2({this.x, this.y, this.z});
}

void writeAllOpt2(SpecWriter w, AllOpt2 obj) {
  var fieldCount = 0;
  if (obj.x != null) fieldCount++;
  if (obj.y != null) fieldCount++;
  if (obj.z != null) fieldCount++;
  w.beginObject(fieldCount);
  if (obj.x != null) { w.writeField('x'); w.writeFloat64(obj.x!); }
  if (obj.y != null) { w.writeField('y'); w.writeBytes(obj.y!); }
  if (obj.z != null) { w.writeField('z'); w.writeInt64(obj.z!); }
  w.endObject();
}

final SpecCodec<AllOpt2> AllOpt2Codec = SpecCodec<AllOpt2>(
  encode: (w, obj) => writeAllOpt2(w, obj),
  decode: (r) {
    double? xVal;
    Uint8List? yVal;
    BigInt? zVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'x': xVal = r.readFloat64(); break;
        case 'y': yVal = r.readBytes(); break;
        case 'z': zVal = r.readInt64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return AllOpt2(x: xVal, y: yVal, z: zVal);
  },
);

class AllOpt3 {
  final String? name;
  final int? age;
  final double? score;
  final bool? active;
  AllOpt3({this.name, this.age, this.score, this.active});
}

void writeAllOpt3(SpecWriter w, AllOpt3 obj) {
  var fieldCount = 0;
  if (obj.name != null) fieldCount++;
  if (obj.age != null) fieldCount++;
  if (obj.score != null) fieldCount++;
  if (obj.active != null) fieldCount++;
  w.beginObject(fieldCount);
  if (obj.name != null) { w.writeField('name'); w.writeString(obj.name!); }
  if (obj.age != null) { w.writeField('age'); w.writeInt32(obj.age!); }
  if (obj.score != null) { w.writeField('score'); w.writeFloat64(obj.score!); }
  if (obj.active != null) { w.writeField('active'); w.writeBool(obj.active!); }
  w.endObject();
}

final SpecCodec<AllOpt3> AllOpt3Codec = SpecCodec<AllOpt3>(
  encode: (w, obj) => writeAllOpt3(w, obj),
  decode: (r) {
    String? nameVal;
    int? ageVal;
    double? scoreVal;
    bool? activeVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'name': nameVal = r.readString(); break;
        case 'age': ageVal = r.readInt32(); break;
        case 'score': scoreVal = r.readFloat64(); break;
        case 'active': activeVal = r.readBool(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return AllOpt3(name: nameVal, age: ageVal, score: scoreVal, active: activeVal);
  },
);

class AllOpt4 {
  final int? a;
  final BigInt? b;
  final int? c;
  final String? d;
  final Uint8List? e;
  AllOpt4({this.a, this.b, this.c, this.d, this.e});
}

void writeAllOpt4(SpecWriter w, AllOpt4 obj) {
  var fieldCount = 0;
  if (obj.a != null) fieldCount++;
  if (obj.b != null) fieldCount++;
  if (obj.c != null) fieldCount++;
  if (obj.d != null) fieldCount++;
  if (obj.e != null) fieldCount++;
  w.beginObject(fieldCount);
  if (obj.a != null) { w.writeField('a'); w.writeUint32(obj.a!); }
  if (obj.b != null) { w.writeField('b'); w.writeUint64(obj.b!); }
  if (obj.c != null) { w.writeField('c'); w.writeInt32(obj.c!); }
  if (obj.d != null) { w.writeField('d'); w.writeString(obj.d!); }
  if (obj.e != null) { w.writeField('e'); w.writeBytes(obj.e!); }
  w.endObject();
}

final SpecCodec<AllOpt4> AllOpt4Codec = SpecCodec<AllOpt4>(
  encode: (w, obj) => writeAllOpt4(w, obj),
  decode: (r) {
    int? aVal;
    BigInt? bVal;
    int? cVal;
    String? dVal;
    Uint8List? eVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readUint32(); break;
        case 'b': bVal = r.readUint64(); break;
        case 'c': cVal = r.readInt32(); break;
        case 'd': dVal = r.readString(); break;
        case 'e': eVal = r.readBytes(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return AllOpt4(a: aVal, b: bVal, c: cVal, d: dVal, e: eVal);
  },
);

class AllOpt5 {
  final Inner? p;
  final String? q;
  AllOpt5({this.p, this.q});
}

void writeAllOpt5(SpecWriter w, AllOpt5 obj) {
  var fieldCount = 0;
  if (obj.p != null) fieldCount++;
  if (obj.q != null) fieldCount++;
  w.beginObject(fieldCount);
  if (obj.p != null) { w.writeField('p'); writeInner(w, obj.p!); }
  if (obj.q != null) { w.writeField('q'); w.writeString(obj.q!); }
  w.endObject();
}

final SpecCodec<AllOpt5> AllOpt5Codec = SpecCodec<AllOpt5>(
  encode: (w, obj) => writeAllOpt5(w, obj),
  decode: (r) {
    Inner? pVal;
    String? qVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'p': pVal = r.isNull() ? (() { r.readNull(); return null; })() : InnerCodec.decode(r); break;
        case 'q': qVal = r.readString(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return AllOpt5(p: pVal, q: qVal);
  },
);

class RecList {
  final int value;
  final RecList? next;
  RecList({required this.value, this.next});
}

void writeRecList(SpecWriter w, RecList obj) {
  var fieldCount = 1;
  if (obj.next != null) fieldCount++;
  w.beginObject(fieldCount);
  w.writeField('value'); w.writeInt32(obj.value);
  if (obj.next != null) { w.writeField('next'); writeRecList(w, obj.next!); }
  w.endObject();
}

final SpecCodec<RecList> RecListCodec = SpecCodec<RecList>(
  encode: (w, obj) => writeRecList(w, obj),
  decode: (r) {
    int valueVal = 0;
    RecList? nextVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'value': valueVal = r.readInt32(); break;
        case 'next': nextVal = r.isNull() ? (() { r.readNull(); return null; })() : RecListCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return RecList(value: valueVal, next: nextVal);
  },
);

class RecTree {
  final String value;
  final RecTree? left_node;
  final RecTree? right_node;
  RecTree({required this.value, this.left_node, this.right_node});
}

void writeRecTree(SpecWriter w, RecTree obj) {
  var fieldCount = 1;
  if (obj.left_node != null) fieldCount++;
  if (obj.right_node != null) fieldCount++;
  w.beginObject(fieldCount);
  w.writeField('value'); w.writeString(obj.value);
  if (obj.left_node != null) { w.writeField('left_node'); writeRecTree(w, obj.left_node!); }
  if (obj.right_node != null) { w.writeField('right_node'); writeRecTree(w, obj.right_node!); }
  w.endObject();
}

final SpecCodec<RecTree> RecTreeCodec = SpecCodec<RecTree>(
  encode: (w, obj) => writeRecTree(w, obj),
  decode: (r) {
    String valueVal = '';
    RecTree? left_nodeVal;
    RecTree? right_nodeVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'value': valueVal = r.readString(); break;
        case 'left_node': left_nodeVal = r.isNull() ? (() { r.readNull(); return null; })() : RecTreeCodec.decode(r); break;
        case 'right_node': right_nodeVal = r.isNull() ? (() { r.readNull(); return null; })() : RecTreeCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return RecTree(value: valueVal, left_node: left_nodeVal, right_node: right_nodeVal);
  },
);

class RecChain {
  final int id;
  final String label;
  final RecChain? next;
  RecChain({required this.id, required this.label, this.next});
}

void writeRecChain(SpecWriter w, RecChain obj) {
  var fieldCount = 2;
  if (obj.next != null) fieldCount++;
  w.beginObject(fieldCount);
  w.writeField('id'); w.writeInt32(obj.id);
  w.writeField('label'); w.writeString(obj.label);
  if (obj.next != null) { w.writeField('next'); writeRecChain(w, obj.next!); }
  w.endObject();
}

final SpecCodec<RecChain> RecChainCodec = SpecCodec<RecChain>(
  encode: (w, obj) => writeRecChain(w, obj),
  decode: (r) {
    int idVal = 0;
    String labelVal = '';
    RecChain? nextVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'id': idVal = r.readInt32(); break;
        case 'label': labelVal = r.readString(); break;
        case 'next': nextVal = r.isNull() ? (() { r.readNull(); return null; })() : RecChainCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return RecChain(id: idVal, label: labelVal, next: nextVal);
  },
);

class RecWrap {
  final Uint8List payload;
  final RecWrap? nested;
  RecWrap({required this.payload, this.nested});
}

void writeRecWrap(SpecWriter w, RecWrap obj) {
  var fieldCount = 1;
  if (obj.nested != null) fieldCount++;
  w.beginObject(fieldCount);
  w.writeField('payload'); w.writeBytes(obj.payload);
  if (obj.nested != null) { w.writeField('nested'); writeRecWrap(w, obj.nested!); }
  w.endObject();
}

final SpecCodec<RecWrap> RecWrapCodec = SpecCodec<RecWrap>(
  encode: (w, obj) => writeRecWrap(w, obj),
  decode: (r) {
    Uint8List payloadVal = Uint8List(0);
    RecWrap? nestedVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'payload': payloadVal = r.readBytes(); break;
        case 'nested': nestedVal = r.isNull() ? (() { r.readNull(); return null; })() : RecWrapCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return RecWrap(payload: payloadVal, nested: nestedVal);
  },
);

class RecWide {
  final int a;
  final String b;
  final double c;
  final RecWide? child;
  RecWide({required this.a, required this.b, required this.c, this.child});
}

void writeRecWide(SpecWriter w, RecWide obj) {
  var fieldCount = 3;
  if (obj.child != null) fieldCount++;
  w.beginObject(fieldCount);
  w.writeField('a'); w.writeInt32(obj.a);
  w.writeField('b'); w.writeString(obj.b);
  w.writeField('c'); w.writeFloat64(obj.c);
  if (obj.child != null) { w.writeField('child'); writeRecWide(w, obj.child!); }
  w.endObject();
}

final SpecCodec<RecWide> RecWideCodec = SpecCodec<RecWide>(
  encode: (w, obj) => writeRecWide(w, obj),
  decode: (r) {
    int aVal = 0;
    String bVal = '';
    double cVal = 0.0;
    RecWide? childVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readInt32(); break;
        case 'b': bVal = r.readString(); break;
        case 'c': cVal = r.readFloat64(); break;
        case 'child': childVal = r.isNull() ? (() { r.readNull(); return null; })() : RecWideCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return RecWide(a: aVal, b: bVal, c: cVal, child: childVal);
  },
);

class Wide20 {
  final String f1;
  final bool f2;
  final int f3;
  final int f4;
  final int f5;
  final BigInt f6;
  final int f7;
  final int f8;
  final int f9;
  final BigInt f10;
  final double f11;
  final double f12;
  final Uint8List f13;
  final String f14;
  final bool f15;
  final int f16;
  final int f17;
  final int f18;
  final BigInt f19;
  final int f20;
  Wide20({required this.f1, required this.f2, required this.f3, required this.f4, required this.f5, required this.f6, required this.f7, required this.f8, required this.f9, required this.f10, required this.f11, required this.f12, required this.f13, required this.f14, required this.f15, required this.f16, required this.f17, required this.f18, required this.f19, required this.f20});
}

void writeWide20(SpecWriter w, Wide20 obj) {
  w.beginObject(20);
  w.writeField('f1'); w.writeString(obj.f1);
  w.writeField('f2'); w.writeBool(obj.f2);
  w.writeField('f3'); w.writeInt32(obj.f3);
  w.writeField('f4'); w.writeInt32(obj.f4);
  w.writeField('f5'); w.writeInt32(obj.f5);
  w.writeField('f6'); w.writeInt64(obj.f6);
  w.writeField('f7'); w.writeUint32(obj.f7);
  w.writeField('f8'); w.writeUint32(obj.f8);
  w.writeField('f9'); w.writeUint32(obj.f9);
  w.writeField('f10'); w.writeUint64(obj.f10);
  w.writeField('f11'); w.writeFloat32(obj.f11);
  w.writeField('f12'); w.writeFloat64(obj.f12);
  w.writeField('f13'); w.writeBytes(obj.f13);
  w.writeField('f14'); w.writeString(obj.f14);
  w.writeField('f15'); w.writeBool(obj.f15);
  w.writeField('f16'); w.writeInt32(obj.f16);
  w.writeField('f17'); w.writeInt32(obj.f17);
  w.writeField('f18'); w.writeInt32(obj.f18);
  w.writeField('f19'); w.writeInt64(obj.f19);
  w.writeField('f20'); w.writeUint32(obj.f20);
  w.endObject();
}

final SpecCodec<Wide20> Wide20Codec = SpecCodec<Wide20>(
  encode: (w, obj) => writeWide20(w, obj),
  decode: (r) {
    String f1Val = '';
    bool f2Val = false;
    int f3Val = 0;
    int f4Val = 0;
    int f5Val = 0;
    BigInt f6Val = BigInt.zero;
    int f7Val = 0;
    int f8Val = 0;
    int f9Val = 0;
    BigInt f10Val = BigInt.zero;
    double f11Val = 0.0;
    double f12Val = 0.0;
    Uint8List f13Val = Uint8List(0);
    String f14Val = '';
    bool f15Val = false;
    int f16Val = 0;
    int f17Val = 0;
    int f18Val = 0;
    BigInt f19Val = BigInt.zero;
    int f20Val = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'f1': f1Val = r.readString(); break;
        case 'f2': f2Val = r.readBool(); break;
        case 'f3': f3Val = r.readInt32(); break;
        case 'f4': f4Val = r.readInt32(); break;
        case 'f5': f5Val = r.readInt32(); break;
        case 'f6': f6Val = r.readInt64(); break;
        case 'f7': f7Val = r.readUint32(); break;
        case 'f8': f8Val = r.readUint32(); break;
        case 'f9': f9Val = r.readUint32(); break;
        case 'f10': f10Val = r.readUint64(); break;
        case 'f11': f11Val = r.readFloat32(); break;
        case 'f12': f12Val = r.readFloat64(); break;
        case 'f13': f13Val = r.readBytes(); break;
        case 'f14': f14Val = r.readString(); break;
        case 'f15': f15Val = r.readBool(); break;
        case 'f16': f16Val = r.readInt32(); break;
        case 'f17': f17Val = r.readInt32(); break;
        case 'f18': f18Val = r.readInt32(); break;
        case 'f19': f19Val = r.readInt64(); break;
        case 'f20': f20Val = r.readUint32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Wide20(f1: f1Val, f2: f2Val, f3: f3Val, f4: f4Val, f5: f5Val, f6: f6Val, f7: f7Val, f8: f8Val, f9: f9Val, f10: f10Val, f11: f11Val, f12: f12Val, f13: f13Val, f14: f14Val, f15: f15Val, f16: f16Val, f17: f17Val, f18: f18Val, f19: f19Val, f20: f20Val);
  },
);

class Wide25 {
  final int f1;
  final int f2;
  final BigInt f3;
  final double f4;
  final double f5;
  final Uint8List f6;
  final String f7;
  final bool f8;
  final int f9;
  final int f10;
  final int f11;
  final BigInt f12;
  final int f13;
  final int f14;
  final int f15;
  final BigInt f16;
  final double f17;
  final double f18;
  final Uint8List f19;
  final String f20;
  final bool f21;
  final int f22;
  final int f23;
  final int f24;
  final BigInt f25;
  Wide25({required this.f1, required this.f2, required this.f3, required this.f4, required this.f5, required this.f6, required this.f7, required this.f8, required this.f9, required this.f10, required this.f11, required this.f12, required this.f13, required this.f14, required this.f15, required this.f16, required this.f17, required this.f18, required this.f19, required this.f20, required this.f21, required this.f22, required this.f23, required this.f24, required this.f25});
}

void writeWide25(SpecWriter w, Wide25 obj) {
  w.beginObject(25);
  w.writeField('f1'); w.writeUint32(obj.f1);
  w.writeField('f2'); w.writeUint32(obj.f2);
  w.writeField('f3'); w.writeUint64(obj.f3);
  w.writeField('f4'); w.writeFloat32(obj.f4);
  w.writeField('f5'); w.writeFloat64(obj.f5);
  w.writeField('f6'); w.writeBytes(obj.f6);
  w.writeField('f7'); w.writeString(obj.f7);
  w.writeField('f8'); w.writeBool(obj.f8);
  w.writeField('f9'); w.writeInt32(obj.f9);
  w.writeField('f10'); w.writeInt32(obj.f10);
  w.writeField('f11'); w.writeInt32(obj.f11);
  w.writeField('f12'); w.writeInt64(obj.f12);
  w.writeField('f13'); w.writeUint32(obj.f13);
  w.writeField('f14'); w.writeUint32(obj.f14);
  w.writeField('f15'); w.writeUint32(obj.f15);
  w.writeField('f16'); w.writeUint64(obj.f16);
  w.writeField('f17'); w.writeFloat32(obj.f17);
  w.writeField('f18'); w.writeFloat64(obj.f18);
  w.writeField('f19'); w.writeBytes(obj.f19);
  w.writeField('f20'); w.writeString(obj.f20);
  w.writeField('f21'); w.writeBool(obj.f21);
  w.writeField('f22'); w.writeInt32(obj.f22);
  w.writeField('f23'); w.writeInt32(obj.f23);
  w.writeField('f24'); w.writeInt32(obj.f24);
  w.writeField('f25'); w.writeInt64(obj.f25);
  w.endObject();
}

final SpecCodec<Wide25> Wide25Codec = SpecCodec<Wide25>(
  encode: (w, obj) => writeWide25(w, obj),
  decode: (r) {
    int f1Val = 0;
    int f2Val = 0;
    BigInt f3Val = BigInt.zero;
    double f4Val = 0.0;
    double f5Val = 0.0;
    Uint8List f6Val = Uint8List(0);
    String f7Val = '';
    bool f8Val = false;
    int f9Val = 0;
    int f10Val = 0;
    int f11Val = 0;
    BigInt f12Val = BigInt.zero;
    int f13Val = 0;
    int f14Val = 0;
    int f15Val = 0;
    BigInt f16Val = BigInt.zero;
    double f17Val = 0.0;
    double f18Val = 0.0;
    Uint8List f19Val = Uint8List(0);
    String f20Val = '';
    bool f21Val = false;
    int f22Val = 0;
    int f23Val = 0;
    int f24Val = 0;
    BigInt f25Val = BigInt.zero;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'f1': f1Val = r.readUint32(); break;
        case 'f2': f2Val = r.readUint32(); break;
        case 'f3': f3Val = r.readUint64(); break;
        case 'f4': f4Val = r.readFloat32(); break;
        case 'f5': f5Val = r.readFloat64(); break;
        case 'f6': f6Val = r.readBytes(); break;
        case 'f7': f7Val = r.readString(); break;
        case 'f8': f8Val = r.readBool(); break;
        case 'f9': f9Val = r.readInt32(); break;
        case 'f10': f10Val = r.readInt32(); break;
        case 'f11': f11Val = r.readInt32(); break;
        case 'f12': f12Val = r.readInt64(); break;
        case 'f13': f13Val = r.readUint32(); break;
        case 'f14': f14Val = r.readUint32(); break;
        case 'f15': f15Val = r.readUint32(); break;
        case 'f16': f16Val = r.readUint64(); break;
        case 'f17': f17Val = r.readFloat32(); break;
        case 'f18': f18Val = r.readFloat64(); break;
        case 'f19': f19Val = r.readBytes(); break;
        case 'f20': f20Val = r.readString(); break;
        case 'f21': f21Val = r.readBool(); break;
        case 'f22': f22Val = r.readInt32(); break;
        case 'f23': f23Val = r.readInt32(); break;
        case 'f24': f24Val = r.readInt32(); break;
        case 'f25': f25Val = r.readInt64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Wide25(f1: f1Val, f2: f2Val, f3: f3Val, f4: f4Val, f5: f5Val, f6: f6Val, f7: f7Val, f8: f8Val, f9: f9Val, f10: f10Val, f11: f11Val, f12: f12Val, f13: f13Val, f14: f14Val, f15: f15Val, f16: f16Val, f17: f17Val, f18: f18Val, f19: f19Val, f20: f20Val, f21: f21Val, f22: f22Val, f23: f23Val, f24: f24Val, f25: f25Val);
  },
);

class Wide30 {
  final bool f1;
  final int f2;
  final int f3;
  final int f4;
  final BigInt f5;
  final int f6;
  final int f7;
  final int f8;
  final BigInt f9;
  final double f10;
  final double f11;
  final Uint8List f12;
  final String f13;
  final bool f14;
  final int f15;
  final int f16;
  final int f17;
  final BigInt f18;
  final int f19;
  final int f20;
  final int f21;
  final BigInt f22;
  final double f23;
  final double f24;
  final Uint8List f25;
  final String f26;
  final bool f27;
  final int f28;
  final int f29;
  final int f30;
  Wide30({required this.f1, required this.f2, required this.f3, required this.f4, required this.f5, required this.f6, required this.f7, required this.f8, required this.f9, required this.f10, required this.f11, required this.f12, required this.f13, required this.f14, required this.f15, required this.f16, required this.f17, required this.f18, required this.f19, required this.f20, required this.f21, required this.f22, required this.f23, required this.f24, required this.f25, required this.f26, required this.f27, required this.f28, required this.f29, required this.f30});
}

void writeWide30(SpecWriter w, Wide30 obj) {
  w.beginObject(30);
  w.writeField('f1'); w.writeBool(obj.f1);
  w.writeField('f2'); w.writeInt32(obj.f2);
  w.writeField('f3'); w.writeInt32(obj.f3);
  w.writeField('f4'); w.writeInt32(obj.f4);
  w.writeField('f5'); w.writeInt64(obj.f5);
  w.writeField('f6'); w.writeUint32(obj.f6);
  w.writeField('f7'); w.writeUint32(obj.f7);
  w.writeField('f8'); w.writeUint32(obj.f8);
  w.writeField('f9'); w.writeUint64(obj.f9);
  w.writeField('f10'); w.writeFloat32(obj.f10);
  w.writeField('f11'); w.writeFloat64(obj.f11);
  w.writeField('f12'); w.writeBytes(obj.f12);
  w.writeField('f13'); w.writeString(obj.f13);
  w.writeField('f14'); w.writeBool(obj.f14);
  w.writeField('f15'); w.writeInt32(obj.f15);
  w.writeField('f16'); w.writeInt32(obj.f16);
  w.writeField('f17'); w.writeInt32(obj.f17);
  w.writeField('f18'); w.writeInt64(obj.f18);
  w.writeField('f19'); w.writeUint32(obj.f19);
  w.writeField('f20'); w.writeUint32(obj.f20);
  w.writeField('f21'); w.writeUint32(obj.f21);
  w.writeField('f22'); w.writeUint64(obj.f22);
  w.writeField('f23'); w.writeFloat32(obj.f23);
  w.writeField('f24'); w.writeFloat64(obj.f24);
  w.writeField('f25'); w.writeBytes(obj.f25);
  w.writeField('f26'); w.writeString(obj.f26);
  w.writeField('f27'); w.writeBool(obj.f27);
  w.writeField('f28'); w.writeInt32(obj.f28);
  w.writeField('f29'); w.writeInt32(obj.f29);
  w.writeField('f30'); w.writeInt32(obj.f30);
  w.endObject();
}

final SpecCodec<Wide30> Wide30Codec = SpecCodec<Wide30>(
  encode: (w, obj) => writeWide30(w, obj),
  decode: (r) {
    bool f1Val = false;
    int f2Val = 0;
    int f3Val = 0;
    int f4Val = 0;
    BigInt f5Val = BigInt.zero;
    int f6Val = 0;
    int f7Val = 0;
    int f8Val = 0;
    BigInt f9Val = BigInt.zero;
    double f10Val = 0.0;
    double f11Val = 0.0;
    Uint8List f12Val = Uint8List(0);
    String f13Val = '';
    bool f14Val = false;
    int f15Val = 0;
    int f16Val = 0;
    int f17Val = 0;
    BigInt f18Val = BigInt.zero;
    int f19Val = 0;
    int f20Val = 0;
    int f21Val = 0;
    BigInt f22Val = BigInt.zero;
    double f23Val = 0.0;
    double f24Val = 0.0;
    Uint8List f25Val = Uint8List(0);
    String f26Val = '';
    bool f27Val = false;
    int f28Val = 0;
    int f29Val = 0;
    int f30Val = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'f1': f1Val = r.readBool(); break;
        case 'f2': f2Val = r.readInt32(); break;
        case 'f3': f3Val = r.readInt32(); break;
        case 'f4': f4Val = r.readInt32(); break;
        case 'f5': f5Val = r.readInt64(); break;
        case 'f6': f6Val = r.readUint32(); break;
        case 'f7': f7Val = r.readUint32(); break;
        case 'f8': f8Val = r.readUint32(); break;
        case 'f9': f9Val = r.readUint64(); break;
        case 'f10': f10Val = r.readFloat32(); break;
        case 'f11': f11Val = r.readFloat64(); break;
        case 'f12': f12Val = r.readBytes(); break;
        case 'f13': f13Val = r.readString(); break;
        case 'f14': f14Val = r.readBool(); break;
        case 'f15': f15Val = r.readInt32(); break;
        case 'f16': f16Val = r.readInt32(); break;
        case 'f17': f17Val = r.readInt32(); break;
        case 'f18': f18Val = r.readInt64(); break;
        case 'f19': f19Val = r.readUint32(); break;
        case 'f20': f20Val = r.readUint32(); break;
        case 'f21': f21Val = r.readUint32(); break;
        case 'f22': f22Val = r.readUint64(); break;
        case 'f23': f23Val = r.readFloat32(); break;
        case 'f24': f24Val = r.readFloat64(); break;
        case 'f25': f25Val = r.readBytes(); break;
        case 'f26': f26Val = r.readString(); break;
        case 'f27': f27Val = r.readBool(); break;
        case 'f28': f28Val = r.readInt32(); break;
        case 'f29': f29Val = r.readInt32(); break;
        case 'f30': f30Val = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Wide30(f1: f1Val, f2: f2Val, f3: f3Val, f4: f4Val, f5: f5Val, f6: f6Val, f7: f7Val, f8: f8Val, f9: f9Val, f10: f10Val, f11: f11Val, f12: f12Val, f13: f13Val, f14: f14Val, f15: f15Val, f16: f16Val, f17: f17Val, f18: f18Val, f19: f19Val, f20: f20Val, f21: f21Val, f22: f22Val, f23: f23Val, f24: f24Val, f25: f25Val, f26: f26Val, f27: f27Val, f28: f28Val, f29: f29Val, f30: f30Val);
  },
);

class Wide35 {
  final int f1;
  final BigInt f2;
  final double f3;
  final double f4;
  final Uint8List f5;
  final String f6;
  final bool f7;
  final int f8;
  final int f9;
  final int f10;
  final BigInt f11;
  final int f12;
  final int f13;
  final int f14;
  final BigInt f15;
  final double f16;
  final double f17;
  final Uint8List f18;
  final String f19;
  final bool f20;
  final int f21;
  final int f22;
  final int f23;
  final BigInt f24;
  final int f25;
  final int f26;
  final int f27;
  final BigInt f28;
  final double f29;
  final double f30;
  final Uint8List f31;
  final String f32;
  final bool f33;
  final int f34;
  final int f35;
  Wide35({required this.f1, required this.f2, required this.f3, required this.f4, required this.f5, required this.f6, required this.f7, required this.f8, required this.f9, required this.f10, required this.f11, required this.f12, required this.f13, required this.f14, required this.f15, required this.f16, required this.f17, required this.f18, required this.f19, required this.f20, required this.f21, required this.f22, required this.f23, required this.f24, required this.f25, required this.f26, required this.f27, required this.f28, required this.f29, required this.f30, required this.f31, required this.f32, required this.f33, required this.f34, required this.f35});
}

void writeWide35(SpecWriter w, Wide35 obj) {
  w.beginObject(35);
  w.writeField('f1'); w.writeUint32(obj.f1);
  w.writeField('f2'); w.writeUint64(obj.f2);
  w.writeField('f3'); w.writeFloat32(obj.f3);
  w.writeField('f4'); w.writeFloat64(obj.f4);
  w.writeField('f5'); w.writeBytes(obj.f5);
  w.writeField('f6'); w.writeString(obj.f6);
  w.writeField('f7'); w.writeBool(obj.f7);
  w.writeField('f8'); w.writeInt32(obj.f8);
  w.writeField('f9'); w.writeInt32(obj.f9);
  w.writeField('f10'); w.writeInt32(obj.f10);
  w.writeField('f11'); w.writeInt64(obj.f11);
  w.writeField('f12'); w.writeUint32(obj.f12);
  w.writeField('f13'); w.writeUint32(obj.f13);
  w.writeField('f14'); w.writeUint32(obj.f14);
  w.writeField('f15'); w.writeUint64(obj.f15);
  w.writeField('f16'); w.writeFloat32(obj.f16);
  w.writeField('f17'); w.writeFloat64(obj.f17);
  w.writeField('f18'); w.writeBytes(obj.f18);
  w.writeField('f19'); w.writeString(obj.f19);
  w.writeField('f20'); w.writeBool(obj.f20);
  w.writeField('f21'); w.writeInt32(obj.f21);
  w.writeField('f22'); w.writeInt32(obj.f22);
  w.writeField('f23'); w.writeInt32(obj.f23);
  w.writeField('f24'); w.writeInt64(obj.f24);
  w.writeField('f25'); w.writeUint32(obj.f25);
  w.writeField('f26'); w.writeUint32(obj.f26);
  w.writeField('f27'); w.writeUint32(obj.f27);
  w.writeField('f28'); w.writeUint64(obj.f28);
  w.writeField('f29'); w.writeFloat32(obj.f29);
  w.writeField('f30'); w.writeFloat64(obj.f30);
  w.writeField('f31'); w.writeBytes(obj.f31);
  w.writeField('f32'); w.writeString(obj.f32);
  w.writeField('f33'); w.writeBool(obj.f33);
  w.writeField('f34'); w.writeInt32(obj.f34);
  w.writeField('f35'); w.writeInt32(obj.f35);
  w.endObject();
}

final SpecCodec<Wide35> Wide35Codec = SpecCodec<Wide35>(
  encode: (w, obj) => writeWide35(w, obj),
  decode: (r) {
    int f1Val = 0;
    BigInt f2Val = BigInt.zero;
    double f3Val = 0.0;
    double f4Val = 0.0;
    Uint8List f5Val = Uint8List(0);
    String f6Val = '';
    bool f7Val = false;
    int f8Val = 0;
    int f9Val = 0;
    int f10Val = 0;
    BigInt f11Val = BigInt.zero;
    int f12Val = 0;
    int f13Val = 0;
    int f14Val = 0;
    BigInt f15Val = BigInt.zero;
    double f16Val = 0.0;
    double f17Val = 0.0;
    Uint8List f18Val = Uint8List(0);
    String f19Val = '';
    bool f20Val = false;
    int f21Val = 0;
    int f22Val = 0;
    int f23Val = 0;
    BigInt f24Val = BigInt.zero;
    int f25Val = 0;
    int f26Val = 0;
    int f27Val = 0;
    BigInt f28Val = BigInt.zero;
    double f29Val = 0.0;
    double f30Val = 0.0;
    Uint8List f31Val = Uint8List(0);
    String f32Val = '';
    bool f33Val = false;
    int f34Val = 0;
    int f35Val = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'f1': f1Val = r.readUint32(); break;
        case 'f2': f2Val = r.readUint64(); break;
        case 'f3': f3Val = r.readFloat32(); break;
        case 'f4': f4Val = r.readFloat64(); break;
        case 'f5': f5Val = r.readBytes(); break;
        case 'f6': f6Val = r.readString(); break;
        case 'f7': f7Val = r.readBool(); break;
        case 'f8': f8Val = r.readInt32(); break;
        case 'f9': f9Val = r.readInt32(); break;
        case 'f10': f10Val = r.readInt32(); break;
        case 'f11': f11Val = r.readInt64(); break;
        case 'f12': f12Val = r.readUint32(); break;
        case 'f13': f13Val = r.readUint32(); break;
        case 'f14': f14Val = r.readUint32(); break;
        case 'f15': f15Val = r.readUint64(); break;
        case 'f16': f16Val = r.readFloat32(); break;
        case 'f17': f17Val = r.readFloat64(); break;
        case 'f18': f18Val = r.readBytes(); break;
        case 'f19': f19Val = r.readString(); break;
        case 'f20': f20Val = r.readBool(); break;
        case 'f21': f21Val = r.readInt32(); break;
        case 'f22': f22Val = r.readInt32(); break;
        case 'f23': f23Val = r.readInt32(); break;
        case 'f24': f24Val = r.readInt64(); break;
        case 'f25': f25Val = r.readUint32(); break;
        case 'f26': f26Val = r.readUint32(); break;
        case 'f27': f27Val = r.readUint32(); break;
        case 'f28': f28Val = r.readUint64(); break;
        case 'f29': f29Val = r.readFloat32(); break;
        case 'f30': f30Val = r.readFloat64(); break;
        case 'f31': f31Val = r.readBytes(); break;
        case 'f32': f32Val = r.readString(); break;
        case 'f33': f33Val = r.readBool(); break;
        case 'f34': f34Val = r.readInt32(); break;
        case 'f35': f35Val = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Wide35(f1: f1Val, f2: f2Val, f3: f3Val, f4: f4Val, f5: f5Val, f6: f6Val, f7: f7Val, f8: f8Val, f9: f9Val, f10: f10Val, f11: f11Val, f12: f12Val, f13: f13Val, f14: f14Val, f15: f15Val, f16: f16Val, f17: f17Val, f18: f18Val, f19: f19Val, f20: f20Val, f21: f21Val, f22: f22Val, f23: f23Val, f24: f24Val, f25: f25Val, f26: f26Val, f27: f27Val, f28: f28Val, f29: f29Val, f30: f30Val, f31: f31Val, f32: f32Val, f33: f33Val, f34: f34Val, f35: f35Val);
  },
);

class Wide40 {
  final int f1;
  final int f2;
  final int f3;
  final BigInt f4;
  final int f5;
  final int f6;
  final int f7;
  final BigInt f8;
  final double f9;
  final double f10;
  final Uint8List f11;
  final String f12;
  final bool f13;
  final int f14;
  final int f15;
  final int f16;
  final BigInt f17;
  final int f18;
  final int f19;
  final int f20;
  final BigInt f21;
  final double f22;
  final double f23;
  final Uint8List f24;
  final String f25;
  final bool f26;
  final int f27;
  final int f28;
  final int f29;
  final BigInt f30;
  final int f31;
  final int f32;
  final int f33;
  final BigInt f34;
  final double f35;
  final double f36;
  final Uint8List f37;
  final String f38;
  final bool f39;
  final int f40;
  Wide40({required this.f1, required this.f2, required this.f3, required this.f4, required this.f5, required this.f6, required this.f7, required this.f8, required this.f9, required this.f10, required this.f11, required this.f12, required this.f13, required this.f14, required this.f15, required this.f16, required this.f17, required this.f18, required this.f19, required this.f20, required this.f21, required this.f22, required this.f23, required this.f24, required this.f25, required this.f26, required this.f27, required this.f28, required this.f29, required this.f30, required this.f31, required this.f32, required this.f33, required this.f34, required this.f35, required this.f36, required this.f37, required this.f38, required this.f39, required this.f40});
}

void writeWide40(SpecWriter w, Wide40 obj) {
  w.beginObject(40);
  w.writeField('f1'); w.writeInt32(obj.f1);
  w.writeField('f2'); w.writeInt32(obj.f2);
  w.writeField('f3'); w.writeInt32(obj.f3);
  w.writeField('f4'); w.writeInt64(obj.f4);
  w.writeField('f5'); w.writeUint32(obj.f5);
  w.writeField('f6'); w.writeUint32(obj.f6);
  w.writeField('f7'); w.writeUint32(obj.f7);
  w.writeField('f8'); w.writeUint64(obj.f8);
  w.writeField('f9'); w.writeFloat32(obj.f9);
  w.writeField('f10'); w.writeFloat64(obj.f10);
  w.writeField('f11'); w.writeBytes(obj.f11);
  w.writeField('f12'); w.writeString(obj.f12);
  w.writeField('f13'); w.writeBool(obj.f13);
  w.writeField('f14'); w.writeInt32(obj.f14);
  w.writeField('f15'); w.writeInt32(obj.f15);
  w.writeField('f16'); w.writeInt32(obj.f16);
  w.writeField('f17'); w.writeInt64(obj.f17);
  w.writeField('f18'); w.writeUint32(obj.f18);
  w.writeField('f19'); w.writeUint32(obj.f19);
  w.writeField('f20'); w.writeUint32(obj.f20);
  w.writeField('f21'); w.writeUint64(obj.f21);
  w.writeField('f22'); w.writeFloat32(obj.f22);
  w.writeField('f23'); w.writeFloat64(obj.f23);
  w.writeField('f24'); w.writeBytes(obj.f24);
  w.writeField('f25'); w.writeString(obj.f25);
  w.writeField('f26'); w.writeBool(obj.f26);
  w.writeField('f27'); w.writeInt32(obj.f27);
  w.writeField('f28'); w.writeInt32(obj.f28);
  w.writeField('f29'); w.writeInt32(obj.f29);
  w.writeField('f30'); w.writeInt64(obj.f30);
  w.writeField('f31'); w.writeUint32(obj.f31);
  w.writeField('f32'); w.writeUint32(obj.f32);
  w.writeField('f33'); w.writeUint32(obj.f33);
  w.writeField('f34'); w.writeUint64(obj.f34);
  w.writeField('f35'); w.writeFloat32(obj.f35);
  w.writeField('f36'); w.writeFloat64(obj.f36);
  w.writeField('f37'); w.writeBytes(obj.f37);
  w.writeField('f38'); w.writeString(obj.f38);
  w.writeField('f39'); w.writeBool(obj.f39);
  w.writeField('f40'); w.writeInt32(obj.f40);
  w.endObject();
}

final SpecCodec<Wide40> Wide40Codec = SpecCodec<Wide40>(
  encode: (w, obj) => writeWide40(w, obj),
  decode: (r) {
    int f1Val = 0;
    int f2Val = 0;
    int f3Val = 0;
    BigInt f4Val = BigInt.zero;
    int f5Val = 0;
    int f6Val = 0;
    int f7Val = 0;
    BigInt f8Val = BigInt.zero;
    double f9Val = 0.0;
    double f10Val = 0.0;
    Uint8List f11Val = Uint8List(0);
    String f12Val = '';
    bool f13Val = false;
    int f14Val = 0;
    int f15Val = 0;
    int f16Val = 0;
    BigInt f17Val = BigInt.zero;
    int f18Val = 0;
    int f19Val = 0;
    int f20Val = 0;
    BigInt f21Val = BigInt.zero;
    double f22Val = 0.0;
    double f23Val = 0.0;
    Uint8List f24Val = Uint8List(0);
    String f25Val = '';
    bool f26Val = false;
    int f27Val = 0;
    int f28Val = 0;
    int f29Val = 0;
    BigInt f30Val = BigInt.zero;
    int f31Val = 0;
    int f32Val = 0;
    int f33Val = 0;
    BigInt f34Val = BigInt.zero;
    double f35Val = 0.0;
    double f36Val = 0.0;
    Uint8List f37Val = Uint8List(0);
    String f38Val = '';
    bool f39Val = false;
    int f40Val = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'f1': f1Val = r.readInt32(); break;
        case 'f2': f2Val = r.readInt32(); break;
        case 'f3': f3Val = r.readInt32(); break;
        case 'f4': f4Val = r.readInt64(); break;
        case 'f5': f5Val = r.readUint32(); break;
        case 'f6': f6Val = r.readUint32(); break;
        case 'f7': f7Val = r.readUint32(); break;
        case 'f8': f8Val = r.readUint64(); break;
        case 'f9': f9Val = r.readFloat32(); break;
        case 'f10': f10Val = r.readFloat64(); break;
        case 'f11': f11Val = r.readBytes(); break;
        case 'f12': f12Val = r.readString(); break;
        case 'f13': f13Val = r.readBool(); break;
        case 'f14': f14Val = r.readInt32(); break;
        case 'f15': f15Val = r.readInt32(); break;
        case 'f16': f16Val = r.readInt32(); break;
        case 'f17': f17Val = r.readInt64(); break;
        case 'f18': f18Val = r.readUint32(); break;
        case 'f19': f19Val = r.readUint32(); break;
        case 'f20': f20Val = r.readUint32(); break;
        case 'f21': f21Val = r.readUint64(); break;
        case 'f22': f22Val = r.readFloat32(); break;
        case 'f23': f23Val = r.readFloat64(); break;
        case 'f24': f24Val = r.readBytes(); break;
        case 'f25': f25Val = r.readString(); break;
        case 'f26': f26Val = r.readBool(); break;
        case 'f27': f27Val = r.readInt32(); break;
        case 'f28': f28Val = r.readInt32(); break;
        case 'f29': f29Val = r.readInt32(); break;
        case 'f30': f30Val = r.readInt64(); break;
        case 'f31': f31Val = r.readUint32(); break;
        case 'f32': f32Val = r.readUint32(); break;
        case 'f33': f33Val = r.readUint32(); break;
        case 'f34': f34Val = r.readUint64(); break;
        case 'f35': f35Val = r.readFloat32(); break;
        case 'f36': f36Val = r.readFloat64(); break;
        case 'f37': f37Val = r.readBytes(); break;
        case 'f38': f38Val = r.readString(); break;
        case 'f39': f39Val = r.readBool(); break;
        case 'f40': f40Val = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Wide40(f1: f1Val, f2: f2Val, f3: f3Val, f4: f4Val, f5: f5Val, f6: f6Val, f7: f7Val, f8: f8Val, f9: f9Val, f10: f10Val, f11: f11Val, f12: f12Val, f13: f13Val, f14: f14Val, f15: f15Val, f16: f16Val, f17: f17Val, f18: f18Val, f19: f19Val, f20: f20Val, f21: f21Val, f22: f22Val, f23: f23Val, f24: f24Val, f25: f25Val, f26: f26Val, f27: f27Val, f28: f28Val, f29: f29Val, f30: f30Val, f31: f31Val, f32: f32Val, f33: f33Val, f34: f34Val, f35: f35Val, f36: f36Val, f37: f37Val, f38: f38Val, f39: f39Val, f40: f40Val);
  },
);

class EdgeEmpty {
  EdgeEmpty();
}

void writeEdgeEmpty(SpecWriter w, EdgeEmpty obj) {
  w.beginObject(0);
  w.endObject();
}

final SpecCodec<EdgeEmpty> EdgeEmptyCodec = SpecCodec<EdgeEmpty>(
  encode: (w, obj) => writeEdgeEmpty(w, obj),
  decode: (r) {
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        default: r.skip();
      }
    }
    r.endObject();
    return EdgeEmpty();
  },
);

class EdgeOneOpt {
  final String? maybe;
  EdgeOneOpt({this.maybe});
}

void writeEdgeOneOpt(SpecWriter w, EdgeOneOpt obj) {
  var fieldCount = 0;
  if (obj.maybe != null) fieldCount++;
  w.beginObject(fieldCount);
  if (obj.maybe != null) { w.writeField('maybe'); w.writeString(obj.maybe!); }
  w.endObject();
}

final SpecCodec<EdgeOneOpt> EdgeOneOptCodec = SpecCodec<EdgeOneOpt>(
  encode: (w, obj) => writeEdgeOneOpt(w, obj),
  decode: (r) {
    String? maybeVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'maybe': maybeVal = r.readString(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return EdgeOneOpt(maybe: maybeVal);
  },
);

class EdgeBigNums {
  final int i8;
  final int i16;
  final int i32;
  final BigInt i64;
  final int u8;
  final int u16;
  final int u32;
  final BigInt u64;
  EdgeBigNums({required this.i8, required this.i16, required this.i32, required this.i64, required this.u8, required this.u16, required this.u32, required this.u64});
}

void writeEdgeBigNums(SpecWriter w, EdgeBigNums obj) {
  w.beginObject(8);
  w.writeField('i8'); w.writeInt32(obj.i8);
  w.writeField('i16'); w.writeInt32(obj.i16);
  w.writeField('i32'); w.writeInt32(obj.i32);
  w.writeField('i64'); w.writeInt64(obj.i64);
  w.writeField('u8'); w.writeUint32(obj.u8);
  w.writeField('u16'); w.writeUint32(obj.u16);
  w.writeField('u32'); w.writeUint32(obj.u32);
  w.writeField('u64'); w.writeUint64(obj.u64);
  w.endObject();
}

final SpecCodec<EdgeBigNums> EdgeBigNumsCodec = SpecCodec<EdgeBigNums>(
  encode: (w, obj) => writeEdgeBigNums(w, obj),
  decode: (r) {
    int i8Val = 0;
    int i16Val = 0;
    int i32Val = 0;
    BigInt i64Val = BigInt.zero;
    int u8Val = 0;
    int u16Val = 0;
    int u32Val = 0;
    BigInt u64Val = BigInt.zero;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'i8': i8Val = r.readInt32(); break;
        case 'i16': i16Val = r.readInt32(); break;
        case 'i32': i32Val = r.readInt32(); break;
        case 'i64': i64Val = r.readInt64(); break;
        case 'u8': u8Val = r.readUint32(); break;
        case 'u16': u16Val = r.readUint32(); break;
        case 'u32': u32Val = r.readUint32(); break;
        case 'u64': u64Val = r.readUint64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return EdgeBigNums(i8: i8Val, i16: i16Val, i32: i32Val, i64: i64Val, u8: u8Val, u16: u16Val, u32: u32Val, u64: u64Val);
  },
);

class EdgeZeroVals {
  final String s;
  final int i;
  final double f;
  final bool b;
  final Uint8List by_field;
  EdgeZeroVals({required this.s, required this.i, required this.f, required this.b, required this.by_field});
}

void writeEdgeZeroVals(SpecWriter w, EdgeZeroVals obj) {
  w.beginObject(5);
  w.writeField('s'); w.writeString(obj.s);
  w.writeField('i'); w.writeInt32(obj.i);
  w.writeField('f'); w.writeFloat64(obj.f);
  w.writeField('b'); w.writeBool(obj.b);
  w.writeField('by_field'); w.writeBytes(obj.by_field);
  w.endObject();
}

final SpecCodec<EdgeZeroVals> EdgeZeroValsCodec = SpecCodec<EdgeZeroVals>(
  encode: (w, obj) => writeEdgeZeroVals(w, obj),
  decode: (r) {
    String sVal = '';
    int iVal = 0;
    double fVal = 0.0;
    bool bVal = false;
    Uint8List by_fieldVal = Uint8List(0);
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 's': sVal = r.readString(); break;
        case 'i': iVal = r.readInt32(); break;
        case 'f': fVal = r.readFloat64(); break;
        case 'b': bVal = r.readBool(); break;
        case 'by_field': by_fieldVal = r.readBytes(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return EdgeZeroVals(s: sVal, i: iVal, f: fVal, b: bVal, by_field: by_fieldVal);
  },
);

class EdgeNullable {
  final String? a;
  final int? b;
  final Inner? c;
  final List<String>? d;
  EdgeNullable({this.a, this.b, this.c, this.d});
}

void writeEdgeNullable(SpecWriter w, EdgeNullable obj) {
  var fieldCount = 0;
  if (obj.a != null) fieldCount++;
  if (obj.b != null) fieldCount++;
  if (obj.c != null) fieldCount++;
  if (obj.d != null) fieldCount++;
  w.beginObject(fieldCount);
  if (obj.a != null) { w.writeField('a'); w.writeString(obj.a!); }
  if (obj.b != null) { w.writeField('b'); w.writeInt32(obj.b!); }
  if (obj.c != null) { w.writeField('c'); writeInner(w, obj.c!); }
  if (obj.d != null) { w.writeField('d'); w.beginArray(obj.d!.length); for (final item in obj.d!) { w.nextElement(); w.writeString(item); } w.endArray(); }
  w.endObject();
}

final SpecCodec<EdgeNullable> EdgeNullableCodec = SpecCodec<EdgeNullable>(
  encode: (w, obj) => writeEdgeNullable(w, obj),
  decode: (r) {
    String? aVal;
    int? bVal;
    Inner? cVal;
    List<String>? dVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readString(); break;
        case 'b': bVal = r.readInt32(); break;
        case 'c': cVal = r.isNull() ? (() { r.readNull(); return null; })() : InnerCodec.decode(r); break;
        case 'd': dVal = () { final list = <String>[]; r.beginArray(); while (r.hasNextElement()) { list.add(r.readString()); } r.endArray(); return list; }(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return EdgeNullable(a: aVal, b: bVal, c: cVal, d: dVal);
  },
);

class EdgeNegZero {
  final double v;
  EdgeNegZero({required this.v});
}

void writeEdgeNegZero(SpecWriter w, EdgeNegZero obj) {
  w.beginObject(1);
  w.writeField('v'); w.writeFloat64(obj.v);
  w.endObject();
}

final SpecCodec<EdgeNegZero> EdgeNegZeroCodec = SpecCodec<EdgeNegZero>(
  encode: (w, obj) => writeEdgeNegZero(w, obj),
  decode: (r) {
    double vVal = 0.0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'v': vVal = r.readFloat64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return EdgeNegZero(v: vVal);
  },
);

class EdgeNullByte {
  final String s;
  final Uint8List b;
  EdgeNullByte({required this.s, required this.b});
}

void writeEdgeNullByte(SpecWriter w, EdgeNullByte obj) {
  w.beginObject(2);
  w.writeField('s'); w.writeString(obj.s);
  w.writeField('b'); w.writeBytes(obj.b);
  w.endObject();
}

final SpecCodec<EdgeNullByte> EdgeNullByteCodec = SpecCodec<EdgeNullByte>(
  encode: (w, obj) => writeEdgeNullByte(w, obj),
  decode: (r) {
    String sVal = '';
    Uint8List bVal = Uint8List(0);
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 's': sVal = r.readString(); break;
        case 'b': bVal = r.readBytes(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return EdgeNullByte(s: sVal, b: bVal);
  },
);

class EdgeBoundary {
  final int i32_neg129;
  final int i32_128;
  final int i32_256;
  final int i32_65536;
  final int i32_neg32769;
  final int u32_65536;
  EdgeBoundary({required this.i32_neg129, required this.i32_128, required this.i32_256, required this.i32_65536, required this.i32_neg32769, required this.u32_65536});
}

void writeEdgeBoundary(SpecWriter w, EdgeBoundary obj) {
  w.beginObject(6);
  w.writeField('i32_neg129'); w.writeInt32(obj.i32_neg129);
  w.writeField('i32_128'); w.writeInt32(obj.i32_128);
  w.writeField('i32_256'); w.writeInt32(obj.i32_256);
  w.writeField('i32_65536'); w.writeInt32(obj.i32_65536);
  w.writeField('i32_neg32769'); w.writeInt32(obj.i32_neg32769);
  w.writeField('u32_65536'); w.writeUint32(obj.u32_65536);
  w.endObject();
}

final SpecCodec<EdgeBoundary> EdgeBoundaryCodec = SpecCodec<EdgeBoundary>(
  encode: (w, obj) => writeEdgeBoundary(w, obj),
  decode: (r) {
    int i32_neg129Val = 0;
    int i32_128Val = 0;
    int i32_256Val = 0;
    int i32_65536Val = 0;
    int i32_neg32769Val = 0;
    int u32_65536Val = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'i32_neg129': i32_neg129Val = r.readInt32(); break;
        case 'i32_128': i32_128Val = r.readInt32(); break;
        case 'i32_256': i32_256Val = r.readInt32(); break;
        case 'i32_65536': i32_65536Val = r.readInt32(); break;
        case 'i32_neg32769': i32_neg32769Val = r.readInt32(); break;
        case 'u32_65536': u32_65536Val = r.readUint32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return EdgeBoundary(i32_neg129: i32_neg129Val, i32_128: i32_128Val, i32_256: i32_256Val, i32_65536: i32_65536Val, i32_neg32769: i32_neg32769Val, u32_65536: u32_65536Val);
  },
);

class EdgeStrLen {
  final String s31;
  final String s32;
  final String s255;
  final String s256;
  EdgeStrLen({required this.s31, required this.s32, required this.s255, required this.s256});
}

void writeEdgeStrLen(SpecWriter w, EdgeStrLen obj) {
  w.beginObject(4);
  w.writeField('s31'); w.writeString(obj.s31);
  w.writeField('s32'); w.writeString(obj.s32);
  w.writeField('s255'); w.writeString(obj.s255);
  w.writeField('s256'); w.writeString(obj.s256);
  w.endObject();
}

final SpecCodec<EdgeStrLen> EdgeStrLenCodec = SpecCodec<EdgeStrLen>(
  encode: (w, obj) => writeEdgeStrLen(w, obj),
  decode: (r) {
    String s31Val = '';
    String s32Val = '';
    String s255Val = '';
    String s256Val = '';
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 's31': s31Val = r.readString(); break;
        case 's32': s32Val = r.readString(); break;
        case 's255': s255Val = r.readString(); break;
        case 's256': s256Val = r.readString(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return EdgeStrLen(s31: s31Val, s32: s32Val, s255: s255Val, s256: s256Val);
  },
);

class EdgeBytesLen {
  final Uint8List b31;
  final Uint8List b32;
  final Uint8List b255;
  final Uint8List b256;
  EdgeBytesLen({required this.b31, required this.b32, required this.b255, required this.b256});
}

void writeEdgeBytesLen(SpecWriter w, EdgeBytesLen obj) {
  w.beginObject(4);
  w.writeField('b31'); w.writeBytes(obj.b31);
  w.writeField('b32'); w.writeBytes(obj.b32);
  w.writeField('b255'); w.writeBytes(obj.b255);
  w.writeField('b256'); w.writeBytes(obj.b256);
  w.endObject();
}

final SpecCodec<EdgeBytesLen> EdgeBytesLenCodec = SpecCodec<EdgeBytesLen>(
  encode: (w, obj) => writeEdgeBytesLen(w, obj),
  decode: (r) {
    Uint8List b31Val = Uint8List(0);
    Uint8List b32Val = Uint8List(0);
    Uint8List b255Val = Uint8List(0);
    Uint8List b256Val = Uint8List(0);
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'b31': b31Val = r.readBytes(); break;
        case 'b32': b32Val = r.readBytes(); break;
        case 'b255': b255Val = r.readBytes(); break;
        case 'b256': b256Val = r.readBytes(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return EdgeBytesLen(b31: b31Val, b32: b32Val, b255: b255Val, b256: b256Val);
  },
);

class EdgeArrEmpty {
  final List<String> items;
  EdgeArrEmpty({required this.items});
}

void writeEdgeArrEmpty(SpecWriter w, EdgeArrEmpty obj) {
  w.beginObject(1);
  w.writeField('items'); w.beginArray(obj.items.length); for (final item in obj.items) { w.nextElement(); w.writeString(item); } w.endArray();
  w.endObject();
}

final SpecCodec<EdgeArrEmpty> EdgeArrEmptyCodec = SpecCodec<EdgeArrEmpty>(
  encode: (w, obj) => writeEdgeArrEmpty(w, obj),
  decode: (r) {
    List<String> itemsVal = [];
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'items': itemsVal = () { final list = <String>[]; r.beginArray(); while (r.hasNextElement()) { list.add(r.readString()); } r.endArray(); return list; }(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return EdgeArrEmpty(items: itemsVal);
  },
);

class EdgeArrBoundary {
  final List<int> a15;
  final List<int> a16;
  EdgeArrBoundary({required this.a15, required this.a16});
}

void writeEdgeArrBoundary(SpecWriter w, EdgeArrBoundary obj) {
  w.beginObject(2);
  w.writeField('a15'); w.beginArray(obj.a15.length); for (final item in obj.a15) { w.nextElement(); w.writeInt32(item); } w.endArray();
  w.writeField('a16'); w.beginArray(obj.a16.length); for (final item in obj.a16) { w.nextElement(); w.writeInt32(item); } w.endArray();
  w.endObject();
}

final SpecCodec<EdgeArrBoundary> EdgeArrBoundaryCodec = SpecCodec<EdgeArrBoundary>(
  encode: (w, obj) => writeEdgeArrBoundary(w, obj),
  decode: (r) {
    List<int> a15Val = [];
    List<int> a16Val = [];
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a15': a15Val = () { final list = <int>[]; r.beginArray(); while (r.hasNextElement()) { list.add(r.readInt32()); } r.endArray(); return list; }(); break;
        case 'a16': a16Val = () { final list = <int>[]; r.beginArray(); while (r.hasNextElement()) { list.add(r.readInt32()); } r.endArray(); return list; }(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return EdgeArrBoundary(a15: a15Val, a16: a16Val);
  },
);

class OptArr1 {
  final String req;
  final List<int>? items;
  OptArr1({required this.req, this.items});
}

void writeOptArr1(SpecWriter w, OptArr1 obj) {
  var fieldCount = 1;
  if (obj.items != null) fieldCount++;
  w.beginObject(fieldCount);
  w.writeField('req'); w.writeString(obj.req);
  if (obj.items != null) { w.writeField('items'); w.beginArray(obj.items!.length); for (final item in obj.items!) { w.nextElement(); w.writeInt32(item); } w.endArray(); }
  w.endObject();
}

final SpecCodec<OptArr1> OptArr1Codec = SpecCodec<OptArr1>(
  encode: (w, obj) => writeOptArr1(w, obj),
  decode: (r) {
    String reqVal = '';
    List<int>? itemsVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'req': reqVal = r.readString(); break;
        case 'items': itemsVal = () { final list = <int>[]; r.beginArray(); while (r.hasNextElement()) { list.add(r.readInt32()); } r.endArray(); return list; }(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptArr1(req: reqVal, items: itemsVal);
  },
);

class OptArr2 {
  final int id;
  final List<String>? names;
  final List<bool>? flags;
  OptArr2({required this.id, this.names, this.flags});
}

void writeOptArr2(SpecWriter w, OptArr2 obj) {
  var fieldCount = 1;
  if (obj.names != null) fieldCount++;
  if (obj.flags != null) fieldCount++;
  w.beginObject(fieldCount);
  w.writeField('id'); w.writeInt32(obj.id);
  if (obj.names != null) { w.writeField('names'); w.beginArray(obj.names!.length); for (final item in obj.names!) { w.nextElement(); w.writeString(item); } w.endArray(); }
  if (obj.flags != null) { w.writeField('flags'); w.beginArray(obj.flags!.length); for (final item in obj.flags!) { w.nextElement(); w.writeBool(item); } w.endArray(); }
  w.endObject();
}

final SpecCodec<OptArr2> OptArr2Codec = SpecCodec<OptArr2>(
  encode: (w, obj) => writeOptArr2(w, obj),
  decode: (r) {
    int idVal = 0;
    List<String>? namesVal;
    List<bool>? flagsVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'id': idVal = r.readInt32(); break;
        case 'names': namesVal = () { final list = <String>[]; r.beginArray(); while (r.hasNextElement()) { list.add(r.readString()); } r.endArray(); return list; }(); break;
        case 'flags': flagsVal = () { final list = <bool>[]; r.beginArray(); while (r.hasNextElement()) { list.add(r.readBool()); } r.endArray(); return list; }(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptArr2(id: idVal, names: namesVal, flags: flagsVal);
  },
);

class OptArr3 {
  final List<String>? a;
  final List<double>? b;
  OptArr3({this.a, this.b});
}

void writeOptArr3(SpecWriter w, OptArr3 obj) {
  var fieldCount = 0;
  if (obj.a != null) fieldCount++;
  if (obj.b != null) fieldCount++;
  w.beginObject(fieldCount);
  if (obj.a != null) { w.writeField('a'); w.beginArray(obj.a!.length); for (final item in obj.a!) { w.nextElement(); w.writeString(item); } w.endArray(); }
  if (obj.b != null) { w.writeField('b'); w.beginArray(obj.b!.length); for (final item in obj.b!) { w.nextElement(); w.writeFloat64(item); } w.endArray(); }
  w.endObject();
}

final SpecCodec<OptArr3> OptArr3Codec = SpecCodec<OptArr3>(
  encode: (w, obj) => writeOptArr3(w, obj),
  decode: (r) {
    List<String>? aVal;
    List<double>? bVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = () { final list = <String>[]; r.beginArray(); while (r.hasNextElement()) { list.add(r.readString()); } r.endArray(); return list; }(); break;
        case 'b': bVal = () { final list = <double>[]; r.beginArray(); while (r.hasNextElement()) { list.add(r.readFloat64()); } r.endArray(); return list; }(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptArr3(a: aVal, b: bVal);
  },
);

class OptArr4 {
  final Uint8List payload;
  final List<Uint8List>? chunks;
  OptArr4({required this.payload, this.chunks});
}

void writeOptArr4(SpecWriter w, OptArr4 obj) {
  var fieldCount = 1;
  if (obj.chunks != null) fieldCount++;
  w.beginObject(fieldCount);
  w.writeField('payload'); w.writeBytes(obj.payload);
  if (obj.chunks != null) { w.writeField('chunks'); w.beginArray(obj.chunks!.length); for (final item in obj.chunks!) { w.nextElement(); w.writeBytes(item); } w.endArray(); }
  w.endObject();
}

final SpecCodec<OptArr4> OptArr4Codec = SpecCodec<OptArr4>(
  encode: (w, obj) => writeOptArr4(w, obj),
  decode: (r) {
    Uint8List payloadVal = Uint8List(0);
    List<Uint8List>? chunksVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'payload': payloadVal = r.readBytes(); break;
        case 'chunks': chunksVal = () { final list = <Uint8List>[]; r.beginArray(); while (r.hasNextElement()) { list.add(r.readBytes()); } r.endArray(); return list; }(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptArr4(payload: payloadVal, chunks: chunksVal);
  },
);

class OptArr5 {
  final List<Inner>? models;
  final String name;
  OptArr5({this.models, required this.name});
}

void writeOptArr5(SpecWriter w, OptArr5 obj) {
  var fieldCount = 1;
  if (obj.models != null) fieldCount++;
  w.beginObject(fieldCount);
  if (obj.models != null) { w.writeField('models'); w.beginArray(obj.models!.length); for (final item in obj.models!) { w.nextElement(); writeInner(w, item); } w.endArray(); }
  w.writeField('name'); w.writeString(obj.name);
  w.endObject();
}

final SpecCodec<OptArr5> OptArr5Codec = SpecCodec<OptArr5>(
  encode: (w, obj) => writeOptArr5(w, obj),
  decode: (r) {
    List<Inner>? modelsVal;
    String nameVal = '';
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'models': modelsVal = () { final list = <Inner>[]; r.beginArray(); while (r.hasNextElement()) { list.add(InnerCodec.decode(r)); } r.endArray(); return list; }(); break;
        case 'name': nameVal = r.readString(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptArr5(models: modelsVal, name: nameVal);
  },
);

class NestOpt1 {
  final Label outer;
  final String name;
  NestOpt1({required this.outer, required this.name});
}

void writeNestOpt1(SpecWriter w, NestOpt1 obj) {
  w.beginObject(2);
  w.writeField('outer'); writeLabel(w, obj.outer);
  w.writeField('name'); w.writeString(obj.name);
  w.endObject();
}

final SpecCodec<NestOpt1> NestOpt1Codec = SpecCodec<NestOpt1>(
  encode: (w, obj) => writeNestOpt1(w, obj),
  decode: (r) {
    late Label outerVal;
    String nameVal = '';
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'outer': outerVal = LabelCodec.decode(r); break;
        case 'name': nameVal = r.readString(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return NestOpt1(outer: outerVal, name: nameVal);
  },
);

class NestOpt2 {
  final IdVal? a;
  final IdVal? b;
  final IdVal? c;
  NestOpt2({this.a, this.b, this.c});
}

void writeNestOpt2(SpecWriter w, NestOpt2 obj) {
  var fieldCount = 0;
  if (obj.a != null) fieldCount++;
  if (obj.b != null) fieldCount++;
  if (obj.c != null) fieldCount++;
  w.beginObject(fieldCount);
  if (obj.a != null) { w.writeField('a'); writeIdVal(w, obj.a!); }
  if (obj.b != null) { w.writeField('b'); writeIdVal(w, obj.b!); }
  if (obj.c != null) { w.writeField('c'); writeIdVal(w, obj.c!); }
  w.endObject();
}

final SpecCodec<NestOpt2> NestOpt2Codec = SpecCodec<NestOpt2>(
  encode: (w, obj) => writeNestOpt2(w, obj),
  decode: (r) {
    IdVal? aVal;
    IdVal? bVal;
    IdVal? cVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.isNull() ? (() { r.readNull(); return null; })() : IdValCodec.decode(r); break;
        case 'b': bVal = r.isNull() ? (() { r.readNull(); return null; })() : IdValCodec.decode(r); break;
        case 'c': cVal = r.isNull() ? (() { r.readNull(); return null; })() : IdValCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return NestOpt2(a: aVal, b: bVal, c: cVal);
  },
);

class NestOpt3 {
  final Money money;
  final Range32? value_range;
  NestOpt3({required this.money, this.value_range});
}

void writeNestOpt3(SpecWriter w, NestOpt3 obj) {
  var fieldCount = 1;
  if (obj.value_range != null) fieldCount++;
  w.beginObject(fieldCount);
  w.writeField('money'); writeMoney(w, obj.money);
  if (obj.value_range != null) { w.writeField('value_range'); writeRange32(w, obj.value_range!); }
  w.endObject();
}

final SpecCodec<NestOpt3> NestOpt3Codec = SpecCodec<NestOpt3>(
  encode: (w, obj) => writeNestOpt3(w, obj),
  decode: (r) {
    late Money moneyVal;
    Range32? value_rangeVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'money': moneyVal = MoneyCodec.decode(r); break;
        case 'value_range': value_rangeVal = r.isNull() ? (() { r.readNull(); return null; })() : Range32Codec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return NestOpt3(money: moneyVal, value_range: value_rangeVal);
  },
);

class NestOpt4 {
  final Addr? addr;
  final Coord? coord;
  final String name;
  NestOpt4({this.addr, this.coord, required this.name});
}

void writeNestOpt4(SpecWriter w, NestOpt4 obj) {
  var fieldCount = 1;
  if (obj.addr != null) fieldCount++;
  if (obj.coord != null) fieldCount++;
  w.beginObject(fieldCount);
  if (obj.addr != null) { w.writeField('addr'); writeAddr(w, obj.addr!); }
  if (obj.coord != null) { w.writeField('coord'); writeCoord(w, obj.coord!); }
  w.writeField('name'); w.writeString(obj.name);
  w.endObject();
}

final SpecCodec<NestOpt4> NestOpt4Codec = SpecCodec<NestOpt4>(
  encode: (w, obj) => writeNestOpt4(w, obj),
  decode: (r) {
    Addr? addrVal;
    Coord? coordVal;
    String nameVal = '';
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'addr': addrVal = r.isNull() ? (() { r.readNull(); return null; })() : AddrCodec.decode(r); break;
        case 'coord': coordVal = r.isNull() ? (() { r.readNull(); return null; })() : CoordCodec.decode(r); break;
        case 'name': nameVal = r.readString(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return NestOpt4(addr: addrVal, coord: coordVal, name: nameVal);
  },
);

class NestOpt5 {
  final Point3 point;
  final Addr addr;
  final Label? label;
  NestOpt5({required this.point, required this.addr, this.label});
}

void writeNestOpt5(SpecWriter w, NestOpt5 obj) {
  var fieldCount = 2;
  if (obj.label != null) fieldCount++;
  w.beginObject(fieldCount);
  w.writeField('point'); writePoint3(w, obj.point);
  w.writeField('addr'); writeAddr(w, obj.addr);
  if (obj.label != null) { w.writeField('label'); writeLabel(w, obj.label!); }
  w.endObject();
}

final SpecCodec<NestOpt5> NestOpt5Codec = SpecCodec<NestOpt5>(
  encode: (w, obj) => writeNestOpt5(w, obj),
  decode: (r) {
    late Point3 pointVal;
    late Addr addrVal;
    Label? labelVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'point': pointVal = Point3Codec.decode(r); break;
        case 'addr': addrVal = AddrCodec.decode(r); break;
        case 'label': labelVal = r.isNull() ? (() { r.readNull(); return null; })() : LabelCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return NestOpt5(point: pointVal, addr: addrVal, label: labelVal);
  },
);

class NestOptInner1 {
  final String tag;
  final OptInner? nested;
  NestOptInner1({required this.tag, this.nested});
}

void writeNestOptInner1(SpecWriter w, NestOptInner1 obj) {
  var fieldCount = 1;
  if (obj.nested != null) fieldCount++;
  w.beginObject(fieldCount);
  w.writeField('tag'); w.writeString(obj.tag);
  if (obj.nested != null) { w.writeField('nested'); writeOptInner(w, obj.nested!); }
  w.endObject();
}

final SpecCodec<NestOptInner1> NestOptInner1Codec = SpecCodec<NestOptInner1>(
  encode: (w, obj) => writeNestOptInner1(w, obj),
  decode: (r) {
    String tagVal = '';
    OptInner? nestedVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'tag': tagVal = r.readString(); break;
        case 'nested': nestedVal = r.isNull() ? (() { r.readNull(); return null; })() : OptInnerCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return NestOptInner1(tag: tagVal, nested: nestedVal);
  },
);

class NestOptInner2 {
  final String tag;
  final OptInner nested;
  NestOptInner2({required this.tag, required this.nested});
}

void writeNestOptInner2(SpecWriter w, NestOptInner2 obj) {
  w.beginObject(2);
  w.writeField('tag'); w.writeString(obj.tag);
  w.writeField('nested'); writeOptInner(w, obj.nested);
  w.endObject();
}

final SpecCodec<NestOptInner2> NestOptInner2Codec = SpecCodec<NestOptInner2>(
  encode: (w, obj) => writeNestOptInner2(w, obj),
  decode: (r) {
    String tagVal = '';
    late OptInner nestedVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'tag': tagVal = r.readString(); break;
        case 'nested': nestedVal = OptInnerCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return NestOptInner2(tag: tagVal, nested: nestedVal);
  },
);

class NestOptInner3 {
  final OptInner? outer;
  final OptInner? nested;
  NestOptInner3({this.outer, this.nested});
}

void writeNestOptInner3(SpecWriter w, NestOptInner3 obj) {
  var fieldCount = 0;
  if (obj.outer != null) fieldCount++;
  if (obj.nested != null) fieldCount++;
  w.beginObject(fieldCount);
  if (obj.outer != null) { w.writeField('outer'); writeOptInner(w, obj.outer!); }
  if (obj.nested != null) { w.writeField('nested'); writeOptInner(w, obj.nested!); }
  w.endObject();
}

final SpecCodec<NestOptInner3> NestOptInner3Codec = SpecCodec<NestOptInner3>(
  encode: (w, obj) => writeNestOptInner3(w, obj),
  decode: (r) {
    OptInner? outerVal;
    OptInner? nestedVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'outer': outerVal = r.isNull() ? (() { r.readNull(); return null; })() : OptInnerCodec.decode(r); break;
        case 'nested': nestedVal = r.isNull() ? (() { r.readNull(); return null; })() : OptInnerCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return NestOptInner3(outer: outerVal, nested: nestedVal);
  },
);

class DeepNest1 {
  final String label;
  final Addr nested;
  DeepNest1({required this.label, required this.nested});
}

void writeDeepNest1(SpecWriter w, DeepNest1 obj) {
  w.beginObject(2);
  w.writeField('label'); w.writeString(obj.label);
  w.writeField('nested'); writeAddr(w, obj.nested);
  w.endObject();
}

final SpecCodec<DeepNest1> DeepNest1Codec = SpecCodec<DeepNest1>(
  encode: (w, obj) => writeDeepNest1(w, obj),
  decode: (r) {
    String labelVal = '';
    late Addr nestedVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'label': labelVal = r.readString(); break;
        case 'nested': nestedVal = AddrCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DeepNest1(label: labelVal, nested: nestedVal);
  },
);

class DeepNest2 {
  final String name;
  final Money money;
  final Addr addr;
  DeepNest2({required this.name, required this.money, required this.addr});
}

void writeDeepNest2(SpecWriter w, DeepNest2 obj) {
  w.beginObject(3);
  w.writeField('name'); w.writeString(obj.name);
  w.writeField('money'); writeMoney(w, obj.money);
  w.writeField('addr'); writeAddr(w, obj.addr);
  w.endObject();
}

final SpecCodec<DeepNest2> DeepNest2Codec = SpecCodec<DeepNest2>(
  encode: (w, obj) => writeDeepNest2(w, obj),
  decode: (r) {
    String nameVal = '';
    late Money moneyVal;
    late Addr addrVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'name': nameVal = r.readString(); break;
        case 'money': moneyVal = MoneyCodec.decode(r); break;
        case 'addr': addrVal = AddrCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DeepNest2(name: nameVal, money: moneyVal, addr: addrVal);
  },
);

class DeepNest3 {
  final String title;
  final Point3 point;
  final Range32 value_range;
  final Money money;
  DeepNest3({required this.title, required this.point, required this.value_range, required this.money});
}

void writeDeepNest3(SpecWriter w, DeepNest3 obj) {
  w.beginObject(4);
  w.writeField('title'); w.writeString(obj.title);
  w.writeField('point'); writePoint3(w, obj.point);
  w.writeField('value_range'); writeRange32(w, obj.value_range);
  w.writeField('money'); writeMoney(w, obj.money);
  w.endObject();
}

final SpecCodec<DeepNest3> DeepNest3Codec = SpecCodec<DeepNest3>(
  encode: (w, obj) => writeDeepNest3(w, obj),
  decode: (r) {
    String titleVal = '';
    late Point3 pointVal;
    late Range32 value_rangeVal;
    late Money moneyVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'title': titleVal = r.readString(); break;
        case 'point': pointVal = Point3Codec.decode(r); break;
        case 'value_range': value_rangeVal = Range32Codec.decode(r); break;
        case 'money': moneyVal = MoneyCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DeepNest3(title: titleVal, point: pointVal, value_range: value_rangeVal, money: moneyVal);
  },
);

class DeepNest4 {
  final List<Coord> coords;
  final Inner nested;
  final String tag;
  DeepNest4({required this.coords, required this.nested, required this.tag});
}

void writeDeepNest4(SpecWriter w, DeepNest4 obj) {
  w.beginObject(3);
  w.writeField('coords'); w.beginArray(obj.coords.length); for (final item in obj.coords) { w.nextElement(); writeCoord(w, item); } w.endArray();
  w.writeField('nested'); writeInner(w, obj.nested);
  w.writeField('tag'); w.writeString(obj.tag);
  w.endObject();
}

final SpecCodec<DeepNest4> DeepNest4Codec = SpecCodec<DeepNest4>(
  encode: (w, obj) => writeDeepNest4(w, obj),
  decode: (r) {
    List<Coord> coordsVal = [];
    late Inner nestedVal;
    String tagVal = '';
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'coords': coordsVal = () { final list = <Coord>[]; r.beginArray(); while (r.hasNextElement()) { list.add(CoordCodec.decode(r)); } r.endArray(); return list; }(); break;
        case 'nested': nestedVal = InnerCodec.decode(r); break;
        case 'tag': tagVal = r.readString(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DeepNest4(coords: coordsVal, nested: nestedVal, tag: tagVal);
  },
);

class DeepNest5 {
  final List<Label> labels;
  final Money money;
  final String name;
  DeepNest5({required this.labels, required this.money, required this.name});
}

void writeDeepNest5(SpecWriter w, DeepNest5 obj) {
  w.beginObject(3);
  w.writeField('labels'); w.beginArray(obj.labels.length); for (final item in obj.labels) { w.nextElement(); writeLabel(w, item); } w.endArray();
  w.writeField('money'); writeMoney(w, obj.money);
  w.writeField('name'); w.writeString(obj.name);
  w.endObject();
}

final SpecCodec<DeepNest5> DeepNest5Codec = SpecCodec<DeepNest5>(
  encode: (w, obj) => writeDeepNest5(w, obj),
  decode: (r) {
    List<Label> labelsVal = [];
    late Money moneyVal;
    String nameVal = '';
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'labels': labelsVal = () { final list = <Label>[]; r.beginArray(); while (r.hasNextElement()) { list.add(LabelCodec.decode(r)); } r.endArray(); return list; }(); break;
        case 'money': moneyVal = MoneyCodec.decode(r); break;
        case 'name': nameVal = r.readString(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DeepNest5(labels: labelsVal, money: moneyVal, name: nameVal);
  },
);

class DeepNest6 {
  final List<IdVal> items;
  final Addr? addr;
  final Coord coord;
  DeepNest6({required this.items, this.addr, required this.coord});
}

void writeDeepNest6(SpecWriter w, DeepNest6 obj) {
  var fieldCount = 2;
  if (obj.addr != null) fieldCount++;
  w.beginObject(fieldCount);
  w.writeField('items'); w.beginArray(obj.items.length); for (final item in obj.items) { w.nextElement(); writeIdVal(w, item); } w.endArray();
  if (obj.addr != null) { w.writeField('addr'); writeAddr(w, obj.addr!); }
  w.writeField('coord'); writeCoord(w, obj.coord);
  w.endObject();
}

final SpecCodec<DeepNest6> DeepNest6Codec = SpecCodec<DeepNest6>(
  encode: (w, obj) => writeDeepNest6(w, obj),
  decode: (r) {
    List<IdVal> itemsVal = [];
    Addr? addrVal;
    late Coord coordVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'items': itemsVal = () { final list = <IdVal>[]; r.beginArray(); while (r.hasNextElement()) { list.add(IdValCodec.decode(r)); } r.endArray(); return list; }(); break;
        case 'addr': addrVal = r.isNull() ? (() { r.readNull(); return null; })() : AddrCodec.decode(r); break;
        case 'coord': coordVal = CoordCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DeepNest6(items: itemsVal, addr: addrVal, coord: coordVal);
  },
);

class DeepNest7 {
  final Addr a;
  final Addr b;
  final Addr c;
  DeepNest7({required this.a, required this.b, required this.c});
}

void writeDeepNest7(SpecWriter w, DeepNest7 obj) {
  w.beginObject(3);
  w.writeField('a'); writeAddr(w, obj.a);
  w.writeField('b'); writeAddr(w, obj.b);
  w.writeField('c'); writeAddr(w, obj.c);
  w.endObject();
}

final SpecCodec<DeepNest7> DeepNest7Codec = SpecCodec<DeepNest7>(
  encode: (w, obj) => writeDeepNest7(w, obj),
  decode: (r) {
    late Addr aVal;
    late Addr bVal;
    late Addr cVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = AddrCodec.decode(r); break;
        case 'b': bVal = AddrCodec.decode(r); break;
        case 'c': cVal = AddrCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DeepNest7(a: aVal, b: bVal, c: cVal);
  },
);

class TimestampEntry {
  final BigInt ts;
  final String event;
  final Uint8List? payload;
  TimestampEntry({required this.ts, required this.event, this.payload});
}

void writeTimestampEntry(SpecWriter w, TimestampEntry obj) {
  var fieldCount = 2;
  if (obj.payload != null) fieldCount++;
  w.beginObject(fieldCount);
  w.writeField('ts'); w.writeInt64(obj.ts);
  w.writeField('event'); w.writeString(obj.event);
  if (obj.payload != null) { w.writeField('payload'); w.writeBytes(obj.payload!); }
  w.endObject();
}

final SpecCodec<TimestampEntry> TimestampEntryCodec = SpecCodec<TimestampEntry>(
  encode: (w, obj) => writeTimestampEntry(w, obj),
  decode: (r) {
    BigInt tsVal = BigInt.zero;
    String eventVal = '';
    Uint8List? payloadVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'ts': tsVal = r.readInt64(); break;
        case 'event': eventVal = r.readString(); break;
        case 'payload': payloadVal = r.readBytes(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return TimestampEntry(ts: tsVal, event: eventVal, payload: payloadVal);
  },
);

class ConfigEntry {
  final String key;
  final int? intValue;
  final String? strValue;
  final bool? boolValue;
  final double? floatValue;
  ConfigEntry({required this.key, this.intValue, this.strValue, this.boolValue, this.floatValue});
}

void writeConfigEntry(SpecWriter w, ConfigEntry obj) {
  var fieldCount = 1;
  if (obj.intValue != null) fieldCount++;
  if (obj.strValue != null) fieldCount++;
  if (obj.boolValue != null) fieldCount++;
  if (obj.floatValue != null) fieldCount++;
  w.beginObject(fieldCount);
  w.writeField('key'); w.writeString(obj.key);
  if (obj.intValue != null) { w.writeField('intValue'); w.writeInt32(obj.intValue!); }
  if (obj.strValue != null) { w.writeField('strValue'); w.writeString(obj.strValue!); }
  if (obj.boolValue != null) { w.writeField('boolValue'); w.writeBool(obj.boolValue!); }
  if (obj.floatValue != null) { w.writeField('floatValue'); w.writeFloat64(obj.floatValue!); }
  w.endObject();
}

final SpecCodec<ConfigEntry> ConfigEntryCodec = SpecCodec<ConfigEntry>(
  encode: (w, obj) => writeConfigEntry(w, obj),
  decode: (r) {
    String keyVal = '';
    int? intValueVal;
    String? strValueVal;
    bool? boolValueVal;
    double? floatValueVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'key': keyVal = r.readString(); break;
        case 'intValue': intValueVal = r.readInt32(); break;
        case 'strValue': strValueVal = r.readString(); break;
        case 'boolValue': boolValueVal = r.readBool(); break;
        case 'floatValue': floatValueVal = r.readFloat64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return ConfigEntry(key: keyVal, intValue: intValueVal, strValue: strValueVal, boolValue: boolValueVal, floatValue: floatValueVal);
  },
);
