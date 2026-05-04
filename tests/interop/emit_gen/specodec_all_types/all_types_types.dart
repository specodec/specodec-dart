library specodec_all_types;

import 'dart:typed_data';
import 'package:specodec/specodec.dart';

class Inner {
  final int x;
  final int y;
  Inner({required this.x, required this.y});
}

void _writeInner(SpecWriter w, Inner obj) {
  w.beginObject(2);
  w.writeField('x'); w.writeInt32(obj.x);
  w.writeField('y'); w.writeInt32(obj.y);
  w.endObject();
}

final InnerCodec = SpecCodec<Inner>(
  encode: (w, obj) => _writeInner(w, obj),
  decode: (r) {
    int _x = 0;
    int _y = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'x': _x = r.readInt32(); break;
        case 'y': _y = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Inner(x: _x, y: _y);
  },
);

class Coord {
  final double lat;
  final double lng;
  Coord({required this.lat, required this.lng});
}

void _writeCoord(SpecWriter w, Coord obj) {
  w.beginObject(2);
  w.writeField('lat'); w.writeFloat64(obj.lat);
  w.writeField('lng'); w.writeFloat64(obj.lng);
  w.endObject();
}

final CoordCodec = SpecCodec<Coord>(
  encode: (w, obj) => _writeCoord(w, obj),
  decode: (r) {
    double _lat = 0.0;
    double _lng = 0.0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'lat': _lat = r.readFloat64(); break;
        case 'lng': _lng = r.readFloat64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Coord(lat: _lat, lng: _lng);
  },
);

class IdVal {
  final String id;
  final int value;
  IdVal({required this.id, required this.value});
}

void _writeIdVal(SpecWriter w, IdVal obj) {
  w.beginObject(2);
  w.writeField('id'); w.writeString(obj.id);
  w.writeField('value'); w.writeInt32(obj.value);
  w.endObject();
}

final IdValCodec = SpecCodec<IdVal>(
  encode: (w, obj) => _writeIdVal(w, obj),
  decode: (r) {
    String _id = '';
    int _value = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'id': _id = r.readString(); break;
        case 'value': _value = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return IdVal(id: _id, value: _value);
  },
);

class Label {
  final String key;
  final String text;
  Label({required this.key, required this.text});
}

void _writeLabel(SpecWriter w, Label obj) {
  w.beginObject(2);
  w.writeField('key'); w.writeString(obj.key);
  w.writeField('text'); w.writeString(obj.text);
  w.endObject();
}

final LabelCodec = SpecCodec<Label>(
  encode: (w, obj) => _writeLabel(w, obj),
  decode: (r) {
    String _key = '';
    String _text = '';
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'key': _key = r.readString(); break;
        case 'text': _text = r.readString(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Label(key: _key, text: _text);
  },
);

class Money {
  final BigInt amount;
  final String currency;
  Money({required this.amount, required this.currency});
}

void _writeMoney(SpecWriter w, Money obj) {
  w.beginObject(2);
  w.writeField('amount'); w.writeInt64(obj.amount);
  w.writeField('currency'); w.writeString(obj.currency);
  w.endObject();
}

final MoneyCodec = SpecCodec<Money>(
  encode: (w, obj) => _writeMoney(w, obj),
  decode: (r) {
    BigInt _amount = BigInt.zero;
    String _currency = '';
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'amount': _amount = r.readInt64(); break;
        case 'currency': _currency = r.readString(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Money(amount: _amount, currency: _currency);
  },
);

class Range32 {
  final int min;
  final int max;
  Range32({required this.min, required this.max});
}

void _writeRange32(SpecWriter w, Range32 obj) {
  w.beginObject(2);
  w.writeField('min'); w.writeInt32(obj.min);
  w.writeField('max'); w.writeInt32(obj.max);
  w.endObject();
}

final Range32Codec = SpecCodec<Range32>(
  encode: (w, obj) => _writeRange32(w, obj),
  decode: (r) {
    int _min = 0;
    int _max = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'min': _min = r.readInt32(); break;
        case 'max': _max = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Range32(min: _min, max: _max);
  },
);

class Addr {
  final String street;
  final String city;
  final String zip;
  Addr({required this.street, required this.city, required this.zip});
}

void _writeAddr(SpecWriter w, Addr obj) {
  w.beginObject(3);
  w.writeField('street'); w.writeString(obj.street);
  w.writeField('city'); w.writeString(obj.city);
  w.writeField('zip'); w.writeString(obj.zip);
  w.endObject();
}

final AddrCodec = SpecCodec<Addr>(
  encode: (w, obj) => _writeAddr(w, obj),
  decode: (r) {
    String _street = '';
    String _city = '';
    String _zip = '';
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'street': _street = r.readString(); break;
        case 'city': _city = r.readString(); break;
        case 'zip': _zip = r.readString(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Addr(street: _street, city: _city, zip: _zip);
  },
);

class Point3 {
  final double x;
  final double y;
  final double z;
  Point3({required this.x, required this.y, required this.z});
}

void _writePoint3(SpecWriter w, Point3 obj) {
  w.beginObject(3);
  w.writeField('x'); w.writeFloat64(obj.x);
  w.writeField('y'); w.writeFloat64(obj.y);
  w.writeField('z'); w.writeFloat64(obj.z);
  w.endObject();
}

final Point3Codec = SpecCodec<Point3>(
  encode: (w, obj) => _writePoint3(w, obj),
  decode: (r) {
    double _x = 0.0;
    double _y = 0.0;
    double _z = 0.0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'x': _x = r.readFloat64(); break;
        case 'y': _y = r.readFloat64(); break;
        case 'z': _z = r.readFloat64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Point3(x: _x, y: _y, z: _z);
  },
);

class OptInner {
  final String? name;
  final double? score;
  final String? tag;
  OptInner({this.name, this.score, this.tag});
}

void _writeOptInner(SpecWriter w, OptInner obj) {
  var _n = 0;
  if (obj.name != null) _n++;
  if (obj.score != null) _n++;
  if (obj.tag != null) _n++;
  w.beginObject(_n);
  if (obj.name != null) { w.writeField('name'); w.writeString(obj.name!); }
  if (obj.score != null) { w.writeField('score'); w.writeFloat64(obj.score!); }
  if (obj.tag != null) { w.writeField('tag'); w.writeString(obj.tag!); }
  w.endObject();
}

final OptInnerCodec = SpecCodec<OptInner>(
  encode: (w, obj) => _writeOptInner(w, obj),
  decode: (r) {
    String? _name;
    double? _score;
    String? _tag;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'name': _name = r.readString(); break;
        case 'score': _score = r.readFloat64(); break;
        case 'tag': _tag = r.readString(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptInner(name: _name, score: _score, tag: _tag);
  },
);

class SingleString {
  final String v;
  SingleString({required this.v});
}

void _writeSingleString(SpecWriter w, SingleString obj) {
  w.beginObject(1);
  w.writeField('v'); w.writeString(obj.v);
  w.endObject();
}

final SingleStringCodec = SpecCodec<SingleString>(
  encode: (w, obj) => _writeSingleString(w, obj),
  decode: (r) {
    String _v = '';
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'v': _v = r.readString(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return SingleString(v: _v);
  },
);

class SingleBoolean {
  final bool v;
  SingleBoolean({required this.v});
}

void _writeSingleBoolean(SpecWriter w, SingleBoolean obj) {
  w.beginObject(1);
  w.writeField('v'); w.writeBool(obj.v);
  w.endObject();
}

final SingleBooleanCodec = SpecCodec<SingleBoolean>(
  encode: (w, obj) => _writeSingleBoolean(w, obj),
  decode: (r) {
    bool _v = false;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'v': _v = r.readBool(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return SingleBoolean(v: _v);
  },
);

class SingleInt8 {
  final int v;
  SingleInt8({required this.v});
}

void _writeSingleInt8(SpecWriter w, SingleInt8 obj) {
  w.beginObject(1);
  w.writeField('v'); w.writeInt32(obj.v);
  w.endObject();
}

final SingleInt8Codec = SpecCodec<SingleInt8>(
  encode: (w, obj) => _writeSingleInt8(w, obj),
  decode: (r) {
    int _v = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'v': _v = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return SingleInt8(v: _v);
  },
);

class SingleInt16 {
  final int v;
  SingleInt16({required this.v});
}

void _writeSingleInt16(SpecWriter w, SingleInt16 obj) {
  w.beginObject(1);
  w.writeField('v'); w.writeInt32(obj.v);
  w.endObject();
}

final SingleInt16Codec = SpecCodec<SingleInt16>(
  encode: (w, obj) => _writeSingleInt16(w, obj),
  decode: (r) {
    int _v = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'v': _v = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return SingleInt16(v: _v);
  },
);

class SingleInt32 {
  final int v;
  SingleInt32({required this.v});
}

void _writeSingleInt32(SpecWriter w, SingleInt32 obj) {
  w.beginObject(1);
  w.writeField('v'); w.writeInt32(obj.v);
  w.endObject();
}

final SingleInt32Codec = SpecCodec<SingleInt32>(
  encode: (w, obj) => _writeSingleInt32(w, obj),
  decode: (r) {
    int _v = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'v': _v = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return SingleInt32(v: _v);
  },
);

class SingleInt64 {
  final BigInt v;
  SingleInt64({required this.v});
}

void _writeSingleInt64(SpecWriter w, SingleInt64 obj) {
  w.beginObject(1);
  w.writeField('v'); w.writeInt64(obj.v);
  w.endObject();
}

final SingleInt64Codec = SpecCodec<SingleInt64>(
  encode: (w, obj) => _writeSingleInt64(w, obj),
  decode: (r) {
    BigInt _v = BigInt.zero;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'v': _v = r.readInt64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return SingleInt64(v: _v);
  },
);

class SingleUint8 {
  final int v;
  SingleUint8({required this.v});
}

void _writeSingleUint8(SpecWriter w, SingleUint8 obj) {
  w.beginObject(1);
  w.writeField('v'); w.writeUint32(obj.v);
  w.endObject();
}

final SingleUint8Codec = SpecCodec<SingleUint8>(
  encode: (w, obj) => _writeSingleUint8(w, obj),
  decode: (r) {
    int _v = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'v': _v = r.readUint32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return SingleUint8(v: _v);
  },
);

class SingleUint16 {
  final int v;
  SingleUint16({required this.v});
}

void _writeSingleUint16(SpecWriter w, SingleUint16 obj) {
  w.beginObject(1);
  w.writeField('v'); w.writeUint32(obj.v);
  w.endObject();
}

final SingleUint16Codec = SpecCodec<SingleUint16>(
  encode: (w, obj) => _writeSingleUint16(w, obj),
  decode: (r) {
    int _v = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'v': _v = r.readUint32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return SingleUint16(v: _v);
  },
);

class SingleUint32 {
  final int v;
  SingleUint32({required this.v});
}

void _writeSingleUint32(SpecWriter w, SingleUint32 obj) {
  w.beginObject(1);
  w.writeField('v'); w.writeUint32(obj.v);
  w.endObject();
}

final SingleUint32Codec = SpecCodec<SingleUint32>(
  encode: (w, obj) => _writeSingleUint32(w, obj),
  decode: (r) {
    int _v = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'v': _v = r.readUint32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return SingleUint32(v: _v);
  },
);

class SingleUint64 {
  final BigInt v;
  SingleUint64({required this.v});
}

void _writeSingleUint64(SpecWriter w, SingleUint64 obj) {
  w.beginObject(1);
  w.writeField('v'); w.writeUint64(obj.v);
  w.endObject();
}

final SingleUint64Codec = SpecCodec<SingleUint64>(
  encode: (w, obj) => _writeSingleUint64(w, obj),
  decode: (r) {
    BigInt _v = BigInt.zero;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'v': _v = r.readUint64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return SingleUint64(v: _v);
  },
);

class SingleFloat32 {
  final double v;
  SingleFloat32({required this.v});
}

void _writeSingleFloat32(SpecWriter w, SingleFloat32 obj) {
  w.beginObject(1);
  w.writeField('v'); w.writeFloat32(obj.v);
  w.endObject();
}

final SingleFloat32Codec = SpecCodec<SingleFloat32>(
  encode: (w, obj) => _writeSingleFloat32(w, obj),
  decode: (r) {
    double _v = 0.0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'v': _v = r.readFloat32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return SingleFloat32(v: _v);
  },
);

class SingleFloat64 {
  final double v;
  SingleFloat64({required this.v});
}

void _writeSingleFloat64(SpecWriter w, SingleFloat64 obj) {
  w.beginObject(1);
  w.writeField('v'); w.writeFloat64(obj.v);
  w.endObject();
}

final SingleFloat64Codec = SpecCodec<SingleFloat64>(
  encode: (w, obj) => _writeSingleFloat64(w, obj),
  decode: (r) {
    double _v = 0.0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'v': _v = r.readFloat64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return SingleFloat64(v: _v);
  },
);

class SingleBytes {
  final Uint8List v;
  SingleBytes({required this.v});
}

void _writeSingleBytes(SpecWriter w, SingleBytes obj) {
  w.beginObject(1);
  w.writeField('v'); w.writeBytes(obj.v);
  w.endObject();
}

final SingleBytesCodec = SpecCodec<SingleBytes>(
  encode: (w, obj) => _writeSingleBytes(w, obj),
  decode: (r) {
    Uint8List _v = Uint8List(0);
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'v': _v = r.readBytes(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return SingleBytes(v: _v);
  },
);

class OptSingleString {
  final String? v;
  OptSingleString({this.v});
}

void _writeOptSingleString(SpecWriter w, OptSingleString obj) {
  var _n = 0;
  if (obj.v != null) _n++;
  w.beginObject(_n);
  if (obj.v != null) { w.writeField('v'); w.writeString(obj.v!); }
  w.endObject();
}

final OptSingleStringCodec = SpecCodec<OptSingleString>(
  encode: (w, obj) => _writeOptSingleString(w, obj),
  decode: (r) {
    String? _v;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'v': _v = r.readString(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptSingleString(v: _v);
  },
);

class OptSingleBoolean {
  final bool? v;
  OptSingleBoolean({this.v});
}

void _writeOptSingleBoolean(SpecWriter w, OptSingleBoolean obj) {
  var _n = 0;
  if (obj.v != null) _n++;
  w.beginObject(_n);
  if (obj.v != null) { w.writeField('v'); w.writeBool(obj.v!); }
  w.endObject();
}

final OptSingleBooleanCodec = SpecCodec<OptSingleBoolean>(
  encode: (w, obj) => _writeOptSingleBoolean(w, obj),
  decode: (r) {
    bool? _v;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'v': _v = r.readBool(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptSingleBoolean(v: _v);
  },
);

class OptSingleInt8 {
  final int? v;
  OptSingleInt8({this.v});
}

void _writeOptSingleInt8(SpecWriter w, OptSingleInt8 obj) {
  var _n = 0;
  if (obj.v != null) _n++;
  w.beginObject(_n);
  if (obj.v != null) { w.writeField('v'); w.writeInt32(obj.v!); }
  w.endObject();
}

final OptSingleInt8Codec = SpecCodec<OptSingleInt8>(
  encode: (w, obj) => _writeOptSingleInt8(w, obj),
  decode: (r) {
    int? _v;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'v': _v = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptSingleInt8(v: _v);
  },
);

class OptSingleInt16 {
  final int? v;
  OptSingleInt16({this.v});
}

void _writeOptSingleInt16(SpecWriter w, OptSingleInt16 obj) {
  var _n = 0;
  if (obj.v != null) _n++;
  w.beginObject(_n);
  if (obj.v != null) { w.writeField('v'); w.writeInt32(obj.v!); }
  w.endObject();
}

final OptSingleInt16Codec = SpecCodec<OptSingleInt16>(
  encode: (w, obj) => _writeOptSingleInt16(w, obj),
  decode: (r) {
    int? _v;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'v': _v = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptSingleInt16(v: _v);
  },
);

class OptSingleInt32 {
  final int? v;
  OptSingleInt32({this.v});
}

void _writeOptSingleInt32(SpecWriter w, OptSingleInt32 obj) {
  var _n = 0;
  if (obj.v != null) _n++;
  w.beginObject(_n);
  if (obj.v != null) { w.writeField('v'); w.writeInt32(obj.v!); }
  w.endObject();
}

final OptSingleInt32Codec = SpecCodec<OptSingleInt32>(
  encode: (w, obj) => _writeOptSingleInt32(w, obj),
  decode: (r) {
    int? _v;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'v': _v = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptSingleInt32(v: _v);
  },
);

class OptSingleInt64 {
  final BigInt? v;
  OptSingleInt64({this.v});
}

void _writeOptSingleInt64(SpecWriter w, OptSingleInt64 obj) {
  var _n = 0;
  if (obj.v != null) _n++;
  w.beginObject(_n);
  if (obj.v != null) { w.writeField('v'); w.writeInt64(obj.v!); }
  w.endObject();
}

final OptSingleInt64Codec = SpecCodec<OptSingleInt64>(
  encode: (w, obj) => _writeOptSingleInt64(w, obj),
  decode: (r) {
    BigInt? _v;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'v': _v = r.readInt64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptSingleInt64(v: _v);
  },
);

class OptSingleUint8 {
  final int? v;
  OptSingleUint8({this.v});
}

void _writeOptSingleUint8(SpecWriter w, OptSingleUint8 obj) {
  var _n = 0;
  if (obj.v != null) _n++;
  w.beginObject(_n);
  if (obj.v != null) { w.writeField('v'); w.writeUint32(obj.v!); }
  w.endObject();
}

final OptSingleUint8Codec = SpecCodec<OptSingleUint8>(
  encode: (w, obj) => _writeOptSingleUint8(w, obj),
  decode: (r) {
    int? _v;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'v': _v = r.readUint32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptSingleUint8(v: _v);
  },
);

class OptSingleUint16 {
  final int? v;
  OptSingleUint16({this.v});
}

void _writeOptSingleUint16(SpecWriter w, OptSingleUint16 obj) {
  var _n = 0;
  if (obj.v != null) _n++;
  w.beginObject(_n);
  if (obj.v != null) { w.writeField('v'); w.writeUint32(obj.v!); }
  w.endObject();
}

final OptSingleUint16Codec = SpecCodec<OptSingleUint16>(
  encode: (w, obj) => _writeOptSingleUint16(w, obj),
  decode: (r) {
    int? _v;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'v': _v = r.readUint32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptSingleUint16(v: _v);
  },
);

class OptSingleUint32 {
  final int? v;
  OptSingleUint32({this.v});
}

void _writeOptSingleUint32(SpecWriter w, OptSingleUint32 obj) {
  var _n = 0;
  if (obj.v != null) _n++;
  w.beginObject(_n);
  if (obj.v != null) { w.writeField('v'); w.writeUint32(obj.v!); }
  w.endObject();
}

final OptSingleUint32Codec = SpecCodec<OptSingleUint32>(
  encode: (w, obj) => _writeOptSingleUint32(w, obj),
  decode: (r) {
    int? _v;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'v': _v = r.readUint32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptSingleUint32(v: _v);
  },
);

class OptSingleUint64 {
  final BigInt? v;
  OptSingleUint64({this.v});
}

void _writeOptSingleUint64(SpecWriter w, OptSingleUint64 obj) {
  var _n = 0;
  if (obj.v != null) _n++;
  w.beginObject(_n);
  if (obj.v != null) { w.writeField('v'); w.writeUint64(obj.v!); }
  w.endObject();
}

final OptSingleUint64Codec = SpecCodec<OptSingleUint64>(
  encode: (w, obj) => _writeOptSingleUint64(w, obj),
  decode: (r) {
    BigInt? _v;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'v': _v = r.readUint64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptSingleUint64(v: _v);
  },
);

class OptSingleFloat32 {
  final double? v;
  OptSingleFloat32({this.v});
}

void _writeOptSingleFloat32(SpecWriter w, OptSingleFloat32 obj) {
  var _n = 0;
  if (obj.v != null) _n++;
  w.beginObject(_n);
  if (obj.v != null) { w.writeField('v'); w.writeFloat32(obj.v!); }
  w.endObject();
}

final OptSingleFloat32Codec = SpecCodec<OptSingleFloat32>(
  encode: (w, obj) => _writeOptSingleFloat32(w, obj),
  decode: (r) {
    double? _v;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'v': _v = r.readFloat32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptSingleFloat32(v: _v);
  },
);

class OptSingleFloat64 {
  final double? v;
  OptSingleFloat64({this.v});
}

void _writeOptSingleFloat64(SpecWriter w, OptSingleFloat64 obj) {
  var _n = 0;
  if (obj.v != null) _n++;
  w.beginObject(_n);
  if (obj.v != null) { w.writeField('v'); w.writeFloat64(obj.v!); }
  w.endObject();
}

final OptSingleFloat64Codec = SpecCodec<OptSingleFloat64>(
  encode: (w, obj) => _writeOptSingleFloat64(w, obj),
  decode: (r) {
    double? _v;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'v': _v = r.readFloat64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptSingleFloat64(v: _v);
  },
);

class OptSingleBytes {
  final Uint8List? v;
  OptSingleBytes({this.v});
}

void _writeOptSingleBytes(SpecWriter w, OptSingleBytes obj) {
  var _n = 0;
  if (obj.v != null) _n++;
  w.beginObject(_n);
  if (obj.v != null) { w.writeField('v'); w.writeBytes(obj.v!); }
  w.endObject();
}

final OptSingleBytesCodec = SpecCodec<OptSingleBytes>(
  encode: (w, obj) => _writeOptSingleBytes(w, obj),
  decode: (r) {
    Uint8List? _v;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'v': _v = r.readBytes(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptSingleBytes(v: _v);
  },
);

class PairString {
  final String a;
  final String b;
  PairString({required this.a, required this.b});
}

void _writePairString(SpecWriter w, PairString obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeString(obj.a);
  w.writeField('b'); w.writeString(obj.b);
  w.endObject();
}

final PairStringCodec = SpecCodec<PairString>(
  encode: (w, obj) => _writePairString(w, obj),
  decode: (r) {
    String _a = '';
    String _b = '';
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readString(); break;
        case 'b': _b = r.readString(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return PairString(a: _a, b: _b);
  },
);

class PairBoolean {
  final bool a;
  final bool b;
  PairBoolean({required this.a, required this.b});
}

void _writePairBoolean(SpecWriter w, PairBoolean obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeBool(obj.a);
  w.writeField('b'); w.writeBool(obj.b);
  w.endObject();
}

final PairBooleanCodec = SpecCodec<PairBoolean>(
  encode: (w, obj) => _writePairBoolean(w, obj),
  decode: (r) {
    bool _a = false;
    bool _b = false;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readBool(); break;
        case 'b': _b = r.readBool(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return PairBoolean(a: _a, b: _b);
  },
);

class PairInt8 {
  final int a;
  final int b;
  PairInt8({required this.a, required this.b});
}

void _writePairInt8(SpecWriter w, PairInt8 obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeInt32(obj.a);
  w.writeField('b'); w.writeInt32(obj.b);
  w.endObject();
}

final PairInt8Codec = SpecCodec<PairInt8>(
  encode: (w, obj) => _writePairInt8(w, obj),
  decode: (r) {
    int _a = 0;
    int _b = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readInt32(); break;
        case 'b': _b = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return PairInt8(a: _a, b: _b);
  },
);

class PairInt16 {
  final int a;
  final int b;
  PairInt16({required this.a, required this.b});
}

void _writePairInt16(SpecWriter w, PairInt16 obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeInt32(obj.a);
  w.writeField('b'); w.writeInt32(obj.b);
  w.endObject();
}

final PairInt16Codec = SpecCodec<PairInt16>(
  encode: (w, obj) => _writePairInt16(w, obj),
  decode: (r) {
    int _a = 0;
    int _b = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readInt32(); break;
        case 'b': _b = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return PairInt16(a: _a, b: _b);
  },
);

class PairInt32 {
  final int a;
  final int b;
  PairInt32({required this.a, required this.b});
}

void _writePairInt32(SpecWriter w, PairInt32 obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeInt32(obj.a);
  w.writeField('b'); w.writeInt32(obj.b);
  w.endObject();
}

final PairInt32Codec = SpecCodec<PairInt32>(
  encode: (w, obj) => _writePairInt32(w, obj),
  decode: (r) {
    int _a = 0;
    int _b = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readInt32(); break;
        case 'b': _b = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return PairInt32(a: _a, b: _b);
  },
);

class PairInt64 {
  final BigInt a;
  final BigInt b;
  PairInt64({required this.a, required this.b});
}

void _writePairInt64(SpecWriter w, PairInt64 obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeInt64(obj.a);
  w.writeField('b'); w.writeInt64(obj.b);
  w.endObject();
}

final PairInt64Codec = SpecCodec<PairInt64>(
  encode: (w, obj) => _writePairInt64(w, obj),
  decode: (r) {
    BigInt _a = BigInt.zero;
    BigInt _b = BigInt.zero;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readInt64(); break;
        case 'b': _b = r.readInt64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return PairInt64(a: _a, b: _b);
  },
);

class PairUint8 {
  final int a;
  final int b;
  PairUint8({required this.a, required this.b});
}

void _writePairUint8(SpecWriter w, PairUint8 obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeUint32(obj.a);
  w.writeField('b'); w.writeUint32(obj.b);
  w.endObject();
}

final PairUint8Codec = SpecCodec<PairUint8>(
  encode: (w, obj) => _writePairUint8(w, obj),
  decode: (r) {
    int _a = 0;
    int _b = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readUint32(); break;
        case 'b': _b = r.readUint32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return PairUint8(a: _a, b: _b);
  },
);

class PairUint16 {
  final int a;
  final int b;
  PairUint16({required this.a, required this.b});
}

void _writePairUint16(SpecWriter w, PairUint16 obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeUint32(obj.a);
  w.writeField('b'); w.writeUint32(obj.b);
  w.endObject();
}

final PairUint16Codec = SpecCodec<PairUint16>(
  encode: (w, obj) => _writePairUint16(w, obj),
  decode: (r) {
    int _a = 0;
    int _b = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readUint32(); break;
        case 'b': _b = r.readUint32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return PairUint16(a: _a, b: _b);
  },
);

class PairUint32 {
  final int a;
  final int b;
  PairUint32({required this.a, required this.b});
}

void _writePairUint32(SpecWriter w, PairUint32 obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeUint32(obj.a);
  w.writeField('b'); w.writeUint32(obj.b);
  w.endObject();
}

final PairUint32Codec = SpecCodec<PairUint32>(
  encode: (w, obj) => _writePairUint32(w, obj),
  decode: (r) {
    int _a = 0;
    int _b = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readUint32(); break;
        case 'b': _b = r.readUint32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return PairUint32(a: _a, b: _b);
  },
);

class PairUint64 {
  final BigInt a;
  final BigInt b;
  PairUint64({required this.a, required this.b});
}

void _writePairUint64(SpecWriter w, PairUint64 obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeUint64(obj.a);
  w.writeField('b'); w.writeUint64(obj.b);
  w.endObject();
}

final PairUint64Codec = SpecCodec<PairUint64>(
  encode: (w, obj) => _writePairUint64(w, obj),
  decode: (r) {
    BigInt _a = BigInt.zero;
    BigInt _b = BigInt.zero;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readUint64(); break;
        case 'b': _b = r.readUint64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return PairUint64(a: _a, b: _b);
  },
);

class PairFloat32 {
  final double a;
  final double b;
  PairFloat32({required this.a, required this.b});
}

void _writePairFloat32(SpecWriter w, PairFloat32 obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeFloat32(obj.a);
  w.writeField('b'); w.writeFloat32(obj.b);
  w.endObject();
}

final PairFloat32Codec = SpecCodec<PairFloat32>(
  encode: (w, obj) => _writePairFloat32(w, obj),
  decode: (r) {
    double _a = 0.0;
    double _b = 0.0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readFloat32(); break;
        case 'b': _b = r.readFloat32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return PairFloat32(a: _a, b: _b);
  },
);

class PairFloat64 {
  final double a;
  final double b;
  PairFloat64({required this.a, required this.b});
}

void _writePairFloat64(SpecWriter w, PairFloat64 obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeFloat64(obj.a);
  w.writeField('b'); w.writeFloat64(obj.b);
  w.endObject();
}

final PairFloat64Codec = SpecCodec<PairFloat64>(
  encode: (w, obj) => _writePairFloat64(w, obj),
  decode: (r) {
    double _a = 0.0;
    double _b = 0.0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readFloat64(); break;
        case 'b': _b = r.readFloat64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return PairFloat64(a: _a, b: _b);
  },
);

class PairBytes {
  final Uint8List a;
  final Uint8List b;
  PairBytes({required this.a, required this.b});
}

void _writePairBytes(SpecWriter w, PairBytes obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeBytes(obj.a);
  w.writeField('b'); w.writeBytes(obj.b);
  w.endObject();
}

final PairBytesCodec = SpecCodec<PairBytes>(
  encode: (w, obj) => _writePairBytes(w, obj),
  decode: (r) {
    Uint8List _a = Uint8List(0);
    Uint8List _b = Uint8List(0);
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readBytes(); break;
        case 'b': _b = r.readBytes(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return PairBytes(a: _a, b: _b);
  },
);

class DualStringInt32 {
  final String a;
  final int b;
  DualStringInt32({required this.a, required this.b});
}

void _writeDualStringInt32(SpecWriter w, DualStringInt32 obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeString(obj.a);
  w.writeField('b'); w.writeInt32(obj.b);
  w.endObject();
}

final DualStringInt32Codec = SpecCodec<DualStringInt32>(
  encode: (w, obj) => _writeDualStringInt32(w, obj),
  decode: (r) {
    String _a = '';
    int _b = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readString(); break;
        case 'b': _b = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DualStringInt32(a: _a, b: _b);
  },
);

class DualStringBoolean {
  final String a;
  final bool b;
  DualStringBoolean({required this.a, required this.b});
}

void _writeDualStringBoolean(SpecWriter w, DualStringBoolean obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeString(obj.a);
  w.writeField('b'); w.writeBool(obj.b);
  w.endObject();
}

final DualStringBooleanCodec = SpecCodec<DualStringBoolean>(
  encode: (w, obj) => _writeDualStringBoolean(w, obj),
  decode: (r) {
    String _a = '';
    bool _b = false;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readString(); break;
        case 'b': _b = r.readBool(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DualStringBoolean(a: _a, b: _b);
  },
);

class DualStringFloat64 {
  final String a;
  final double b;
  DualStringFloat64({required this.a, required this.b});
}

void _writeDualStringFloat64(SpecWriter w, DualStringFloat64 obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeString(obj.a);
  w.writeField('b'); w.writeFloat64(obj.b);
  w.endObject();
}

final DualStringFloat64Codec = SpecCodec<DualStringFloat64>(
  encode: (w, obj) => _writeDualStringFloat64(w, obj),
  decode: (r) {
    String _a = '';
    double _b = 0.0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readString(); break;
        case 'b': _b = r.readFloat64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DualStringFloat64(a: _a, b: _b);
  },
);

class DualStringBytes {
  final String a;
  final Uint8List b;
  DualStringBytes({required this.a, required this.b});
}

void _writeDualStringBytes(SpecWriter w, DualStringBytes obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeString(obj.a);
  w.writeField('b'); w.writeBytes(obj.b);
  w.endObject();
}

final DualStringBytesCodec = SpecCodec<DualStringBytes>(
  encode: (w, obj) => _writeDualStringBytes(w, obj),
  decode: (r) {
    String _a = '';
    Uint8List _b = Uint8List(0);
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readString(); break;
        case 'b': _b = r.readBytes(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DualStringBytes(a: _a, b: _b);
  },
);

class DualInt32Boolean {
  final int a;
  final bool b;
  DualInt32Boolean({required this.a, required this.b});
}

void _writeDualInt32Boolean(SpecWriter w, DualInt32Boolean obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeInt32(obj.a);
  w.writeField('b'); w.writeBool(obj.b);
  w.endObject();
}

final DualInt32BooleanCodec = SpecCodec<DualInt32Boolean>(
  encode: (w, obj) => _writeDualInt32Boolean(w, obj),
  decode: (r) {
    int _a = 0;
    bool _b = false;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readInt32(); break;
        case 'b': _b = r.readBool(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DualInt32Boolean(a: _a, b: _b);
  },
);

class DualInt32Float64 {
  final int a;
  final double b;
  DualInt32Float64({required this.a, required this.b});
}

void _writeDualInt32Float64(SpecWriter w, DualInt32Float64 obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeInt32(obj.a);
  w.writeField('b'); w.writeFloat64(obj.b);
  w.endObject();
}

final DualInt32Float64Codec = SpecCodec<DualInt32Float64>(
  encode: (w, obj) => _writeDualInt32Float64(w, obj),
  decode: (r) {
    int _a = 0;
    double _b = 0.0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readInt32(); break;
        case 'b': _b = r.readFloat64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DualInt32Float64(a: _a, b: _b);
  },
);

class DualInt32Int64 {
  final int a;
  final BigInt b;
  DualInt32Int64({required this.a, required this.b});
}

void _writeDualInt32Int64(SpecWriter w, DualInt32Int64 obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeInt32(obj.a);
  w.writeField('b'); w.writeInt64(obj.b);
  w.endObject();
}

final DualInt32Int64Codec = SpecCodec<DualInt32Int64>(
  encode: (w, obj) => _writeDualInt32Int64(w, obj),
  decode: (r) {
    int _a = 0;
    BigInt _b = BigInt.zero;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readInt32(); break;
        case 'b': _b = r.readInt64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DualInt32Int64(a: _a, b: _b);
  },
);

class DualInt32Uint32 {
  final int a;
  final int b;
  DualInt32Uint32({required this.a, required this.b});
}

void _writeDualInt32Uint32(SpecWriter w, DualInt32Uint32 obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeInt32(obj.a);
  w.writeField('b'); w.writeUint32(obj.b);
  w.endObject();
}

final DualInt32Uint32Codec = SpecCodec<DualInt32Uint32>(
  encode: (w, obj) => _writeDualInt32Uint32(w, obj),
  decode: (r) {
    int _a = 0;
    int _b = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readInt32(); break;
        case 'b': _b = r.readUint32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DualInt32Uint32(a: _a, b: _b);
  },
);

class DualInt64Uint64 {
  final BigInt a;
  final BigInt b;
  DualInt64Uint64({required this.a, required this.b});
}

void _writeDualInt64Uint64(SpecWriter w, DualInt64Uint64 obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeInt64(obj.a);
  w.writeField('b'); w.writeUint64(obj.b);
  w.endObject();
}

final DualInt64Uint64Codec = SpecCodec<DualInt64Uint64>(
  encode: (w, obj) => _writeDualInt64Uint64(w, obj),
  decode: (r) {
    BigInt _a = BigInt.zero;
    BigInt _b = BigInt.zero;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readInt64(); break;
        case 'b': _b = r.readUint64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DualInt64Uint64(a: _a, b: _b);
  },
);

class DualFloat32Float64 {
  final double a;
  final double b;
  DualFloat32Float64({required this.a, required this.b});
}

void _writeDualFloat32Float64(SpecWriter w, DualFloat32Float64 obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeFloat32(obj.a);
  w.writeField('b'); w.writeFloat64(obj.b);
  w.endObject();
}

final DualFloat32Float64Codec = SpecCodec<DualFloat32Float64>(
  encode: (w, obj) => _writeDualFloat32Float64(w, obj),
  decode: (r) {
    double _a = 0.0;
    double _b = 0.0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readFloat32(); break;
        case 'b': _b = r.readFloat64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DualFloat32Float64(a: _a, b: _b);
  },
);

class DualFloat64Boolean {
  final double a;
  final bool b;
  DualFloat64Boolean({required this.a, required this.b});
}

void _writeDualFloat64Boolean(SpecWriter w, DualFloat64Boolean obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeFloat64(obj.a);
  w.writeField('b'); w.writeBool(obj.b);
  w.endObject();
}

final DualFloat64BooleanCodec = SpecCodec<DualFloat64Boolean>(
  encode: (w, obj) => _writeDualFloat64Boolean(w, obj),
  decode: (r) {
    double _a = 0.0;
    bool _b = false;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readFloat64(); break;
        case 'b': _b = r.readBool(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DualFloat64Boolean(a: _a, b: _b);
  },
);

class DualFloat64Bytes {
  final double a;
  final Uint8List b;
  DualFloat64Bytes({required this.a, required this.b});
}

void _writeDualFloat64Bytes(SpecWriter w, DualFloat64Bytes obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeFloat64(obj.a);
  w.writeField('b'); w.writeBytes(obj.b);
  w.endObject();
}

final DualFloat64BytesCodec = SpecCodec<DualFloat64Bytes>(
  encode: (w, obj) => _writeDualFloat64Bytes(w, obj),
  decode: (r) {
    double _a = 0.0;
    Uint8List _b = Uint8List(0);
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readFloat64(); break;
        case 'b': _b = r.readBytes(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DualFloat64Bytes(a: _a, b: _b);
  },
);

class DualUint32Uint64 {
  final int a;
  final BigInt b;
  DualUint32Uint64({required this.a, required this.b});
}

void _writeDualUint32Uint64(SpecWriter w, DualUint32Uint64 obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeUint32(obj.a);
  w.writeField('b'); w.writeUint64(obj.b);
  w.endObject();
}

final DualUint32Uint64Codec = SpecCodec<DualUint32Uint64>(
  encode: (w, obj) => _writeDualUint32Uint64(w, obj),
  decode: (r) {
    int _a = 0;
    BigInt _b = BigInt.zero;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readUint32(); break;
        case 'b': _b = r.readUint64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DualUint32Uint64(a: _a, b: _b);
  },
);

class DualBooleanBytes {
  final bool a;
  final Uint8List b;
  DualBooleanBytes({required this.a, required this.b});
}

void _writeDualBooleanBytes(SpecWriter w, DualBooleanBytes obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeBool(obj.a);
  w.writeField('b'); w.writeBytes(obj.b);
  w.endObject();
}

final DualBooleanBytesCodec = SpecCodec<DualBooleanBytes>(
  encode: (w, obj) => _writeDualBooleanBytes(w, obj),
  decode: (r) {
    bool _a = false;
    Uint8List _b = Uint8List(0);
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readBool(); break;
        case 'b': _b = r.readBytes(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DualBooleanBytes(a: _a, b: _b);
  },
);

class DualInt8Uint8 {
  final int a;
  final int b;
  DualInt8Uint8({required this.a, required this.b});
}

void _writeDualInt8Uint8(SpecWriter w, DualInt8Uint8 obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeInt32(obj.a);
  w.writeField('b'); w.writeUint32(obj.b);
  w.endObject();
}

final DualInt8Uint8Codec = SpecCodec<DualInt8Uint8>(
  encode: (w, obj) => _writeDualInt8Uint8(w, obj),
  decode: (r) {
    int _a = 0;
    int _b = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readInt32(); break;
        case 'b': _b = r.readUint32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DualInt8Uint8(a: _a, b: _b);
  },
);

class DualInt16Uint16 {
  final int a;
  final int b;
  DualInt16Uint16({required this.a, required this.b});
}

void _writeDualInt16Uint16(SpecWriter w, DualInt16Uint16 obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeInt32(obj.a);
  w.writeField('b'); w.writeUint32(obj.b);
  w.endObject();
}

final DualInt16Uint16Codec = SpecCodec<DualInt16Uint16>(
  encode: (w, obj) => _writeDualInt16Uint16(w, obj),
  decode: (r) {
    int _a = 0;
    int _b = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readInt32(); break;
        case 'b': _b = r.readUint32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DualInt16Uint16(a: _a, b: _b);
  },
);

class DualStringInt64 {
  final String a;
  final BigInt b;
  DualStringInt64({required this.a, required this.b});
}

void _writeDualStringInt64(SpecWriter w, DualStringInt64 obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeString(obj.a);
  w.writeField('b'); w.writeInt64(obj.b);
  w.endObject();
}

final DualStringInt64Codec = SpecCodec<DualStringInt64>(
  encode: (w, obj) => _writeDualStringInt64(w, obj),
  decode: (r) {
    String _a = '';
    BigInt _b = BigInt.zero;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readString(); break;
        case 'b': _b = r.readInt64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DualStringInt64(a: _a, b: _b);
  },
);

class DualStringUint64 {
  final String a;
  final BigInt b;
  DualStringUint64({required this.a, required this.b});
}

void _writeDualStringUint64(SpecWriter w, DualStringUint64 obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeString(obj.a);
  w.writeField('b'); w.writeUint64(obj.b);
  w.endObject();
}

final DualStringUint64Codec = SpecCodec<DualStringUint64>(
  encode: (w, obj) => _writeDualStringUint64(w, obj),
  decode: (r) {
    String _a = '';
    BigInt _b = BigInt.zero;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readString(); break;
        case 'b': _b = r.readUint64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DualStringUint64(a: _a, b: _b);
  },
);

class DualInt32Bytes {
  final int a;
  final Uint8List b;
  DualInt32Bytes({required this.a, required this.b});
}

void _writeDualInt32Bytes(SpecWriter w, DualInt32Bytes obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeInt32(obj.a);
  w.writeField('b'); w.writeBytes(obj.b);
  w.endObject();
}

final DualInt32BytesCodec = SpecCodec<DualInt32Bytes>(
  encode: (w, obj) => _writeDualInt32Bytes(w, obj),
  decode: (r) {
    int _a = 0;
    Uint8List _b = Uint8List(0);
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readInt32(); break;
        case 'b': _b = r.readBytes(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DualInt32Bytes(a: _a, b: _b);
  },
);

class DualFloat64Int32 {
  final double a;
  final int b;
  DualFloat64Int32({required this.a, required this.b});
}

void _writeDualFloat64Int32(SpecWriter w, DualFloat64Int32 obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeFloat64(obj.a);
  w.writeField('b'); w.writeInt32(obj.b);
  w.endObject();
}

final DualFloat64Int32Codec = SpecCodec<DualFloat64Int32>(
  encode: (w, obj) => _writeDualFloat64Int32(w, obj),
  decode: (r) {
    double _a = 0.0;
    int _b = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readFloat64(); break;
        case 'b': _b = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DualFloat64Int32(a: _a, b: _b);
  },
);

class DualBooleanInt32 {
  final bool a;
  final int b;
  DualBooleanInt32({required this.a, required this.b});
}

void _writeDualBooleanInt32(SpecWriter w, DualBooleanInt32 obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeBool(obj.a);
  w.writeField('b'); w.writeInt32(obj.b);
  w.endObject();
}

final DualBooleanInt32Codec = SpecCodec<DualBooleanInt32>(
  encode: (w, obj) => _writeDualBooleanInt32(w, obj),
  decode: (r) {
    bool _a = false;
    int _b = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readBool(); break;
        case 'b': _b = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DualBooleanInt32(a: _a, b: _b);
  },
);

class DualBytesInt64 {
  final Uint8List a;
  final BigInt b;
  DualBytesInt64({required this.a, required this.b});
}

void _writeDualBytesInt64(SpecWriter w, DualBytesInt64 obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeBytes(obj.a);
  w.writeField('b'); w.writeInt64(obj.b);
  w.endObject();
}

final DualBytesInt64Codec = SpecCodec<DualBytesInt64>(
  encode: (w, obj) => _writeDualBytesInt64(w, obj),
  decode: (r) {
    Uint8List _a = Uint8List(0);
    BigInt _b = BigInt.zero;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readBytes(); break;
        case 'b': _b = r.readInt64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DualBytesInt64(a: _a, b: _b);
  },
);

class DualInt8Float32 {
  final int a;
  final double b;
  DualInt8Float32({required this.a, required this.b});
}

void _writeDualInt8Float32(SpecWriter w, DualInt8Float32 obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeInt32(obj.a);
  w.writeField('b'); w.writeFloat32(obj.b);
  w.endObject();
}

final DualInt8Float32Codec = SpecCodec<DualInt8Float32>(
  encode: (w, obj) => _writeDualInt8Float32(w, obj),
  decode: (r) {
    int _a = 0;
    double _b = 0.0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readInt32(); break;
        case 'b': _b = r.readFloat32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DualInt8Float32(a: _a, b: _b);
  },
);

class DualUint8Int16 {
  final int a;
  final int b;
  DualUint8Int16({required this.a, required this.b});
}

void _writeDualUint8Int16(SpecWriter w, DualUint8Int16 obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeUint32(obj.a);
  w.writeField('b'); w.writeInt32(obj.b);
  w.endObject();
}

final DualUint8Int16Codec = SpecCodec<DualUint8Int16>(
  encode: (w, obj) => _writeDualUint8Int16(w, obj),
  decode: (r) {
    int _a = 0;
    int _b = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readUint32(); break;
        case 'b': _b = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DualUint8Int16(a: _a, b: _b);
  },
);

class DualInt64Float64 {
  final BigInt a;
  final double b;
  DualInt64Float64({required this.a, required this.b});
}

void _writeDualInt64Float64(SpecWriter w, DualInt64Float64 obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeInt64(obj.a);
  w.writeField('b'); w.writeFloat64(obj.b);
  w.endObject();
}

final DualInt64Float64Codec = SpecCodec<DualInt64Float64>(
  encode: (w, obj) => _writeDualInt64Float64(w, obj),
  decode: (r) {
    BigInt _a = BigInt.zero;
    double _b = 0.0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readInt64(); break;
        case 'b': _b = r.readFloat64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DualInt64Float64(a: _a, b: _b);
  },
);

class DualUint64String {
  final BigInt a;
  final String b;
  DualUint64String({required this.a, required this.b});
}

void _writeDualUint64String(SpecWriter w, DualUint64String obj) {
  w.beginObject(2);
  w.writeField('a'); w.writeUint64(obj.a);
  w.writeField('b'); w.writeString(obj.b);
  w.endObject();
}

final DualUint64StringCodec = SpecCodec<DualUint64String>(
  encode: (w, obj) => _writeDualUint64String(w, obj),
  decode: (r) {
    BigInt _a = BigInt.zero;
    String _b = '';
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readUint64(); break;
        case 'b': _b = r.readString(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DualUint64String(a: _a, b: _b);
  },
);

class Triple01 {
  final String a;
  final int b;
  final bool c;
  Triple01({required this.a, required this.b, required this.c});
}

void _writeTriple01(SpecWriter w, Triple01 obj) {
  w.beginObject(3);
  w.writeField('a'); w.writeString(obj.a);
  w.writeField('b'); w.writeInt32(obj.b);
  w.writeField('c'); w.writeBool(obj.c);
  w.endObject();
}

final Triple01Codec = SpecCodec<Triple01>(
  encode: (w, obj) => _writeTriple01(w, obj),
  decode: (r) {
    String _a = '';
    int _b = 0;
    bool _c = false;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readString(); break;
        case 'b': _b = r.readInt32(); break;
        case 'c': _c = r.readBool(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Triple01(a: _a, b: _b, c: _c);
  },
);

class Triple02 {
  final double a;
  final double b;
  final double c;
  Triple02({required this.a, required this.b, required this.c});
}

void _writeTriple02(SpecWriter w, Triple02 obj) {
  w.beginObject(3);
  w.writeField('a'); w.writeFloat64(obj.a);
  w.writeField('b'); w.writeFloat64(obj.b);
  w.writeField('c'); w.writeFloat64(obj.c);
  w.endObject();
}

final Triple02Codec = SpecCodec<Triple02>(
  encode: (w, obj) => _writeTriple02(w, obj),
  decode: (r) {
    double _a = 0.0;
    double _b = 0.0;
    double _c = 0.0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readFloat64(); break;
        case 'b': _b = r.readFloat64(); break;
        case 'c': _c = r.readFloat64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Triple02(a: _a, b: _b, c: _c);
  },
);

class Triple03 {
  final int a;
  final int b;
  final int c;
  Triple03({required this.a, required this.b, required this.c});
}

void _writeTriple03(SpecWriter w, Triple03 obj) {
  w.beginObject(3);
  w.writeField('a'); w.writeInt32(obj.a);
  w.writeField('b'); w.writeInt32(obj.b);
  w.writeField('c'); w.writeInt32(obj.c);
  w.endObject();
}

final Triple03Codec = SpecCodec<Triple03>(
  encode: (w, obj) => _writeTriple03(w, obj),
  decode: (r) {
    int _a = 0;
    int _b = 0;
    int _c = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readInt32(); break;
        case 'b': _b = r.readInt32(); break;
        case 'c': _c = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Triple03(a: _a, b: _b, c: _c);
  },
);

class Triple04 {
  final String a;
  final String b;
  final int c;
  Triple04({required this.a, required this.b, required this.c});
}

void _writeTriple04(SpecWriter w, Triple04 obj) {
  w.beginObject(3);
  w.writeField('a'); w.writeString(obj.a);
  w.writeField('b'); w.writeString(obj.b);
  w.writeField('c'); w.writeInt32(obj.c);
  w.endObject();
}

final Triple04Codec = SpecCodec<Triple04>(
  encode: (w, obj) => _writeTriple04(w, obj),
  decode: (r) {
    String _a = '';
    String _b = '';
    int _c = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readString(); break;
        case 'b': _b = r.readString(); break;
        case 'c': _c = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Triple04(a: _a, b: _b, c: _c);
  },
);

class Triple05 {
  final BigInt a;
  final String b;
  final bool c;
  Triple05({required this.a, required this.b, required this.c});
}

void _writeTriple05(SpecWriter w, Triple05 obj) {
  w.beginObject(3);
  w.writeField('a'); w.writeInt64(obj.a);
  w.writeField('b'); w.writeString(obj.b);
  w.writeField('c'); w.writeBool(obj.c);
  w.endObject();
}

final Triple05Codec = SpecCodec<Triple05>(
  encode: (w, obj) => _writeTriple05(w, obj),
  decode: (r) {
    BigInt _a = BigInt.zero;
    String _b = '';
    bool _c = false;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readInt64(); break;
        case 'b': _b = r.readString(); break;
        case 'c': _c = r.readBool(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Triple05(a: _a, b: _b, c: _c);
  },
);

class Triple06 {
  final int a;
  final BigInt b;
  final String c;
  Triple06({required this.a, required this.b, required this.c});
}

void _writeTriple06(SpecWriter w, Triple06 obj) {
  w.beginObject(3);
  w.writeField('a'); w.writeUint32(obj.a);
  w.writeField('b'); w.writeUint64(obj.b);
  w.writeField('c'); w.writeString(obj.c);
  w.endObject();
}

final Triple06Codec = SpecCodec<Triple06>(
  encode: (w, obj) => _writeTriple06(w, obj),
  decode: (r) {
    int _a = 0;
    BigInt _b = BigInt.zero;
    String _c = '';
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readUint32(); break;
        case 'b': _b = r.readUint64(); break;
        case 'c': _c = r.readString(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Triple06(a: _a, b: _b, c: _c);
  },
);

class Triple07 {
  final Uint8List a;
  final String b;
  final int c;
  Triple07({required this.a, required this.b, required this.c});
}

void _writeTriple07(SpecWriter w, Triple07 obj) {
  w.beginObject(3);
  w.writeField('a'); w.writeBytes(obj.a);
  w.writeField('b'); w.writeString(obj.b);
  w.writeField('c'); w.writeInt32(obj.c);
  w.endObject();
}

final Triple07Codec = SpecCodec<Triple07>(
  encode: (w, obj) => _writeTriple07(w, obj),
  decode: (r) {
    Uint8List _a = Uint8List(0);
    String _b = '';
    int _c = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readBytes(); break;
        case 'b': _b = r.readString(); break;
        case 'c': _c = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Triple07(a: _a, b: _b, c: _c);
  },
);

class Triple08 {
  final double a;
  final int b;
  final bool c;
  Triple08({required this.a, required this.b, required this.c});
}

void _writeTriple08(SpecWriter w, Triple08 obj) {
  w.beginObject(3);
  w.writeField('a'); w.writeFloat32(obj.a);
  w.writeField('b'); w.writeInt32(obj.b);
  w.writeField('c'); w.writeBool(obj.c);
  w.endObject();
}

final Triple08Codec = SpecCodec<Triple08>(
  encode: (w, obj) => _writeTriple08(w, obj),
  decode: (r) {
    double _a = 0.0;
    int _b = 0;
    bool _c = false;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readFloat32(); break;
        case 'b': _b = r.readInt32(); break;
        case 'c': _c = r.readBool(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Triple08(a: _a, b: _b, c: _c);
  },
);

class Triple09 {
  final String a;
  final BigInt b;
  final double c;
  Triple09({required this.a, required this.b, required this.c});
}

void _writeTriple09(SpecWriter w, Triple09 obj) {
  w.beginObject(3);
  w.writeField('a'); w.writeString(obj.a);
  w.writeField('b'); w.writeInt64(obj.b);
  w.writeField('c'); w.writeFloat64(obj.c);
  w.endObject();
}

final Triple09Codec = SpecCodec<Triple09>(
  encode: (w, obj) => _writeTriple09(w, obj),
  decode: (r) {
    String _a = '';
    BigInt _b = BigInt.zero;
    double _c = 0.0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readString(); break;
        case 'b': _b = r.readInt64(); break;
        case 'c': _c = r.readFloat64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Triple09(a: _a, b: _b, c: _c);
  },
);

class Triple10 {
  final bool a;
  final bool b;
  final bool c;
  Triple10({required this.a, required this.b, required this.c});
}

void _writeTriple10(SpecWriter w, Triple10 obj) {
  w.beginObject(3);
  w.writeField('a'); w.writeBool(obj.a);
  w.writeField('b'); w.writeBool(obj.b);
  w.writeField('c'); w.writeBool(obj.c);
  w.endObject();
}

final Triple10Codec = SpecCodec<Triple10>(
  encode: (w, obj) => _writeTriple10(w, obj),
  decode: (r) {
    bool _a = false;
    bool _b = false;
    bool _c = false;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readBool(); break;
        case 'b': _b = r.readBool(); break;
        case 'c': _c = r.readBool(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Triple10(a: _a, b: _b, c: _c);
  },
);

class Triple11 {
  final int a;
  final int b;
  final int c;
  Triple11({required this.a, required this.b, required this.c});
}

void _writeTriple11(SpecWriter w, Triple11 obj) {
  w.beginObject(3);
  w.writeField('a'); w.writeInt32(obj.a);
  w.writeField('b'); w.writeInt32(obj.b);
  w.writeField('c'); w.writeInt32(obj.c);
  w.endObject();
}

final Triple11Codec = SpecCodec<Triple11>(
  encode: (w, obj) => _writeTriple11(w, obj),
  decode: (r) {
    int _a = 0;
    int _b = 0;
    int _c = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readInt32(); break;
        case 'b': _b = r.readInt32(); break;
        case 'c': _c = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Triple11(a: _a, b: _b, c: _c);
  },
);

class Triple12 {
  final int a;
  final int b;
  final int c;
  Triple12({required this.a, required this.b, required this.c});
}

void _writeTriple12(SpecWriter w, Triple12 obj) {
  w.beginObject(3);
  w.writeField('a'); w.writeUint32(obj.a);
  w.writeField('b'); w.writeUint32(obj.b);
  w.writeField('c'); w.writeUint32(obj.c);
  w.endObject();
}

final Triple12Codec = SpecCodec<Triple12>(
  encode: (w, obj) => _writeTriple12(w, obj),
  decode: (r) {
    int _a = 0;
    int _b = 0;
    int _c = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readUint32(); break;
        case 'b': _b = r.readUint32(); break;
        case 'c': _c = r.readUint32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Triple12(a: _a, b: _b, c: _c);
  },
);

class Triple13 {
  final String a;
  final Uint8List b;
  final double c;
  Triple13({required this.a, required this.b, required this.c});
}

void _writeTriple13(SpecWriter w, Triple13 obj) {
  w.beginObject(3);
  w.writeField('a'); w.writeString(obj.a);
  w.writeField('b'); w.writeBytes(obj.b);
  w.writeField('c'); w.writeFloat64(obj.c);
  w.endObject();
}

final Triple13Codec = SpecCodec<Triple13>(
  encode: (w, obj) => _writeTriple13(w, obj),
  decode: (r) {
    String _a = '';
    Uint8List _b = Uint8List(0);
    double _c = 0.0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readString(); break;
        case 'b': _b = r.readBytes(); break;
        case 'c': _c = r.readFloat64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Triple13(a: _a, b: _b, c: _c);
  },
);

class Triple14 {
  final BigInt a;
  final BigInt b;
  final bool c;
  Triple14({required this.a, required this.b, required this.c});
}

void _writeTriple14(SpecWriter w, Triple14 obj) {
  w.beginObject(3);
  w.writeField('a'); w.writeInt64(obj.a);
  w.writeField('b'); w.writeUint64(obj.b);
  w.writeField('c'); w.writeBool(obj.c);
  w.endObject();
}

final Triple14Codec = SpecCodec<Triple14>(
  encode: (w, obj) => _writeTriple14(w, obj),
  decode: (r) {
    BigInt _a = BigInt.zero;
    BigInt _b = BigInt.zero;
    bool _c = false;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readInt64(); break;
        case 'b': _b = r.readUint64(); break;
        case 'c': _c = r.readBool(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Triple14(a: _a, b: _b, c: _c);
  },
);

class Triple15 {
  final double a;
  final String b;
  final Uint8List c;
  Triple15({required this.a, required this.b, required this.c});
}

void _writeTriple15(SpecWriter w, Triple15 obj) {
  w.beginObject(3);
  w.writeField('a'); w.writeFloat64(obj.a);
  w.writeField('b'); w.writeString(obj.b);
  w.writeField('c'); w.writeBytes(obj.c);
  w.endObject();
}

final Triple15Codec = SpecCodec<Triple15>(
  encode: (w, obj) => _writeTriple15(w, obj),
  decode: (r) {
    double _a = 0.0;
    String _b = '';
    Uint8List _c = Uint8List(0);
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readFloat64(); break;
        case 'b': _b = r.readString(); break;
        case 'c': _c = r.readBytes(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Triple15(a: _a, b: _b, c: _c);
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

void _writeFive01(SpecWriter w, Five01 obj) {
  w.beginObject(5);
  w.writeField('f1'); w.writeString(obj.f1);
  w.writeField('f2'); w.writeInt32(obj.f2);
  w.writeField('f3'); w.writeBool(obj.f3);
  w.writeField('f4'); w.writeFloat64(obj.f4);
  w.writeField('f5'); w.writeBytes(obj.f5);
  w.endObject();
}

final Five01Codec = SpecCodec<Five01>(
  encode: (w, obj) => _writeFive01(w, obj),
  decode: (r) {
    String _f1 = '';
    int _f2 = 0;
    bool _f3 = false;
    double _f4 = 0.0;
    Uint8List _f5 = Uint8List(0);
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'f1': _f1 = r.readString(); break;
        case 'f2': _f2 = r.readInt32(); break;
        case 'f3': _f3 = r.readBool(); break;
        case 'f4': _f4 = r.readFloat64(); break;
        case 'f5': _f5 = r.readBytes(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Five01(f1: _f1, f2: _f2, f3: _f3, f4: _f4, f5: _f5);
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

void _writeFive02(SpecWriter w, Five02 obj) {
  w.beginObject(5);
  w.writeField('f1'); w.writeInt32(obj.f1);
  w.writeField('f2'); w.writeInt32(obj.f2);
  w.writeField('f3'); w.writeInt32(obj.f3);
  w.writeField('f4'); w.writeInt32(obj.f4);
  w.writeField('f5'); w.writeInt32(obj.f5);
  w.endObject();
}

final Five02Codec = SpecCodec<Five02>(
  encode: (w, obj) => _writeFive02(w, obj),
  decode: (r) {
    int _f1 = 0;
    int _f2 = 0;
    int _f3 = 0;
    int _f4 = 0;
    int _f5 = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'f1': _f1 = r.readInt32(); break;
        case 'f2': _f2 = r.readInt32(); break;
        case 'f3': _f3 = r.readInt32(); break;
        case 'f4': _f4 = r.readInt32(); break;
        case 'f5': _f5 = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Five02(f1: _f1, f2: _f2, f3: _f3, f4: _f4, f5: _f5);
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

void _writeFive03(SpecWriter w, Five03 obj) {
  w.beginObject(5);
  w.writeField('f1'); w.writeString(obj.f1);
  w.writeField('f2'); w.writeString(obj.f2);
  w.writeField('f3'); w.writeString(obj.f3);
  w.writeField('f4'); w.writeString(obj.f4);
  w.writeField('f5'); w.writeString(obj.f5);
  w.endObject();
}

final Five03Codec = SpecCodec<Five03>(
  encode: (w, obj) => _writeFive03(w, obj),
  decode: (r) {
    String _f1 = '';
    String _f2 = '';
    String _f3 = '';
    String _f4 = '';
    String _f5 = '';
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'f1': _f1 = r.readString(); break;
        case 'f2': _f2 = r.readString(); break;
        case 'f3': _f3 = r.readString(); break;
        case 'f4': _f4 = r.readString(); break;
        case 'f5': _f5 = r.readString(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Five03(f1: _f1, f2: _f2, f3: _f3, f4: _f4, f5: _f5);
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

void _writeFive04(SpecWriter w, Five04 obj) {
  w.beginObject(5);
  w.writeField('f1'); w.writeFloat64(obj.f1);
  w.writeField('f2'); w.writeInt32(obj.f2);
  w.writeField('f3'); w.writeString(obj.f3);
  w.writeField('f4'); w.writeBool(obj.f4);
  w.writeField('f5'); w.writeBytes(obj.f5);
  w.endObject();
}

final Five04Codec = SpecCodec<Five04>(
  encode: (w, obj) => _writeFive04(w, obj),
  decode: (r) {
    double _f1 = 0.0;
    int _f2 = 0;
    String _f3 = '';
    bool _f4 = false;
    Uint8List _f5 = Uint8List(0);
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'f1': _f1 = r.readFloat64(); break;
        case 'f2': _f2 = r.readInt32(); break;
        case 'f3': _f3 = r.readString(); break;
        case 'f4': _f4 = r.readBool(); break;
        case 'f5': _f5 = r.readBytes(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Five04(f1: _f1, f2: _f2, f3: _f3, f4: _f4, f5: _f5);
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

void _writeFive05(SpecWriter w, Five05 obj) {
  w.beginObject(5);
  w.writeField('f1'); w.writeInt64(obj.f1);
  w.writeField('f2'); w.writeUint64(obj.f2);
  w.writeField('f3'); w.writeString(obj.f3);
  w.writeField('f4'); w.writeFloat32(obj.f4);
  w.writeField('f5'); w.writeInt32(obj.f5);
  w.endObject();
}

final Five05Codec = SpecCodec<Five05>(
  encode: (w, obj) => _writeFive05(w, obj),
  decode: (r) {
    BigInt _f1 = BigInt.zero;
    BigInt _f2 = BigInt.zero;
    String _f3 = '';
    double _f4 = 0.0;
    int _f5 = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'f1': _f1 = r.readInt64(); break;
        case 'f2': _f2 = r.readUint64(); break;
        case 'f3': _f3 = r.readString(); break;
        case 'f4': _f4 = r.readFloat32(); break;
        case 'f5': _f5 = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Five05(f1: _f1, f2: _f2, f3: _f3, f4: _f4, f5: _f5);
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

void _writeFive06(SpecWriter w, Five06 obj) {
  w.beginObject(5);
  w.writeField('f1'); w.writeBool(obj.f1);
  w.writeField('f2'); w.writeString(obj.f2);
  w.writeField('f3'); w.writeInt32(obj.f3);
  w.writeField('f4'); w.writeFloat64(obj.f4);
  w.writeField('f5'); w.writeUint32(obj.f5);
  w.endObject();
}

final Five06Codec = SpecCodec<Five06>(
  encode: (w, obj) => _writeFive06(w, obj),
  decode: (r) {
    bool _f1 = false;
    String _f2 = '';
    int _f3 = 0;
    double _f4 = 0.0;
    int _f5 = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'f1': _f1 = r.readBool(); break;
        case 'f2': _f2 = r.readString(); break;
        case 'f3': _f3 = r.readInt32(); break;
        case 'f4': _f4 = r.readFloat64(); break;
        case 'f5': _f5 = r.readUint32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Five06(f1: _f1, f2: _f2, f3: _f3, f4: _f4, f5: _f5);
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

void _writeFive07(SpecWriter w, Five07 obj) {
  w.beginObject(5);
  w.writeField('f1'); w.writeBytes(obj.f1);
  w.writeField('f2'); w.writeBytes(obj.f2);
  w.writeField('f3'); w.writeString(obj.f3);
  w.writeField('f4'); w.writeInt32(obj.f4);
  w.writeField('f5'); w.writeFloat64(obj.f5);
  w.endObject();
}

final Five07Codec = SpecCodec<Five07>(
  encode: (w, obj) => _writeFive07(w, obj),
  decode: (r) {
    Uint8List _f1 = Uint8List(0);
    Uint8List _f2 = Uint8List(0);
    String _f3 = '';
    int _f4 = 0;
    double _f5 = 0.0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'f1': _f1 = r.readBytes(); break;
        case 'f2': _f2 = r.readBytes(); break;
        case 'f3': _f3 = r.readString(); break;
        case 'f4': _f4 = r.readInt32(); break;
        case 'f5': _f5 = r.readFloat64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Five07(f1: _f1, f2: _f2, f3: _f3, f4: _f4, f5: _f5);
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

void _writeFive08(SpecWriter w, Five08 obj) {
  w.beginObject(5);
  w.writeField('f1'); w.writeUint32(obj.f1);
  w.writeField('f2'); w.writeUint32(obj.f2);
  w.writeField('f3'); w.writeUint32(obj.f3);
  w.writeField('f4'); w.writeInt32(obj.f4);
  w.writeField('f5'); w.writeInt32(obj.f5);
  w.endObject();
}

final Five08Codec = SpecCodec<Five08>(
  encode: (w, obj) => _writeFive08(w, obj),
  decode: (r) {
    int _f1 = 0;
    int _f2 = 0;
    int _f3 = 0;
    int _f4 = 0;
    int _f5 = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'f1': _f1 = r.readUint32(); break;
        case 'f2': _f2 = r.readUint32(); break;
        case 'f3': _f3 = r.readUint32(); break;
        case 'f4': _f4 = r.readInt32(); break;
        case 'f5': _f5 = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Five08(f1: _f1, f2: _f2, f3: _f3, f4: _f4, f5: _f5);
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

void _writeFive09(SpecWriter w, Five09 obj) {
  w.beginObject(5);
  w.writeField('f1'); w.writeFloat32(obj.f1);
  w.writeField('f2'); w.writeFloat64(obj.f2);
  w.writeField('f3'); w.writeInt32(obj.f3);
  w.writeField('f4'); w.writeInt64(obj.f4);
  w.writeField('f5'); w.writeString(obj.f5);
  w.endObject();
}

final Five09Codec = SpecCodec<Five09>(
  encode: (w, obj) => _writeFive09(w, obj),
  decode: (r) {
    double _f1 = 0.0;
    double _f2 = 0.0;
    int _f3 = 0;
    BigInt _f4 = BigInt.zero;
    String _f5 = '';
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'f1': _f1 = r.readFloat32(); break;
        case 'f2': _f2 = r.readFloat64(); break;
        case 'f3': _f3 = r.readInt32(); break;
        case 'f4': _f4 = r.readInt64(); break;
        case 'f5': _f5 = r.readString(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Five09(f1: _f1, f2: _f2, f3: _f3, f4: _f4, f5: _f5);
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

void _writeFive10(SpecWriter w, Five10 obj) {
  w.beginObject(5);
  w.writeField('f1'); w.writeString(obj.f1);
  w.writeField('f2'); w.writeBool(obj.f2);
  w.writeField('f3'); w.writeInt64(obj.f3);
  w.writeField('f4'); w.writeUint64(obj.f4);
  w.writeField('f5'); w.writeFloat64(obj.f5);
  w.endObject();
}

final Five10Codec = SpecCodec<Five10>(
  encode: (w, obj) => _writeFive10(w, obj),
  decode: (r) {
    String _f1 = '';
    bool _f2 = false;
    BigInt _f3 = BigInt.zero;
    BigInt _f4 = BigInt.zero;
    double _f5 = 0.0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'f1': _f1 = r.readString(); break;
        case 'f2': _f2 = r.readBool(); break;
        case 'f3': _f3 = r.readInt64(); break;
        case 'f4': _f4 = r.readUint64(); break;
        case 'f5': _f5 = r.readFloat64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Five10(f1: _f1, f2: _f2, f3: _f3, f4: _f4, f5: _f5);
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

void _writeTen01(SpecWriter w, Ten01 obj) {
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

final Ten01Codec = SpecCodec<Ten01>(
  encode: (w, obj) => _writeTen01(w, obj),
  decode: (r) {
    String _f1 = '';
    bool _f2 = false;
    int _f3 = 0;
    int _f4 = 0;
    int _f5 = 0;
    BigInt _f6 = BigInt.zero;
    int _f7 = 0;
    int _f8 = 0;
    int _f9 = 0;
    BigInt _f10 = BigInt.zero;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'f1': _f1 = r.readString(); break;
        case 'f2': _f2 = r.readBool(); break;
        case 'f3': _f3 = r.readInt32(); break;
        case 'f4': _f4 = r.readInt32(); break;
        case 'f5': _f5 = r.readInt32(); break;
        case 'f6': _f6 = r.readInt64(); break;
        case 'f7': _f7 = r.readUint32(); break;
        case 'f8': _f8 = r.readUint32(); break;
        case 'f9': _f9 = r.readUint32(); break;
        case 'f10': _f10 = r.readUint64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Ten01(f1: _f1, f2: _f2, f3: _f3, f4: _f4, f5: _f5, f6: _f6, f7: _f7, f8: _f8, f9: _f9, f10: _f10);
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

void _writeTen02(SpecWriter w, Ten02 obj) {
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

final Ten02Codec = SpecCodec<Ten02>(
  encode: (w, obj) => _writeTen02(w, obj),
  decode: (r) {
    int _f1 = 0;
    int _f2 = 0;
    BigInt _f3 = BigInt.zero;
    int _f4 = 0;
    int _f5 = 0;
    int _f6 = 0;
    BigInt _f7 = BigInt.zero;
    double _f8 = 0.0;
    double _f9 = 0.0;
    Uint8List _f10 = Uint8List(0);
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'f1': _f1 = r.readInt32(); break;
        case 'f2': _f2 = r.readInt32(); break;
        case 'f3': _f3 = r.readInt64(); break;
        case 'f4': _f4 = r.readUint32(); break;
        case 'f5': _f5 = r.readUint32(); break;
        case 'f6': _f6 = r.readUint32(); break;
        case 'f7': _f7 = r.readUint64(); break;
        case 'f8': _f8 = r.readFloat32(); break;
        case 'f9': _f9 = r.readFloat64(); break;
        case 'f10': _f10 = r.readBytes(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Ten02(f1: _f1, f2: _f2, f3: _f3, f4: _f4, f5: _f5, f6: _f6, f7: _f7, f8: _f8, f9: _f9, f10: _f10);
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

void _writeTen03(SpecWriter w, Ten03 obj) {
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

final Ten03Codec = SpecCodec<Ten03>(
  encode: (w, obj) => _writeTen03(w, obj),
  decode: (r) {
    int _f1 = 0;
    int _f2 = 0;
    int _f3 = 0;
    BigInt _f4 = BigInt.zero;
    double _f5 = 0.0;
    double _f6 = 0.0;
    Uint8List _f7 = Uint8List(0);
    String _f8 = '';
    bool _f9 = false;
    int _f10 = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'f1': _f1 = r.readUint32(); break;
        case 'f2': _f2 = r.readUint32(); break;
        case 'f3': _f3 = r.readUint32(); break;
        case 'f4': _f4 = r.readUint64(); break;
        case 'f5': _f5 = r.readFloat32(); break;
        case 'f6': _f6 = r.readFloat64(); break;
        case 'f7': _f7 = r.readBytes(); break;
        case 'f8': _f8 = r.readString(); break;
        case 'f9': _f9 = r.readBool(); break;
        case 'f10': _f10 = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Ten03(f1: _f1, f2: _f2, f3: _f3, f4: _f4, f5: _f5, f6: _f6, f7: _f7, f8: _f8, f9: _f9, f10: _f10);
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

void _writeTen04(SpecWriter w, Ten04 obj) {
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

final Ten04Codec = SpecCodec<Ten04>(
  encode: (w, obj) => _writeTen04(w, obj),
  decode: (r) {
    BigInt _f1 = BigInt.zero;
    double _f2 = 0.0;
    double _f3 = 0.0;
    Uint8List _f4 = Uint8List(0);
    String _f5 = '';
    bool _f6 = false;
    int _f7 = 0;
    int _f8 = 0;
    int _f9 = 0;
    BigInt _f10 = BigInt.zero;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'f1': _f1 = r.readUint64(); break;
        case 'f2': _f2 = r.readFloat32(); break;
        case 'f3': _f3 = r.readFloat64(); break;
        case 'f4': _f4 = r.readBytes(); break;
        case 'f5': _f5 = r.readString(); break;
        case 'f6': _f6 = r.readBool(); break;
        case 'f7': _f7 = r.readInt32(); break;
        case 'f8': _f8 = r.readInt32(); break;
        case 'f9': _f9 = r.readInt32(); break;
        case 'f10': _f10 = r.readInt64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Ten04(f1: _f1, f2: _f2, f3: _f3, f4: _f4, f5: _f5, f6: _f6, f7: _f7, f8: _f8, f9: _f9, f10: _f10);
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

void _writeTen05(SpecWriter w, Ten05 obj) {
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

final Ten05Codec = SpecCodec<Ten05>(
  encode: (w, obj) => _writeTen05(w, obj),
  decode: (r) {
    Uint8List _f1 = Uint8List(0);
    String _f2 = '';
    bool _f3 = false;
    int _f4 = 0;
    int _f5 = 0;
    int _f6 = 0;
    BigInt _f7 = BigInt.zero;
    int _f8 = 0;
    int _f9 = 0;
    int _f10 = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'f1': _f1 = r.readBytes(); break;
        case 'f2': _f2 = r.readString(); break;
        case 'f3': _f3 = r.readBool(); break;
        case 'f4': _f4 = r.readInt32(); break;
        case 'f5': _f5 = r.readInt32(); break;
        case 'f6': _f6 = r.readInt32(); break;
        case 'f7': _f7 = r.readInt64(); break;
        case 'f8': _f8 = r.readUint32(); break;
        case 'f9': _f9 = r.readUint32(); break;
        case 'f10': _f10 = r.readUint32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Ten05(f1: _f1, f2: _f2, f3: _f3, f4: _f4, f5: _f5, f6: _f6, f7: _f7, f8: _f8, f9: _f9, f10: _f10);
  },
);

class ArrString {
  final List<String> items;
  ArrString({required this.items});
}

void _writeArrString(SpecWriter w, ArrString obj) {
  w.beginObject(1);
  w.writeField('items'); w.beginArray(obj.items.length); for (final _e in obj.items) { w.nextElement(); w.writeString(_e); } w.endArray();
  w.endObject();
}

final ArrStringCodec = SpecCodec<ArrString>(
  encode: (w, obj) => _writeArrString(w, obj),
  decode: (r) {
    List<String> _items = [];
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'items': _items = () { final _list = <String>[]; r.beginArray(); while (r.hasNextElement()) { _list.add(r.readString()); } r.endArray(); return _list; }(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return ArrString(items: _items);
  },
);

class ArrInt32 {
  final List<int> items;
  ArrInt32({required this.items});
}

void _writeArrInt32(SpecWriter w, ArrInt32 obj) {
  w.beginObject(1);
  w.writeField('items'); w.beginArray(obj.items.length); for (final _e in obj.items) { w.nextElement(); w.writeInt32(_e); } w.endArray();
  w.endObject();
}

final ArrInt32Codec = SpecCodec<ArrInt32>(
  encode: (w, obj) => _writeArrInt32(w, obj),
  decode: (r) {
    List<int> _items = [];
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'items': _items = () { final _list = <int>[]; r.beginArray(); while (r.hasNextElement()) { _list.add(r.readInt32()); } r.endArray(); return _list; }(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return ArrInt32(items: _items);
  },
);

class ArrBoolean {
  final List<bool> items;
  ArrBoolean({required this.items});
}

void _writeArrBoolean(SpecWriter w, ArrBoolean obj) {
  w.beginObject(1);
  w.writeField('items'); w.beginArray(obj.items.length); for (final _e in obj.items) { w.nextElement(); w.writeBool(_e); } w.endArray();
  w.endObject();
}

final ArrBooleanCodec = SpecCodec<ArrBoolean>(
  encode: (w, obj) => _writeArrBoolean(w, obj),
  decode: (r) {
    List<bool> _items = [];
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'items': _items = () { final _list = <bool>[]; r.beginArray(); while (r.hasNextElement()) { _list.add(r.readBool()); } r.endArray(); return _list; }(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return ArrBoolean(items: _items);
  },
);

class ArrFloat64 {
  final List<double> items;
  ArrFloat64({required this.items});
}

void _writeArrFloat64(SpecWriter w, ArrFloat64 obj) {
  w.beginObject(1);
  w.writeField('items'); w.beginArray(obj.items.length); for (final _e in obj.items) { w.nextElement(); w.writeFloat64(_e); } w.endArray();
  w.endObject();
}

final ArrFloat64Codec = SpecCodec<ArrFloat64>(
  encode: (w, obj) => _writeArrFloat64(w, obj),
  decode: (r) {
    List<double> _items = [];
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'items': _items = () { final _list = <double>[]; r.beginArray(); while (r.hasNextElement()) { _list.add(r.readFloat64()); } r.endArray(); return _list; }(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return ArrFloat64(items: _items);
  },
);

class ArrBytes {
  final List<Uint8List> items;
  ArrBytes({required this.items});
}

void _writeArrBytes(SpecWriter w, ArrBytes obj) {
  w.beginObject(1);
  w.writeField('items'); w.beginArray(obj.items.length); for (final _e in obj.items) { w.nextElement(); w.writeBytes(_e); } w.endArray();
  w.endObject();
}

final ArrBytesCodec = SpecCodec<ArrBytes>(
  encode: (w, obj) => _writeArrBytes(w, obj),
  decode: (r) {
    List<Uint8List> _items = [];
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'items': _items = () { final _list = <Uint8List>[]; r.beginArray(); while (r.hasNextElement()) { _list.add(r.readBytes()); } r.endArray(); return _list; }(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return ArrBytes(items: _items);
  },
);

class ArrInt64 {
  final List<BigInt> items;
  ArrInt64({required this.items});
}

void _writeArrInt64(SpecWriter w, ArrInt64 obj) {
  w.beginObject(1);
  w.writeField('items'); w.beginArray(obj.items.length); for (final _e in obj.items) { w.nextElement(); w.writeInt64(_e); } w.endArray();
  w.endObject();
}

final ArrInt64Codec = SpecCodec<ArrInt64>(
  encode: (w, obj) => _writeArrInt64(w, obj),
  decode: (r) {
    List<BigInt> _items = [];
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'items': _items = () { final _list = <BigInt>[]; r.beginArray(); while (r.hasNextElement()) { _list.add(r.readInt64()); } r.endArray(); return _list; }(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return ArrInt64(items: _items);
  },
);

class ArrUint64 {
  final List<BigInt> items;
  ArrUint64({required this.items});
}

void _writeArrUint64(SpecWriter w, ArrUint64 obj) {
  w.beginObject(1);
  w.writeField('items'); w.beginArray(obj.items.length); for (final _e in obj.items) { w.nextElement(); w.writeUint64(_e); } w.endArray();
  w.endObject();
}

final ArrUint64Codec = SpecCodec<ArrUint64>(
  encode: (w, obj) => _writeArrUint64(w, obj),
  decode: (r) {
    List<BigInt> _items = [];
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'items': _items = () { final _list = <BigInt>[]; r.beginArray(); while (r.hasNextElement()) { _list.add(r.readUint64()); } r.endArray(); return _list; }(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return ArrUint64(items: _items);
  },
);

class MultiArr1 {
  final List<String> names;
  final List<int> scores;
  MultiArr1({required this.names, required this.scores});
}

void _writeMultiArr1(SpecWriter w, MultiArr1 obj) {
  w.beginObject(2);
  w.writeField('names'); w.beginArray(obj.names.length); for (final _e in obj.names) { w.nextElement(); w.writeString(_e); } w.endArray();
  w.writeField('scores'); w.beginArray(obj.scores.length); for (final _e in obj.scores) { w.nextElement(); w.writeInt32(_e); } w.endArray();
  w.endObject();
}

final MultiArr1Codec = SpecCodec<MultiArr1>(
  encode: (w, obj) => _writeMultiArr1(w, obj),
  decode: (r) {
    List<String> _names = [];
    List<int> _scores = [];
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'names': _names = () { final _list = <String>[]; r.beginArray(); while (r.hasNextElement()) { _list.add(r.readString()); } r.endArray(); return _list; }(); break;
        case 'scores': _scores = () { final _list = <int>[]; r.beginArray(); while (r.hasNextElement()) { _list.add(r.readInt32()); } r.endArray(); return _list; }(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return MultiArr1(names: _names, scores: _scores);
  },
);

class MultiArr2 {
  final List<bool> flags;
  final List<double> values;
  final List<Uint8List> payload;
  MultiArr2({required this.flags, required this.values, required this.payload});
}

void _writeMultiArr2(SpecWriter w, MultiArr2 obj) {
  w.beginObject(3);
  w.writeField('flags'); w.beginArray(obj.flags.length); for (final _e in obj.flags) { w.nextElement(); w.writeBool(_e); } w.endArray();
  w.writeField('values'); w.beginArray(obj.values.length); for (final _e in obj.values) { w.nextElement(); w.writeFloat64(_e); } w.endArray();
  w.writeField('payload'); w.beginArray(obj.payload.length); for (final _e in obj.payload) { w.nextElement(); w.writeBytes(_e); } w.endArray();
  w.endObject();
}

final MultiArr2Codec = SpecCodec<MultiArr2>(
  encode: (w, obj) => _writeMultiArr2(w, obj),
  decode: (r) {
    List<bool> _flags = [];
    List<double> _values = [];
    List<Uint8List> _payload = [];
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'flags': _flags = () { final _list = <bool>[]; r.beginArray(); while (r.hasNextElement()) { _list.add(r.readBool()); } r.endArray(); return _list; }(); break;
        case 'values': _values = () { final _list = <double>[]; r.beginArray(); while (r.hasNextElement()) { _list.add(r.readFloat64()); } r.endArray(); return _list; }(); break;
        case 'payload': _payload = () { final _list = <Uint8List>[]; r.beginArray(); while (r.hasNextElement()) { _list.add(r.readBytes()); } r.endArray(); return _list; }(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return MultiArr2(flags: _flags, values: _values, payload: _payload);
  },
);

class MultiArr3 {
  final List<String> a;
  final List<int> b;
  final List<double> c;
  MultiArr3({required this.a, required this.b, required this.c});
}

void _writeMultiArr3(SpecWriter w, MultiArr3 obj) {
  w.beginObject(3);
  w.writeField('a'); w.beginArray(obj.a.length); for (final _e in obj.a) { w.nextElement(); w.writeString(_e); } w.endArray();
  w.writeField('b'); w.beginArray(obj.b.length); for (final _e in obj.b) { w.nextElement(); w.writeInt32(_e); } w.endArray();
  w.writeField('c'); w.beginArray(obj.c.length); for (final _e in obj.c) { w.nextElement(); w.writeFloat64(_e); } w.endArray();
  w.endObject();
}

final MultiArr3Codec = SpecCodec<MultiArr3>(
  encode: (w, obj) => _writeMultiArr3(w, obj),
  decode: (r) {
    List<String> _a = [];
    List<int> _b = [];
    List<double> _c = [];
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = () { final _list = <String>[]; r.beginArray(); while (r.hasNextElement()) { _list.add(r.readString()); } r.endArray(); return _list; }(); break;
        case 'b': _b = () { final _list = <int>[]; r.beginArray(); while (r.hasNextElement()) { _list.add(r.readInt32()); } r.endArray(); return _list; }(); break;
        case 'c': _c = () { final _list = <double>[]; r.beginArray(); while (r.hasNextElement()) { _list.add(r.readFloat64()); } r.endArray(); return _list; }(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return MultiArr3(a: _a, b: _b, c: _c);
  },
);

class MultiArr4 {
  final List<BigInt> ids;
  final List<String> tags;
  MultiArr4({required this.ids, required this.tags});
}

void _writeMultiArr4(SpecWriter w, MultiArr4 obj) {
  w.beginObject(2);
  w.writeField('ids'); w.beginArray(obj.ids.length); for (final _e in obj.ids) { w.nextElement(); w.writeInt64(_e); } w.endArray();
  w.writeField('tags'); w.beginArray(obj.tags.length); for (final _e in obj.tags) { w.nextElement(); w.writeString(_e); } w.endArray();
  w.endObject();
}

final MultiArr4Codec = SpecCodec<MultiArr4>(
  encode: (w, obj) => _writeMultiArr4(w, obj),
  decode: (r) {
    List<BigInt> _ids = [];
    List<String> _tags = [];
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'ids': _ids = () { final _list = <BigInt>[]; r.beginArray(); while (r.hasNextElement()) { _list.add(r.readInt64()); } r.endArray(); return _list; }(); break;
        case 'tags': _tags = () { final _list = <String>[]; r.beginArray(); while (r.hasNextElement()) { _list.add(r.readString()); } r.endArray(); return _list; }(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return MultiArr4(ids: _ids, tags: _tags);
  },
);

class MultiArr5 {
  final List<BigInt> xs;
  final List<double> ys;
  final List<bool> zs;
  MultiArr5({required this.xs, required this.ys, required this.zs});
}

void _writeMultiArr5(SpecWriter w, MultiArr5 obj) {
  w.beginObject(3);
  w.writeField('xs'); w.beginArray(obj.xs.length); for (final _e in obj.xs) { w.nextElement(); w.writeUint64(_e); } w.endArray();
  w.writeField('ys'); w.beginArray(obj.ys.length); for (final _e in obj.ys) { w.nextElement(); w.writeFloat32(_e); } w.endArray();
  w.writeField('zs'); w.beginArray(obj.zs.length); for (final _e in obj.zs) { w.nextElement(); w.writeBool(_e); } w.endArray();
  w.endObject();
}

final MultiArr5Codec = SpecCodec<MultiArr5>(
  encode: (w, obj) => _writeMultiArr5(w, obj),
  decode: (r) {
    List<BigInt> _xs = [];
    List<double> _ys = [];
    List<bool> _zs = [];
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'xs': _xs = () { final _list = <BigInt>[]; r.beginArray(); while (r.hasNextElement()) { _list.add(r.readUint64()); } r.endArray(); return _list; }(); break;
        case 'ys': _ys = () { final _list = <double>[]; r.beginArray(); while (r.hasNextElement()) { _list.add(r.readFloat32()); } r.endArray(); return _list; }(); break;
        case 'zs': _zs = () { final _list = <bool>[]; r.beginArray(); while (r.hasNextElement()) { _list.add(r.readBool()); } r.endArray(); return _list; }(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return MultiArr5(xs: _xs, ys: _ys, zs: _zs);
  },
);

class OptCombo1 {
  final String req;
  final int? opt_a;
  OptCombo1({required this.req, this.opt_a});
}

void _writeOptCombo1(SpecWriter w, OptCombo1 obj) {
  var _n = 1;
  if (obj.opt_a != null) _n++;
  w.beginObject(_n);
  w.writeField('req'); w.writeString(obj.req);
  if (obj.opt_a != null) { w.writeField('opt_a'); w.writeInt32(obj.opt_a!); }
  w.endObject();
}

final OptCombo1Codec = SpecCodec<OptCombo1>(
  encode: (w, obj) => _writeOptCombo1(w, obj),
  decode: (r) {
    String _req = '';
    int? _opt_a;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'req': _req = r.readString(); break;
        case 'opt_a': _opt_a = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptCombo1(req: _req, opt_a: _opt_a);
  },
);

class OptCombo2 {
  final String req;
  final int? opt_a;
  final bool? opt_b;
  OptCombo2({required this.req, this.opt_a, this.opt_b});
}

void _writeOptCombo2(SpecWriter w, OptCombo2 obj) {
  var _n = 1;
  if (obj.opt_a != null) _n++;
  if (obj.opt_b != null) _n++;
  w.beginObject(_n);
  w.writeField('req'); w.writeString(obj.req);
  if (obj.opt_a != null) { w.writeField('opt_a'); w.writeInt32(obj.opt_a!); }
  if (obj.opt_b != null) { w.writeField('opt_b'); w.writeBool(obj.opt_b!); }
  w.endObject();
}

final OptCombo2Codec = SpecCodec<OptCombo2>(
  encode: (w, obj) => _writeOptCombo2(w, obj),
  decode: (r) {
    String _req = '';
    int? _opt_a;
    bool? _opt_b;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'req': _req = r.readString(); break;
        case 'opt_a': _opt_a = r.readInt32(); break;
        case 'opt_b': _opt_b = r.readBool(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptCombo2(req: _req, opt_a: _opt_a, opt_b: _opt_b);
  },
);

class OptCombo3 {
  final String req;
  final int? opt_a;
  final bool? opt_b;
  final double? opt_c;
  OptCombo3({required this.req, this.opt_a, this.opt_b, this.opt_c});
}

void _writeOptCombo3(SpecWriter w, OptCombo3 obj) {
  var _n = 1;
  if (obj.opt_a != null) _n++;
  if (obj.opt_b != null) _n++;
  if (obj.opt_c != null) _n++;
  w.beginObject(_n);
  w.writeField('req'); w.writeString(obj.req);
  if (obj.opt_a != null) { w.writeField('opt_a'); w.writeInt32(obj.opt_a!); }
  if (obj.opt_b != null) { w.writeField('opt_b'); w.writeBool(obj.opt_b!); }
  if (obj.opt_c != null) { w.writeField('opt_c'); w.writeFloat64(obj.opt_c!); }
  w.endObject();
}

final OptCombo3Codec = SpecCodec<OptCombo3>(
  encode: (w, obj) => _writeOptCombo3(w, obj),
  decode: (r) {
    String _req = '';
    int? _opt_a;
    bool? _opt_b;
    double? _opt_c;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'req': _req = r.readString(); break;
        case 'opt_a': _opt_a = r.readInt32(); break;
        case 'opt_b': _opt_b = r.readBool(); break;
        case 'opt_c': _opt_c = r.readFloat64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptCombo3(req: _req, opt_a: _opt_a, opt_b: _opt_b, opt_c: _opt_c);
  },
);

class OptCombo4 {
  final int req;
  final String? opt_a;
  final Uint8List? opt_b;
  OptCombo4({required this.req, this.opt_a, this.opt_b});
}

void _writeOptCombo4(SpecWriter w, OptCombo4 obj) {
  var _n = 1;
  if (obj.opt_a != null) _n++;
  if (obj.opt_b != null) _n++;
  w.beginObject(_n);
  w.writeField('req'); w.writeInt32(obj.req);
  if (obj.opt_a != null) { w.writeField('opt_a'); w.writeString(obj.opt_a!); }
  if (obj.opt_b != null) { w.writeField('opt_b'); w.writeBytes(obj.opt_b!); }
  w.endObject();
}

final OptCombo4Codec = SpecCodec<OptCombo4>(
  encode: (w, obj) => _writeOptCombo4(w, obj),
  decode: (r) {
    int _req = 0;
    String? _opt_a;
    Uint8List? _opt_b;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'req': _req = r.readInt32(); break;
        case 'opt_a': _opt_a = r.readString(); break;
        case 'opt_b': _opt_b = r.readBytes(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptCombo4(req: _req, opt_a: _opt_a, opt_b: _opt_b);
  },
);

class OptCombo5 {
  final String req1;
  final int req2;
  final bool? opt_a;
  final double? opt_b;
  OptCombo5({required this.req1, required this.req2, this.opt_a, this.opt_b});
}

void _writeOptCombo5(SpecWriter w, OptCombo5 obj) {
  var _n = 2;
  if (obj.opt_a != null) _n++;
  if (obj.opt_b != null) _n++;
  w.beginObject(_n);
  w.writeField('req1'); w.writeString(obj.req1);
  w.writeField('req2'); w.writeInt32(obj.req2);
  if (obj.opt_a != null) { w.writeField('opt_a'); w.writeBool(obj.opt_a!); }
  if (obj.opt_b != null) { w.writeField('opt_b'); w.writeFloat64(obj.opt_b!); }
  w.endObject();
}

final OptCombo5Codec = SpecCodec<OptCombo5>(
  encode: (w, obj) => _writeOptCombo5(w, obj),
  decode: (r) {
    String _req1 = '';
    int _req2 = 0;
    bool? _opt_a;
    double? _opt_b;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'req1': _req1 = r.readString(); break;
        case 'req2': _req2 = r.readInt32(); break;
        case 'opt_a': _opt_a = r.readBool(); break;
        case 'opt_b': _opt_b = r.readFloat64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptCombo5(req1: _req1, req2: _req2, opt_a: _opt_a, opt_b: _opt_b);
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

void _writeOptCombo6(SpecWriter w, OptCombo6 obj) {
  var _n = 1;
  if (obj.opt_s != null) _n++;
  if (obj.opt_i != null) _n++;
  if (obj.opt_f != null) _n++;
  if (obj.opt_b != null) _n++;
  w.beginObject(_n);
  w.writeField('req'); w.writeString(obj.req);
  if (obj.opt_s != null) { w.writeField('opt_s'); w.writeString(obj.opt_s!); }
  if (obj.opt_i != null) { w.writeField('opt_i'); w.writeInt32(obj.opt_i!); }
  if (obj.opt_f != null) { w.writeField('opt_f'); w.writeFloat64(obj.opt_f!); }
  if (obj.opt_b != null) { w.writeField('opt_b'); w.writeBytes(obj.opt_b!); }
  w.endObject();
}

final OptCombo6Codec = SpecCodec<OptCombo6>(
  encode: (w, obj) => _writeOptCombo6(w, obj),
  decode: (r) {
    String _req = '';
    String? _opt_s;
    int? _opt_i;
    double? _opt_f;
    Uint8List? _opt_b;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'req': _req = r.readString(); break;
        case 'opt_s': _opt_s = r.readString(); break;
        case 'opt_i': _opt_i = r.readInt32(); break;
        case 'opt_f': _opt_f = r.readFloat64(); break;
        case 'opt_b': _opt_b = r.readBytes(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptCombo6(req: _req, opt_s: _opt_s, opt_i: _opt_i, opt_f: _opt_f, opt_b: _opt_b);
  },
);

class OptCombo7 {
  final BigInt req;
  final BigInt? opt_u64;
  final String? opt_str;
  OptCombo7({required this.req, this.opt_u64, this.opt_str});
}

void _writeOptCombo7(SpecWriter w, OptCombo7 obj) {
  var _n = 1;
  if (obj.opt_u64 != null) _n++;
  if (obj.opt_str != null) _n++;
  w.beginObject(_n);
  w.writeField('req'); w.writeInt64(obj.req);
  if (obj.opt_u64 != null) { w.writeField('opt_u64'); w.writeUint64(obj.opt_u64!); }
  if (obj.opt_str != null) { w.writeField('opt_str'); w.writeString(obj.opt_str!); }
  w.endObject();
}

final OptCombo7Codec = SpecCodec<OptCombo7>(
  encode: (w, obj) => _writeOptCombo7(w, obj),
  decode: (r) {
    BigInt _req = BigInt.zero;
    BigInt? _opt_u64;
    String? _opt_str;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'req': _req = r.readInt64(); break;
        case 'opt_u64': _opt_u64 = r.readUint64(); break;
        case 'opt_str': _opt_str = r.readString(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptCombo7(req: _req, opt_u64: _opt_u64, opt_str: _opt_str);
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

void _writeOptCombo8(SpecWriter w, OptCombo8 obj) {
  var _n = 1;
  if (obj.b != null) _n++;
  if (obj.c != null) _n++;
  if (obj.d != null) _n++;
  if (obj.e != null) _n++;
  if (obj.f != null) _n++;
  w.beginObject(_n);
  w.writeField('a'); w.writeString(obj.a);
  if (obj.b != null) { w.writeField('b'); w.writeInt32(obj.b!); }
  if (obj.c != null) { w.writeField('c'); w.writeFloat64(obj.c!); }
  if (obj.d != null) { w.writeField('d'); w.writeBool(obj.d!); }
  if (obj.e != null) { w.writeField('e'); w.writeBytes(obj.e!); }
  if (obj.f != null) { w.writeField('f'); w.writeInt64(obj.f!); }
  w.endObject();
}

final OptCombo8Codec = SpecCodec<OptCombo8>(
  encode: (w, obj) => _writeOptCombo8(w, obj),
  decode: (r) {
    String _a = '';
    int? _b;
    double? _c;
    bool? _d;
    Uint8List? _e;
    BigInt? _f;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readString(); break;
        case 'b': _b = r.readInt32(); break;
        case 'c': _c = r.readFloat64(); break;
        case 'd': _d = r.readBool(); break;
        case 'e': _e = r.readBytes(); break;
        case 'f': _f = r.readInt64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptCombo8(a: _a, b: _b, c: _c, d: _d, e: _e, f: _f);
  },
);

class OptCombo9 {
  final String id;
  final String? name;
  final int? age;
  final double? score;
  OptCombo9({required this.id, this.name, this.age, this.score});
}

void _writeOptCombo9(SpecWriter w, OptCombo9 obj) {
  var _n = 1;
  if (obj.name != null) _n++;
  if (obj.age != null) _n++;
  if (obj.score != null) _n++;
  w.beginObject(_n);
  w.writeField('id'); w.writeString(obj.id);
  if (obj.name != null) { w.writeField('name'); w.writeString(obj.name!); }
  if (obj.age != null) { w.writeField('age'); w.writeInt32(obj.age!); }
  if (obj.score != null) { w.writeField('score'); w.writeFloat64(obj.score!); }
  w.endObject();
}

final OptCombo9Codec = SpecCodec<OptCombo9>(
  encode: (w, obj) => _writeOptCombo9(w, obj),
  decode: (r) {
    String _id = '';
    String? _name;
    int? _age;
    double? _score;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'id': _id = r.readString(); break;
        case 'name': _name = r.readString(); break;
        case 'age': _age = r.readInt32(); break;
        case 'score': _score = r.readFloat64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptCombo9(id: _id, name: _name, age: _age, score: _score);
  },
);

class OptCombo10 {
  final int code;
  final String? msg;
  final String? detail;
  final bool? retry;
  OptCombo10({required this.code, this.msg, this.detail, this.retry});
}

void _writeOptCombo10(SpecWriter w, OptCombo10 obj) {
  var _n = 1;
  if (obj.msg != null) _n++;
  if (obj.detail != null) _n++;
  if (obj.retry != null) _n++;
  w.beginObject(_n);
  w.writeField('code'); w.writeInt32(obj.code);
  if (obj.msg != null) { w.writeField('msg'); w.writeString(obj.msg!); }
  if (obj.detail != null) { w.writeField('detail'); w.writeString(obj.detail!); }
  if (obj.retry != null) { w.writeField('retry'); w.writeBool(obj.retry!); }
  w.endObject();
}

final OptCombo10Codec = SpecCodec<OptCombo10>(
  encode: (w, obj) => _writeOptCombo10(w, obj),
  decode: (r) {
    int _code = 0;
    String? _msg;
    String? _detail;
    bool? _retry;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'code': _code = r.readInt32(); break;
        case 'msg': _msg = r.readString(); break;
        case 'detail': _detail = r.readString(); break;
        case 'retry': _retry = r.readBool(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptCombo10(code: _code, msg: _msg, detail: _detail, retry: _retry);
  },
);

class NestInner {
  final Inner nested;
  NestInner({required this.nested});
}

void _writeNestInner(SpecWriter w, NestInner obj) {
  w.beginObject(1);
  w.writeField('nested'); _writeInner(w, obj.nested);
  w.endObject();
}

final NestInnerCodec = SpecCodec<NestInner>(
  encode: (w, obj) => _writeNestInner(w, obj),
  decode: (r) {
    late Inner _nested;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'nested': _nested = InnerCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return NestInner(nested: _nested);
  },
);

class NestCoord {
  final Coord nested;
  NestCoord({required this.nested});
}

void _writeNestCoord(SpecWriter w, NestCoord obj) {
  w.beginObject(1);
  w.writeField('nested'); _writeCoord(w, obj.nested);
  w.endObject();
}

final NestCoordCodec = SpecCodec<NestCoord>(
  encode: (w, obj) => _writeNestCoord(w, obj),
  decode: (r) {
    late Coord _nested;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'nested': _nested = CoordCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return NestCoord(nested: _nested);
  },
);

class NestIdVal {
  final IdVal nested;
  NestIdVal({required this.nested});
}

void _writeNestIdVal(SpecWriter w, NestIdVal obj) {
  w.beginObject(1);
  w.writeField('nested'); _writeIdVal(w, obj.nested);
  w.endObject();
}

final NestIdValCodec = SpecCodec<NestIdVal>(
  encode: (w, obj) => _writeNestIdVal(w, obj),
  decode: (r) {
    late IdVal _nested;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'nested': _nested = IdValCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return NestIdVal(nested: _nested);
  },
);

class NestLabel {
  final Label nested;
  NestLabel({required this.nested});
}

void _writeNestLabel(SpecWriter w, NestLabel obj) {
  w.beginObject(1);
  w.writeField('nested'); _writeLabel(w, obj.nested);
  w.endObject();
}

final NestLabelCodec = SpecCodec<NestLabel>(
  encode: (w, obj) => _writeNestLabel(w, obj),
  decode: (r) {
    late Label _nested;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'nested': _nested = LabelCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return NestLabel(nested: _nested);
  },
);

class NestMoney {
  final Money nested;
  NestMoney({required this.nested});
}

void _writeNestMoney(SpecWriter w, NestMoney obj) {
  w.beginObject(1);
  w.writeField('nested'); _writeMoney(w, obj.nested);
  w.endObject();
}

final NestMoneyCodec = SpecCodec<NestMoney>(
  encode: (w, obj) => _writeNestMoney(w, obj),
  decode: (r) {
    late Money _nested;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'nested': _nested = MoneyCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return NestMoney(nested: _nested);
  },
);

class NestRange32 {
  final Range32 nested;
  NestRange32({required this.nested});
}

void _writeNestRange32(SpecWriter w, NestRange32 obj) {
  w.beginObject(1);
  w.writeField('nested'); _writeRange32(w, obj.nested);
  w.endObject();
}

final NestRange32Codec = SpecCodec<NestRange32>(
  encode: (w, obj) => _writeNestRange32(w, obj),
  decode: (r) {
    late Range32 _nested;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'nested': _nested = Range32Codec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return NestRange32(nested: _nested);
  },
);

class NestAddr {
  final Addr nested;
  NestAddr({required this.nested});
}

void _writeNestAddr(SpecWriter w, NestAddr obj) {
  w.beginObject(1);
  w.writeField('nested'); _writeAddr(w, obj.nested);
  w.endObject();
}

final NestAddrCodec = SpecCodec<NestAddr>(
  encode: (w, obj) => _writeNestAddr(w, obj),
  decode: (r) {
    late Addr _nested;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'nested': _nested = AddrCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return NestAddr(nested: _nested);
  },
);

class NestPoint3 {
  final Point3 nested;
  NestPoint3({required this.nested});
}

void _writeNestPoint3(SpecWriter w, NestPoint3 obj) {
  w.beginObject(1);
  w.writeField('nested'); _writePoint3(w, obj.nested);
  w.endObject();
}

final NestPoint3Codec = SpecCodec<NestPoint3>(
  encode: (w, obj) => _writeNestPoint3(w, obj),
  decode: (r) {
    late Point3 _nested;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'nested': _nested = Point3Codec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return NestPoint3(nested: _nested);
  },
);

class OptNestInner {
  final String label;
  final Inner? nested;
  OptNestInner({required this.label, this.nested});
}

void _writeOptNestInner(SpecWriter w, OptNestInner obj) {
  var _n = 1;
  if (obj.nested != null) _n++;
  w.beginObject(_n);
  w.writeField('label'); w.writeString(obj.label);
  if (obj.nested != null) { w.writeField('nested'); _writeInner(w, obj.nested!); }
  w.endObject();
}

final OptNestInnerCodec = SpecCodec<OptNestInner>(
  encode: (w, obj) => _writeOptNestInner(w, obj),
  decode: (r) {
    String _label = '';
    Inner? _nested;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'label': _label = r.readString(); break;
        case 'nested': _nested = r.isNull() ? (() { r.readNull(); return null; })() : InnerCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptNestInner(label: _label, nested: _nested);
  },
);

class OptNestCoord {
  final String label;
  final Coord? nested;
  OptNestCoord({required this.label, this.nested});
}

void _writeOptNestCoord(SpecWriter w, OptNestCoord obj) {
  var _n = 1;
  if (obj.nested != null) _n++;
  w.beginObject(_n);
  w.writeField('label'); w.writeString(obj.label);
  if (obj.nested != null) { w.writeField('nested'); _writeCoord(w, obj.nested!); }
  w.endObject();
}

final OptNestCoordCodec = SpecCodec<OptNestCoord>(
  encode: (w, obj) => _writeOptNestCoord(w, obj),
  decode: (r) {
    String _label = '';
    Coord? _nested;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'label': _label = r.readString(); break;
        case 'nested': _nested = r.isNull() ? (() { r.readNull(); return null; })() : CoordCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptNestCoord(label: _label, nested: _nested);
  },
);

class OptNestIdVal {
  final String label;
  final IdVal? nested;
  OptNestIdVal({required this.label, this.nested});
}

void _writeOptNestIdVal(SpecWriter w, OptNestIdVal obj) {
  var _n = 1;
  if (obj.nested != null) _n++;
  w.beginObject(_n);
  w.writeField('label'); w.writeString(obj.label);
  if (obj.nested != null) { w.writeField('nested'); _writeIdVal(w, obj.nested!); }
  w.endObject();
}

final OptNestIdValCodec = SpecCodec<OptNestIdVal>(
  encode: (w, obj) => _writeOptNestIdVal(w, obj),
  decode: (r) {
    String _label = '';
    IdVal? _nested;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'label': _label = r.readString(); break;
        case 'nested': _nested = r.isNull() ? (() { r.readNull(); return null; })() : IdValCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptNestIdVal(label: _label, nested: _nested);
  },
);

class OptNestLabel {
  final String label;
  final Label? nested;
  OptNestLabel({required this.label, this.nested});
}

void _writeOptNestLabel(SpecWriter w, OptNestLabel obj) {
  var _n = 1;
  if (obj.nested != null) _n++;
  w.beginObject(_n);
  w.writeField('label'); w.writeString(obj.label);
  if (obj.nested != null) { w.writeField('nested'); _writeLabel(w, obj.nested!); }
  w.endObject();
}

final OptNestLabelCodec = SpecCodec<OptNestLabel>(
  encode: (w, obj) => _writeOptNestLabel(w, obj),
  decode: (r) {
    String _label = '';
    Label? _nested;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'label': _label = r.readString(); break;
        case 'nested': _nested = r.isNull() ? (() { r.readNull(); return null; })() : LabelCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptNestLabel(label: _label, nested: _nested);
  },
);

class OptNestMoney {
  final String label;
  final Money? nested;
  OptNestMoney({required this.label, this.nested});
}

void _writeOptNestMoney(SpecWriter w, OptNestMoney obj) {
  var _n = 1;
  if (obj.nested != null) _n++;
  w.beginObject(_n);
  w.writeField('label'); w.writeString(obj.label);
  if (obj.nested != null) { w.writeField('nested'); _writeMoney(w, obj.nested!); }
  w.endObject();
}

final OptNestMoneyCodec = SpecCodec<OptNestMoney>(
  encode: (w, obj) => _writeOptNestMoney(w, obj),
  decode: (r) {
    String _label = '';
    Money? _nested;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'label': _label = r.readString(); break;
        case 'nested': _nested = r.isNull() ? (() { r.readNull(); return null; })() : MoneyCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptNestMoney(label: _label, nested: _nested);
  },
);

class OptNestRange32 {
  final String label;
  final Range32? nested;
  OptNestRange32({required this.label, this.nested});
}

void _writeOptNestRange32(SpecWriter w, OptNestRange32 obj) {
  var _n = 1;
  if (obj.nested != null) _n++;
  w.beginObject(_n);
  w.writeField('label'); w.writeString(obj.label);
  if (obj.nested != null) { w.writeField('nested'); _writeRange32(w, obj.nested!); }
  w.endObject();
}

final OptNestRange32Codec = SpecCodec<OptNestRange32>(
  encode: (w, obj) => _writeOptNestRange32(w, obj),
  decode: (r) {
    String _label = '';
    Range32? _nested;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'label': _label = r.readString(); break;
        case 'nested': _nested = r.isNull() ? (() { r.readNull(); return null; })() : Range32Codec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptNestRange32(label: _label, nested: _nested);
  },
);

class OptNestAddr {
  final String label;
  final Addr? nested;
  OptNestAddr({required this.label, this.nested});
}

void _writeOptNestAddr(SpecWriter w, OptNestAddr obj) {
  var _n = 1;
  if (obj.nested != null) _n++;
  w.beginObject(_n);
  w.writeField('label'); w.writeString(obj.label);
  if (obj.nested != null) { w.writeField('nested'); _writeAddr(w, obj.nested!); }
  w.endObject();
}

final OptNestAddrCodec = SpecCodec<OptNestAddr>(
  encode: (w, obj) => _writeOptNestAddr(w, obj),
  decode: (r) {
    String _label = '';
    Addr? _nested;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'label': _label = r.readString(); break;
        case 'nested': _nested = r.isNull() ? (() { r.readNull(); return null; })() : AddrCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptNestAddr(label: _label, nested: _nested);
  },
);

class OptNestPoint3 {
  final String label;
  final Point3? nested;
  OptNestPoint3({required this.label, this.nested});
}

void _writeOptNestPoint3(SpecWriter w, OptNestPoint3 obj) {
  var _n = 1;
  if (obj.nested != null) _n++;
  w.beginObject(_n);
  w.writeField('label'); w.writeString(obj.label);
  if (obj.nested != null) { w.writeField('nested'); _writePoint3(w, obj.nested!); }
  w.endObject();
}

final OptNestPoint3Codec = SpecCodec<OptNestPoint3>(
  encode: (w, obj) => _writeOptNestPoint3(w, obj),
  decode: (r) {
    String _label = '';
    Point3? _nested;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'label': _label = r.readString(); break;
        case 'nested': _nested = r.isNull() ? (() { r.readNull(); return null; })() : Point3Codec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptNestPoint3(label: _label, nested: _nested);
  },
);

class ModelArr1 {
  final List<Inner> points;
  ModelArr1({required this.points});
}

void _writeModelArr1(SpecWriter w, ModelArr1 obj) {
  w.beginObject(1);
  w.writeField('points'); w.beginArray(obj.points.length); for (final _e in obj.points) { w.nextElement(); _writeInner(w, _e); } w.endArray();
  w.endObject();
}

final ModelArr1Codec = SpecCodec<ModelArr1>(
  encode: (w, obj) => _writeModelArr1(w, obj),
  decode: (r) {
    List<Inner> _points = [];
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'points': _points = () { final _list = <Inner>[]; r.beginArray(); while (r.hasNextElement()) { _list.add(InnerCodec.decode(r)); } r.endArray(); return _list; }(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return ModelArr1(points: _points);
  },
);

class ModelArr2 {
  final List<Coord> coords;
  ModelArr2({required this.coords});
}

void _writeModelArr2(SpecWriter w, ModelArr2 obj) {
  w.beginObject(1);
  w.writeField('coords'); w.beginArray(obj.coords.length); for (final _e in obj.coords) { w.nextElement(); _writeCoord(w, _e); } w.endArray();
  w.endObject();
}

final ModelArr2Codec = SpecCodec<ModelArr2>(
  encode: (w, obj) => _writeModelArr2(w, obj),
  decode: (r) {
    List<Coord> _coords = [];
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'coords': _coords = () { final _list = <Coord>[]; r.beginArray(); while (r.hasNextElement()) { _list.add(CoordCodec.decode(r)); } r.endArray(); return _list; }(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return ModelArr2(coords: _coords);
  },
);

class ModelArr3 {
  final List<IdVal> items;
  final String tag;
  ModelArr3({required this.items, required this.tag});
}

void _writeModelArr3(SpecWriter w, ModelArr3 obj) {
  w.beginObject(2);
  w.writeField('items'); w.beginArray(obj.items.length); for (final _e in obj.items) { w.nextElement(); _writeIdVal(w, _e); } w.endArray();
  w.writeField('tag'); w.writeString(obj.tag);
  w.endObject();
}

final ModelArr3Codec = SpecCodec<ModelArr3>(
  encode: (w, obj) => _writeModelArr3(w, obj),
  decode: (r) {
    List<IdVal> _items = [];
    String _tag = '';
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'items': _items = () { final _list = <IdVal>[]; r.beginArray(); while (r.hasNextElement()) { _list.add(IdValCodec.decode(r)); } r.endArray(); return _list; }(); break;
        case 'tag': _tag = r.readString(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return ModelArr3(items: _items, tag: _tag);
  },
);

class ModelArr4 {
  final List<Label> labels;
  final int count;
  ModelArr4({required this.labels, required this.count});
}

void _writeModelArr4(SpecWriter w, ModelArr4 obj) {
  w.beginObject(2);
  w.writeField('labels'); w.beginArray(obj.labels.length); for (final _e in obj.labels) { w.nextElement(); _writeLabel(w, _e); } w.endArray();
  w.writeField('count'); w.writeInt32(obj.count);
  w.endObject();
}

final ModelArr4Codec = SpecCodec<ModelArr4>(
  encode: (w, obj) => _writeModelArr4(w, obj),
  decode: (r) {
    List<Label> _labels = [];
    int _count = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'labels': _labels = () { final _list = <Label>[]; r.beginArray(); while (r.hasNextElement()) { _list.add(LabelCodec.decode(r)); } r.endArray(); return _list; }(); break;
        case 'count': _count = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return ModelArr4(labels: _labels, count: _count);
  },
);

class ModelArr5 {
  final List<Money> arr;
  final List<Addr> bs;
  ModelArr5({required this.arr, required this.bs});
}

void _writeModelArr5(SpecWriter w, ModelArr5 obj) {
  w.beginObject(2);
  w.writeField('arr'); w.beginArray(obj.arr.length); for (final _e in obj.arr) { w.nextElement(); _writeMoney(w, _e); } w.endArray();
  w.writeField('bs'); w.beginArray(obj.bs.length); for (final _e in obj.bs) { w.nextElement(); _writeAddr(w, _e); } w.endArray();
  w.endObject();
}

final ModelArr5Codec = SpecCodec<ModelArr5>(
  encode: (w, obj) => _writeModelArr5(w, obj),
  decode: (r) {
    List<Money> _arr = [];
    List<Addr> _bs = [];
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'arr': _arr = () { final _list = <Money>[]; r.beginArray(); while (r.hasNextElement()) { _list.add(MoneyCodec.decode(r)); } r.endArray(); return _list; }(); break;
        case 'bs': _bs = () { final _list = <Addr>[]; r.beginArray(); while (r.hasNextElement()) { _list.add(AddrCodec.decode(r)); } r.endArray(); return _list; }(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return ModelArr5(arr: _arr, bs: _bs);
  },
);

class Mix01 {
  final String name;
  final int value;
  final Inner point;
  Mix01({required this.name, required this.value, required this.point});
}

void _writeMix01(SpecWriter w, Mix01 obj) {
  w.beginObject(3);
  w.writeField('name'); w.writeString(obj.name);
  w.writeField('value'); w.writeInt32(obj.value);
  w.writeField('point'); _writeInner(w, obj.point);
  w.endObject();
}

final Mix01Codec = SpecCodec<Mix01>(
  encode: (w, obj) => _writeMix01(w, obj),
  decode: (r) {
    String _name = '';
    int _value = 0;
    late Inner _point;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'name': _name = r.readString(); break;
        case 'value': _value = r.readInt32(); break;
        case 'point': _point = InnerCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Mix01(name: _name, value: _value, point: _point);
  },
);

class Mix02 {
  final String id;
  final Coord loc;
  final List<String> tags;
  Mix02({required this.id, required this.loc, required this.tags});
}

void _writeMix02(SpecWriter w, Mix02 obj) {
  w.beginObject(3);
  w.writeField('id'); w.writeString(obj.id);
  w.writeField('loc'); _writeCoord(w, obj.loc);
  w.writeField('tags'); w.beginArray(obj.tags.length); for (final _e in obj.tags) { w.nextElement(); w.writeString(_e); } w.endArray();
  w.endObject();
}

final Mix02Codec = SpecCodec<Mix02>(
  encode: (w, obj) => _writeMix02(w, obj),
  decode: (r) {
    String _id = '';
    late Coord _loc;
    List<String> _tags = [];
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'id': _id = r.readString(); break;
        case 'loc': _loc = CoordCodec.decode(r); break;
        case 'tags': _tags = () { final _list = <String>[]; r.beginArray(); while (r.hasNextElement()) { _list.add(r.readString()); } r.endArray(); return _list; }(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Mix02(id: _id, loc: _loc, tags: _tags);
  },
);

class Mix03 {
  final String label;
  final Range32 value_range;
  final bool active;
  Mix03({required this.label, required this.value_range, required this.active});
}

void _writeMix03(SpecWriter w, Mix03 obj) {
  w.beginObject(3);
  w.writeField('label'); w.writeString(obj.label);
  w.writeField('value_range'); _writeRange32(w, obj.value_range);
  w.writeField('active'); w.writeBool(obj.active);
  w.endObject();
}

final Mix03Codec = SpecCodec<Mix03>(
  encode: (w, obj) => _writeMix03(w, obj),
  decode: (r) {
    String _label = '';
    late Range32 _value_range;
    bool _active = false;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'label': _label = r.readString(); break;
        case 'value_range': _value_range = Range32Codec.decode(r); break;
        case 'active': _active = r.readBool(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Mix03(label: _label, value_range: _value_range, active: _active);
  },
);

class Mix04 {
  final String title;
  final Money price;
  final bool inStock;
  final double rating;
  Mix04({required this.title, required this.price, required this.inStock, required this.rating});
}

void _writeMix04(SpecWriter w, Mix04 obj) {
  w.beginObject(4);
  w.writeField('title'); w.writeString(obj.title);
  w.writeField('price'); _writeMoney(w, obj.price);
  w.writeField('inStock'); w.writeBool(obj.inStock);
  w.writeField('rating'); w.writeFloat64(obj.rating);
  w.endObject();
}

final Mix04Codec = SpecCodec<Mix04>(
  encode: (w, obj) => _writeMix04(w, obj),
  decode: (r) {
    String _title = '';
    late Money _price;
    bool _inStock = false;
    double _rating = 0.0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'title': _title = r.readString(); break;
        case 'price': _price = MoneyCodec.decode(r); break;
        case 'inStock': _inStock = r.readBool(); break;
        case 'rating': _rating = r.readFloat64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Mix04(title: _title, price: _price, inStock: _inStock, rating: _rating);
  },
);

class Mix05 {
  final Addr addr;
  final List<Coord> coords;
  Mix05({required this.addr, required this.coords});
}

void _writeMix05(SpecWriter w, Mix05 obj) {
  w.beginObject(2);
  w.writeField('addr'); _writeAddr(w, obj.addr);
  w.writeField('coords'); w.beginArray(obj.coords.length); for (final _e in obj.coords) { w.nextElement(); _writeCoord(w, _e); } w.endArray();
  w.endObject();
}

final Mix05Codec = SpecCodec<Mix05>(
  encode: (w, obj) => _writeMix05(w, obj),
  decode: (r) {
    late Addr _addr;
    List<Coord> _coords = [];
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'addr': _addr = AddrCodec.decode(r); break;
        case 'coords': _coords = () { final _list = <Coord>[]; r.beginArray(); while (r.hasNextElement()) { _list.add(CoordCodec.decode(r)); } r.endArray(); return _list; }(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Mix05(addr: _addr, coords: _coords);
  },
);

class Mix06 {
  final String name;
  final int age;
  final Addr? address;
  final String? email;
  Mix06({required this.name, required this.age, this.address, this.email});
}

void _writeMix06(SpecWriter w, Mix06 obj) {
  var _n = 2;
  if (obj.address != null) _n++;
  if (obj.email != null) _n++;
  w.beginObject(_n);
  w.writeField('name'); w.writeString(obj.name);
  w.writeField('age'); w.writeInt32(obj.age);
  if (obj.address != null) { w.writeField('address'); _writeAddr(w, obj.address!); }
  if (obj.email != null) { w.writeField('email'); w.writeString(obj.email!); }
  w.endObject();
}

final Mix06Codec = SpecCodec<Mix06>(
  encode: (w, obj) => _writeMix06(w, obj),
  decode: (r) {
    String _name = '';
    int _age = 0;
    Addr? _address;
    String? _email;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'name': _name = r.readString(); break;
        case 'age': _age = r.readInt32(); break;
        case 'address': _address = r.isNull() ? (() { r.readNull(); return null; })() : AddrCodec.decode(r); break;
        case 'email': _email = r.readString(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Mix06(name: _name, age: _age, address: _address, email: _email);
  },
);

class Mix07 {
  final Point3 origin;
  final Point3 dest;
  final double distance;
  Mix07({required this.origin, required this.dest, required this.distance});
}

void _writeMix07(SpecWriter w, Mix07 obj) {
  w.beginObject(3);
  w.writeField('origin'); _writePoint3(w, obj.origin);
  w.writeField('dest'); _writePoint3(w, obj.dest);
  w.writeField('distance'); w.writeFloat64(obj.distance);
  w.endObject();
}

final Mix07Codec = SpecCodec<Mix07>(
  encode: (w, obj) => _writeMix07(w, obj),
  decode: (r) {
    late Point3 _origin;
    late Point3 _dest;
    double _distance = 0.0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'origin': _origin = Point3Codec.decode(r); break;
        case 'dest': _dest = Point3Codec.decode(r); break;
        case 'distance': _distance = r.readFloat64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Mix07(origin: _origin, dest: _dest, distance: _distance);
  },
);

class Mix08 {
  final List<String> keys;
  final List<int> values;
  final Label? meta;
  Mix08({required this.keys, required this.values, this.meta});
}

void _writeMix08(SpecWriter w, Mix08 obj) {
  var _n = 2;
  if (obj.meta != null) _n++;
  w.beginObject(_n);
  w.writeField('keys'); w.beginArray(obj.keys.length); for (final _e in obj.keys) { w.nextElement(); w.writeString(_e); } w.endArray();
  w.writeField('values'); w.beginArray(obj.values.length); for (final _e in obj.values) { w.nextElement(); w.writeInt32(_e); } w.endArray();
  if (obj.meta != null) { w.writeField('meta'); _writeLabel(w, obj.meta!); }
  w.endObject();
}

final Mix08Codec = SpecCodec<Mix08>(
  encode: (w, obj) => _writeMix08(w, obj),
  decode: (r) {
    List<String> _keys = [];
    List<int> _values = [];
    Label? _meta;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'keys': _keys = () { final _list = <String>[]; r.beginArray(); while (r.hasNextElement()) { _list.add(r.readString()); } r.endArray(); return _list; }(); break;
        case 'values': _values = () { final _list = <int>[]; r.beginArray(); while (r.hasNextElement()) { _list.add(r.readInt32()); } r.endArray(); return _list; }(); break;
        case 'meta': _meta = r.isNull() ? (() { r.readNull(); return null; })() : LabelCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Mix08(keys: _keys, values: _values, meta: _meta);
  },
);

class Mix09 {
  final BigInt id;
  final Uint8List payload;
  final int checksum;
  final IdVal? prev;
  Mix09({required this.id, required this.payload, required this.checksum, this.prev});
}

void _writeMix09(SpecWriter w, Mix09 obj) {
  var _n = 3;
  if (obj.prev != null) _n++;
  w.beginObject(_n);
  w.writeField('id'); w.writeInt64(obj.id);
  w.writeField('payload'); w.writeBytes(obj.payload);
  w.writeField('checksum'); w.writeUint32(obj.checksum);
  if (obj.prev != null) { w.writeField('prev'); _writeIdVal(w, obj.prev!); }
  w.endObject();
}

final Mix09Codec = SpecCodec<Mix09>(
  encode: (w, obj) => _writeMix09(w, obj),
  decode: (r) {
    BigInt _id = BigInt.zero;
    Uint8List _payload = Uint8List(0);
    int _checksum = 0;
    IdVal? _prev;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'id': _id = r.readInt64(); break;
        case 'payload': _payload = r.readBytes(); break;
        case 'checksum': _checksum = r.readUint32(); break;
        case 'prev': _prev = r.isNull() ? (() { r.readNull(); return null; })() : IdValCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Mix09(id: _id, payload: _payload, checksum: _checksum, prev: _prev);
  },
);

class Mix10 {
  final List<String> items;
  final int total;
  final double avg;
  final Range32 value_range;
  Mix10({required this.items, required this.total, required this.avg, required this.value_range});
}

void _writeMix10(SpecWriter w, Mix10 obj) {
  w.beginObject(4);
  w.writeField('items'); w.beginArray(obj.items.length); for (final _e in obj.items) { w.nextElement(); w.writeString(_e); } w.endArray();
  w.writeField('total'); w.writeInt32(obj.total);
  w.writeField('avg'); w.writeFloat64(obj.avg);
  w.writeField('value_range'); _writeRange32(w, obj.value_range);
  w.endObject();
}

final Mix10Codec = SpecCodec<Mix10>(
  encode: (w, obj) => _writeMix10(w, obj),
  decode: (r) {
    List<String> _items = [];
    int _total = 0;
    double _avg = 0.0;
    late Range32 _value_range;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'items': _items = () { final _list = <String>[]; r.beginArray(); while (r.hasNextElement()) { _list.add(r.readString()); } r.endArray(); return _list; }(); break;
        case 'total': _total = r.readInt32(); break;
        case 'avg': _avg = r.readFloat64(); break;
        case 'value_range': _value_range = Range32Codec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Mix10(items: _items, total: _total, avg: _avg, value_range: _value_range);
  },
);

class Mix11 {
  final String name;
  final List<double> values;
  final Inner? nested;
  final bool? flag;
  Mix11({required this.name, required this.values, this.nested, this.flag});
}

void _writeMix11(SpecWriter w, Mix11 obj) {
  var _n = 2;
  if (obj.nested != null) _n++;
  if (obj.flag != null) _n++;
  w.beginObject(_n);
  w.writeField('name'); w.writeString(obj.name);
  w.writeField('values'); w.beginArray(obj.values.length); for (final _e in obj.values) { w.nextElement(); w.writeFloat64(_e); } w.endArray();
  if (obj.nested != null) { w.writeField('nested'); _writeInner(w, obj.nested!); }
  if (obj.flag != null) { w.writeField('flag'); w.writeBool(obj.flag!); }
  w.endObject();
}

final Mix11Codec = SpecCodec<Mix11>(
  encode: (w, obj) => _writeMix11(w, obj),
  decode: (r) {
    String _name = '';
    List<double> _values = [];
    Inner? _nested;
    bool? _flag;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'name': _name = r.readString(); break;
        case 'values': _values = () { final _list = <double>[]; r.beginArray(); while (r.hasNextElement()) { _list.add(r.readFloat64()); } r.endArray(); return _list; }(); break;
        case 'nested': _nested = r.isNull() ? (() { r.readNull(); return null; })() : InnerCodec.decode(r); break;
        case 'flag': _flag = r.readBool(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Mix11(name: _name, values: _values, nested: _nested, flag: _flag);
  },
);

class Mix12 {
  final String header;
  final List<IdVal> entries;
  final String? footer;
  Mix12({required this.header, required this.entries, this.footer});
}

void _writeMix12(SpecWriter w, Mix12 obj) {
  var _n = 2;
  if (obj.footer != null) _n++;
  w.beginObject(_n);
  w.writeField('header'); w.writeString(obj.header);
  w.writeField('entries'); w.beginArray(obj.entries.length); for (final _e in obj.entries) { w.nextElement(); _writeIdVal(w, _e); } w.endArray();
  if (obj.footer != null) { w.writeField('footer'); w.writeString(obj.footer!); }
  w.endObject();
}

final Mix12Codec = SpecCodec<Mix12>(
  encode: (w, obj) => _writeMix12(w, obj),
  decode: (r) {
    String _header = '';
    List<IdVal> _entries = [];
    String? _footer;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'header': _header = r.readString(); break;
        case 'entries': _entries = () { final _list = <IdVal>[]; r.beginArray(); while (r.hasNextElement()) { _list.add(IdValCodec.decode(r)); } r.endArray(); return _list; }(); break;
        case 'footer': _footer = r.readString(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Mix12(header: _header, entries: _entries, footer: _footer);
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

void _writeMix13(SpecWriter w, Mix13 obj) {
  w.beginObject(6);
  w.writeField('a'); w.writeInt32(obj.a);
  w.writeField('b'); w.writeFloat64(obj.b);
  w.writeField('c'); w.writeString(obj.c);
  w.writeField('d'); w.writeBool(obj.d);
  w.writeField('e'); w.writeBytes(obj.e);
  w.writeField('nested'); _writeInner(w, obj.nested);
  w.endObject();
}

final Mix13Codec = SpecCodec<Mix13>(
  encode: (w, obj) => _writeMix13(w, obj),
  decode: (r) {
    int _a = 0;
    double _b = 0.0;
    String _c = '';
    bool _d = false;
    Uint8List _e = Uint8List(0);
    late Inner _nested;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readInt32(); break;
        case 'b': _b = r.readFloat64(); break;
        case 'c': _c = r.readString(); break;
        case 'd': _d = r.readBool(); break;
        case 'e': _e = r.readBytes(); break;
        case 'nested': _nested = InnerCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Mix13(a: _a, b: _b, c: _c, d: _d, e: _e, nested: _nested);
  },
);

class Mix14 {
  final List<Money> amounts;
  final BigInt total;
  final String currency;
  Mix14({required this.amounts, required this.total, required this.currency});
}

void _writeMix14(SpecWriter w, Mix14 obj) {
  w.beginObject(3);
  w.writeField('amounts'); w.beginArray(obj.amounts.length); for (final _e in obj.amounts) { w.nextElement(); _writeMoney(w, _e); } w.endArray();
  w.writeField('total'); w.writeInt64(obj.total);
  w.writeField('currency'); w.writeString(obj.currency);
  w.endObject();
}

final Mix14Codec = SpecCodec<Mix14>(
  encode: (w, obj) => _writeMix14(w, obj),
  decode: (r) {
    List<Money> _amounts = [];
    BigInt _total = BigInt.zero;
    String _currency = '';
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'amounts': _amounts = () { final _list = <Money>[]; r.beginArray(); while (r.hasNextElement()) { _list.add(MoneyCodec.decode(r)); } r.endArray(); return _list; }(); break;
        case 'total': _total = r.readInt64(); break;
        case 'currency': _currency = r.readString(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Mix14(amounts: _amounts, total: _total, currency: _currency);
  },
);

class Mix15 {
  final Addr src_addr;
  final Addr dst_addr;
  final double distance;
  final double duration;
  Mix15({required this.src_addr, required this.dst_addr, required this.distance, required this.duration});
}

void _writeMix15(SpecWriter w, Mix15 obj) {
  w.beginObject(4);
  w.writeField('src_addr'); _writeAddr(w, obj.src_addr);
  w.writeField('dst_addr'); _writeAddr(w, obj.dst_addr);
  w.writeField('distance'); w.writeFloat64(obj.distance);
  w.writeField('duration'); w.writeFloat64(obj.duration);
  w.endObject();
}

final Mix15Codec = SpecCodec<Mix15>(
  encode: (w, obj) => _writeMix15(w, obj),
  decode: (r) {
    late Addr _src_addr;
    late Addr _dst_addr;
    double _distance = 0.0;
    double _duration = 0.0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'src_addr': _src_addr = AddrCodec.decode(r); break;
        case 'dst_addr': _dst_addr = AddrCodec.decode(r); break;
        case 'distance': _distance = r.readFloat64(); break;
        case 'duration': _duration = r.readFloat64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Mix15(src_addr: _src_addr, dst_addr: _dst_addr, distance: _distance, duration: _duration);
  },
);

class AllOpt1 {
  final String? a;
  final int? b;
  final bool? c;
  AllOpt1({this.a, this.b, this.c});
}

void _writeAllOpt1(SpecWriter w, AllOpt1 obj) {
  var _n = 0;
  if (obj.a != null) _n++;
  if (obj.b != null) _n++;
  if (obj.c != null) _n++;
  w.beginObject(_n);
  if (obj.a != null) { w.writeField('a'); w.writeString(obj.a!); }
  if (obj.b != null) { w.writeField('b'); w.writeInt32(obj.b!); }
  if (obj.c != null) { w.writeField('c'); w.writeBool(obj.c!); }
  w.endObject();
}

final AllOpt1Codec = SpecCodec<AllOpt1>(
  encode: (w, obj) => _writeAllOpt1(w, obj),
  decode: (r) {
    String? _a;
    int? _b;
    bool? _c;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readString(); break;
        case 'b': _b = r.readInt32(); break;
        case 'c': _c = r.readBool(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return AllOpt1(a: _a, b: _b, c: _c);
  },
);

class AllOpt2 {
  final double? x;
  final Uint8List? y;
  final BigInt? z;
  AllOpt2({this.x, this.y, this.z});
}

void _writeAllOpt2(SpecWriter w, AllOpt2 obj) {
  var _n = 0;
  if (obj.x != null) _n++;
  if (obj.y != null) _n++;
  if (obj.z != null) _n++;
  w.beginObject(_n);
  if (obj.x != null) { w.writeField('x'); w.writeFloat64(obj.x!); }
  if (obj.y != null) { w.writeField('y'); w.writeBytes(obj.y!); }
  if (obj.z != null) { w.writeField('z'); w.writeInt64(obj.z!); }
  w.endObject();
}

final AllOpt2Codec = SpecCodec<AllOpt2>(
  encode: (w, obj) => _writeAllOpt2(w, obj),
  decode: (r) {
    double? _x;
    Uint8List? _y;
    BigInt? _z;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'x': _x = r.readFloat64(); break;
        case 'y': _y = r.readBytes(); break;
        case 'z': _z = r.readInt64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return AllOpt2(x: _x, y: _y, z: _z);
  },
);

class AllOpt3 {
  final String? name;
  final int? age;
  final double? score;
  final bool? active;
  AllOpt3({this.name, this.age, this.score, this.active});
}

void _writeAllOpt3(SpecWriter w, AllOpt3 obj) {
  var _n = 0;
  if (obj.name != null) _n++;
  if (obj.age != null) _n++;
  if (obj.score != null) _n++;
  if (obj.active != null) _n++;
  w.beginObject(_n);
  if (obj.name != null) { w.writeField('name'); w.writeString(obj.name!); }
  if (obj.age != null) { w.writeField('age'); w.writeInt32(obj.age!); }
  if (obj.score != null) { w.writeField('score'); w.writeFloat64(obj.score!); }
  if (obj.active != null) { w.writeField('active'); w.writeBool(obj.active!); }
  w.endObject();
}

final AllOpt3Codec = SpecCodec<AllOpt3>(
  encode: (w, obj) => _writeAllOpt3(w, obj),
  decode: (r) {
    String? _name;
    int? _age;
    double? _score;
    bool? _active;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'name': _name = r.readString(); break;
        case 'age': _age = r.readInt32(); break;
        case 'score': _score = r.readFloat64(); break;
        case 'active': _active = r.readBool(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return AllOpt3(name: _name, age: _age, score: _score, active: _active);
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

void _writeAllOpt4(SpecWriter w, AllOpt4 obj) {
  var _n = 0;
  if (obj.a != null) _n++;
  if (obj.b != null) _n++;
  if (obj.c != null) _n++;
  if (obj.d != null) _n++;
  if (obj.e != null) _n++;
  w.beginObject(_n);
  if (obj.a != null) { w.writeField('a'); w.writeUint32(obj.a!); }
  if (obj.b != null) { w.writeField('b'); w.writeUint64(obj.b!); }
  if (obj.c != null) { w.writeField('c'); w.writeInt32(obj.c!); }
  if (obj.d != null) { w.writeField('d'); w.writeString(obj.d!); }
  if (obj.e != null) { w.writeField('e'); w.writeBytes(obj.e!); }
  w.endObject();
}

final AllOpt4Codec = SpecCodec<AllOpt4>(
  encode: (w, obj) => _writeAllOpt4(w, obj),
  decode: (r) {
    int? _a;
    BigInt? _b;
    int? _c;
    String? _d;
    Uint8List? _e;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readUint32(); break;
        case 'b': _b = r.readUint64(); break;
        case 'c': _c = r.readInt32(); break;
        case 'd': _d = r.readString(); break;
        case 'e': _e = r.readBytes(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return AllOpt4(a: _a, b: _b, c: _c, d: _d, e: _e);
  },
);

class AllOpt5 {
  final Inner? p;
  final String? q;
  AllOpt5({this.p, this.q});
}

void _writeAllOpt5(SpecWriter w, AllOpt5 obj) {
  var _n = 0;
  if (obj.p != null) _n++;
  if (obj.q != null) _n++;
  w.beginObject(_n);
  if (obj.p != null) { w.writeField('p'); _writeInner(w, obj.p!); }
  if (obj.q != null) { w.writeField('q'); w.writeString(obj.q!); }
  w.endObject();
}

final AllOpt5Codec = SpecCodec<AllOpt5>(
  encode: (w, obj) => _writeAllOpt5(w, obj),
  decode: (r) {
    Inner? _p;
    String? _q;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'p': _p = r.isNull() ? (() { r.readNull(); return null; })() : InnerCodec.decode(r); break;
        case 'q': _q = r.readString(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return AllOpt5(p: _p, q: _q);
  },
);

class RecList {
  final int value;
  final RecList? next;
  RecList({required this.value, this.next});
}

void _writeRecList(SpecWriter w, RecList obj) {
  var _n = 1;
  if (obj.next != null) _n++;
  w.beginObject(_n);
  w.writeField('value'); w.writeInt32(obj.value);
  if (obj.next != null) { w.writeField('next'); _writeRecList(w, obj.next!); }
  w.endObject();
}

final SpecCodec<RecList> RecListCodec = SpecCodec<RecList>(
  encode: (w, obj) => _writeRecList(w, obj),
  decode: (r) {
    int _value = 0;
    RecList? _next;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'value': _value = r.readInt32(); break;
        case 'next': _next = r.isNull() ? (() { r.readNull(); return null; })() : RecListCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return RecList(value: _value, next: _next);
  },
);

class RecTree {
  final String value;
  final RecTree? left_node;
  final RecTree? right_node;
  RecTree({required this.value, this.left_node, this.right_node});
}

void _writeRecTree(SpecWriter w, RecTree obj) {
  var _n = 1;
  if (obj.left_node != null) _n++;
  if (obj.right_node != null) _n++;
  w.beginObject(_n);
  w.writeField('value'); w.writeString(obj.value);
  if (obj.left_node != null) { w.writeField('left_node'); _writeRecTree(w, obj.left_node!); }
  if (obj.right_node != null) { w.writeField('right_node'); _writeRecTree(w, obj.right_node!); }
  w.endObject();
}

final SpecCodec<RecTree> RecTreeCodec = SpecCodec<RecTree>(
  encode: (w, obj) => _writeRecTree(w, obj),
  decode: (r) {
    String _value = '';
    RecTree? _left_node;
    RecTree? _right_node;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'value': _value = r.readString(); break;
        case 'left_node': _left_node = r.isNull() ? (() { r.readNull(); return null; })() : RecTreeCodec.decode(r); break;
        case 'right_node': _right_node = r.isNull() ? (() { r.readNull(); return null; })() : RecTreeCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return RecTree(value: _value, left_node: _left_node, right_node: _right_node);
  },
);

class RecChain {
  final int id;
  final String label;
  final RecChain? next;
  RecChain({required this.id, required this.label, this.next});
}

void _writeRecChain(SpecWriter w, RecChain obj) {
  var _n = 2;
  if (obj.next != null) _n++;
  w.beginObject(_n);
  w.writeField('id'); w.writeInt32(obj.id);
  w.writeField('label'); w.writeString(obj.label);
  if (obj.next != null) { w.writeField('next'); _writeRecChain(w, obj.next!); }
  w.endObject();
}

final SpecCodec<RecChain> RecChainCodec = SpecCodec<RecChain>(
  encode: (w, obj) => _writeRecChain(w, obj),
  decode: (r) {
    int _id = 0;
    String _label = '';
    RecChain? _next;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'id': _id = r.readInt32(); break;
        case 'label': _label = r.readString(); break;
        case 'next': _next = r.isNull() ? (() { r.readNull(); return null; })() : RecChainCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return RecChain(id: _id, label: _label, next: _next);
  },
);

class RecWrap {
  final Uint8List payload;
  final RecWrap? nested;
  RecWrap({required this.payload, this.nested});
}

void _writeRecWrap(SpecWriter w, RecWrap obj) {
  var _n = 1;
  if (obj.nested != null) _n++;
  w.beginObject(_n);
  w.writeField('payload'); w.writeBytes(obj.payload);
  if (obj.nested != null) { w.writeField('nested'); _writeRecWrap(w, obj.nested!); }
  w.endObject();
}

final SpecCodec<RecWrap> RecWrapCodec = SpecCodec<RecWrap>(
  encode: (w, obj) => _writeRecWrap(w, obj),
  decode: (r) {
    Uint8List _payload = Uint8List(0);
    RecWrap? _nested;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'payload': _payload = r.readBytes(); break;
        case 'nested': _nested = r.isNull() ? (() { r.readNull(); return null; })() : RecWrapCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return RecWrap(payload: _payload, nested: _nested);
  },
);

class RecWide {
  final int a;
  final String b;
  final double c;
  final RecWide? child;
  RecWide({required this.a, required this.b, required this.c, this.child});
}

void _writeRecWide(SpecWriter w, RecWide obj) {
  var _n = 3;
  if (obj.child != null) _n++;
  w.beginObject(_n);
  w.writeField('a'); w.writeInt32(obj.a);
  w.writeField('b'); w.writeString(obj.b);
  w.writeField('c'); w.writeFloat64(obj.c);
  if (obj.child != null) { w.writeField('child'); _writeRecWide(w, obj.child!); }
  w.endObject();
}

final SpecCodec<RecWide> RecWideCodec = SpecCodec<RecWide>(
  encode: (w, obj) => _writeRecWide(w, obj),
  decode: (r) {
    int _a = 0;
    String _b = '';
    double _c = 0.0;
    RecWide? _child;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readInt32(); break;
        case 'b': _b = r.readString(); break;
        case 'c': _c = r.readFloat64(); break;
        case 'child': _child = r.isNull() ? (() { r.readNull(); return null; })() : RecWideCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return RecWide(a: _a, b: _b, c: _c, child: _child);
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

void _writeWide20(SpecWriter w, Wide20 obj) {
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

final Wide20Codec = SpecCodec<Wide20>(
  encode: (w, obj) => _writeWide20(w, obj),
  decode: (r) {
    String _f1 = '';
    bool _f2 = false;
    int _f3 = 0;
    int _f4 = 0;
    int _f5 = 0;
    BigInt _f6 = BigInt.zero;
    int _f7 = 0;
    int _f8 = 0;
    int _f9 = 0;
    BigInt _f10 = BigInt.zero;
    double _f11 = 0.0;
    double _f12 = 0.0;
    Uint8List _f13 = Uint8List(0);
    String _f14 = '';
    bool _f15 = false;
    int _f16 = 0;
    int _f17 = 0;
    int _f18 = 0;
    BigInt _f19 = BigInt.zero;
    int _f20 = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'f1': _f1 = r.readString(); break;
        case 'f2': _f2 = r.readBool(); break;
        case 'f3': _f3 = r.readInt32(); break;
        case 'f4': _f4 = r.readInt32(); break;
        case 'f5': _f5 = r.readInt32(); break;
        case 'f6': _f6 = r.readInt64(); break;
        case 'f7': _f7 = r.readUint32(); break;
        case 'f8': _f8 = r.readUint32(); break;
        case 'f9': _f9 = r.readUint32(); break;
        case 'f10': _f10 = r.readUint64(); break;
        case 'f11': _f11 = r.readFloat32(); break;
        case 'f12': _f12 = r.readFloat64(); break;
        case 'f13': _f13 = r.readBytes(); break;
        case 'f14': _f14 = r.readString(); break;
        case 'f15': _f15 = r.readBool(); break;
        case 'f16': _f16 = r.readInt32(); break;
        case 'f17': _f17 = r.readInt32(); break;
        case 'f18': _f18 = r.readInt32(); break;
        case 'f19': _f19 = r.readInt64(); break;
        case 'f20': _f20 = r.readUint32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Wide20(f1: _f1, f2: _f2, f3: _f3, f4: _f4, f5: _f5, f6: _f6, f7: _f7, f8: _f8, f9: _f9, f10: _f10, f11: _f11, f12: _f12, f13: _f13, f14: _f14, f15: _f15, f16: _f16, f17: _f17, f18: _f18, f19: _f19, f20: _f20);
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

void _writeWide25(SpecWriter w, Wide25 obj) {
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

final Wide25Codec = SpecCodec<Wide25>(
  encode: (w, obj) => _writeWide25(w, obj),
  decode: (r) {
    int _f1 = 0;
    int _f2 = 0;
    BigInt _f3 = BigInt.zero;
    double _f4 = 0.0;
    double _f5 = 0.0;
    Uint8List _f6 = Uint8List(0);
    String _f7 = '';
    bool _f8 = false;
    int _f9 = 0;
    int _f10 = 0;
    int _f11 = 0;
    BigInt _f12 = BigInt.zero;
    int _f13 = 0;
    int _f14 = 0;
    int _f15 = 0;
    BigInt _f16 = BigInt.zero;
    double _f17 = 0.0;
    double _f18 = 0.0;
    Uint8List _f19 = Uint8List(0);
    String _f20 = '';
    bool _f21 = false;
    int _f22 = 0;
    int _f23 = 0;
    int _f24 = 0;
    BigInt _f25 = BigInt.zero;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'f1': _f1 = r.readUint32(); break;
        case 'f2': _f2 = r.readUint32(); break;
        case 'f3': _f3 = r.readUint64(); break;
        case 'f4': _f4 = r.readFloat32(); break;
        case 'f5': _f5 = r.readFloat64(); break;
        case 'f6': _f6 = r.readBytes(); break;
        case 'f7': _f7 = r.readString(); break;
        case 'f8': _f8 = r.readBool(); break;
        case 'f9': _f9 = r.readInt32(); break;
        case 'f10': _f10 = r.readInt32(); break;
        case 'f11': _f11 = r.readInt32(); break;
        case 'f12': _f12 = r.readInt64(); break;
        case 'f13': _f13 = r.readUint32(); break;
        case 'f14': _f14 = r.readUint32(); break;
        case 'f15': _f15 = r.readUint32(); break;
        case 'f16': _f16 = r.readUint64(); break;
        case 'f17': _f17 = r.readFloat32(); break;
        case 'f18': _f18 = r.readFloat64(); break;
        case 'f19': _f19 = r.readBytes(); break;
        case 'f20': _f20 = r.readString(); break;
        case 'f21': _f21 = r.readBool(); break;
        case 'f22': _f22 = r.readInt32(); break;
        case 'f23': _f23 = r.readInt32(); break;
        case 'f24': _f24 = r.readInt32(); break;
        case 'f25': _f25 = r.readInt64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Wide25(f1: _f1, f2: _f2, f3: _f3, f4: _f4, f5: _f5, f6: _f6, f7: _f7, f8: _f8, f9: _f9, f10: _f10, f11: _f11, f12: _f12, f13: _f13, f14: _f14, f15: _f15, f16: _f16, f17: _f17, f18: _f18, f19: _f19, f20: _f20, f21: _f21, f22: _f22, f23: _f23, f24: _f24, f25: _f25);
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

void _writeWide30(SpecWriter w, Wide30 obj) {
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

final Wide30Codec = SpecCodec<Wide30>(
  encode: (w, obj) => _writeWide30(w, obj),
  decode: (r) {
    bool _f1 = false;
    int _f2 = 0;
    int _f3 = 0;
    int _f4 = 0;
    BigInt _f5 = BigInt.zero;
    int _f6 = 0;
    int _f7 = 0;
    int _f8 = 0;
    BigInt _f9 = BigInt.zero;
    double _f10 = 0.0;
    double _f11 = 0.0;
    Uint8List _f12 = Uint8List(0);
    String _f13 = '';
    bool _f14 = false;
    int _f15 = 0;
    int _f16 = 0;
    int _f17 = 0;
    BigInt _f18 = BigInt.zero;
    int _f19 = 0;
    int _f20 = 0;
    int _f21 = 0;
    BigInt _f22 = BigInt.zero;
    double _f23 = 0.0;
    double _f24 = 0.0;
    Uint8List _f25 = Uint8List(0);
    String _f26 = '';
    bool _f27 = false;
    int _f28 = 0;
    int _f29 = 0;
    int _f30 = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'f1': _f1 = r.readBool(); break;
        case 'f2': _f2 = r.readInt32(); break;
        case 'f3': _f3 = r.readInt32(); break;
        case 'f4': _f4 = r.readInt32(); break;
        case 'f5': _f5 = r.readInt64(); break;
        case 'f6': _f6 = r.readUint32(); break;
        case 'f7': _f7 = r.readUint32(); break;
        case 'f8': _f8 = r.readUint32(); break;
        case 'f9': _f9 = r.readUint64(); break;
        case 'f10': _f10 = r.readFloat32(); break;
        case 'f11': _f11 = r.readFloat64(); break;
        case 'f12': _f12 = r.readBytes(); break;
        case 'f13': _f13 = r.readString(); break;
        case 'f14': _f14 = r.readBool(); break;
        case 'f15': _f15 = r.readInt32(); break;
        case 'f16': _f16 = r.readInt32(); break;
        case 'f17': _f17 = r.readInt32(); break;
        case 'f18': _f18 = r.readInt64(); break;
        case 'f19': _f19 = r.readUint32(); break;
        case 'f20': _f20 = r.readUint32(); break;
        case 'f21': _f21 = r.readUint32(); break;
        case 'f22': _f22 = r.readUint64(); break;
        case 'f23': _f23 = r.readFloat32(); break;
        case 'f24': _f24 = r.readFloat64(); break;
        case 'f25': _f25 = r.readBytes(); break;
        case 'f26': _f26 = r.readString(); break;
        case 'f27': _f27 = r.readBool(); break;
        case 'f28': _f28 = r.readInt32(); break;
        case 'f29': _f29 = r.readInt32(); break;
        case 'f30': _f30 = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Wide30(f1: _f1, f2: _f2, f3: _f3, f4: _f4, f5: _f5, f6: _f6, f7: _f7, f8: _f8, f9: _f9, f10: _f10, f11: _f11, f12: _f12, f13: _f13, f14: _f14, f15: _f15, f16: _f16, f17: _f17, f18: _f18, f19: _f19, f20: _f20, f21: _f21, f22: _f22, f23: _f23, f24: _f24, f25: _f25, f26: _f26, f27: _f27, f28: _f28, f29: _f29, f30: _f30);
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

void _writeWide35(SpecWriter w, Wide35 obj) {
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

final Wide35Codec = SpecCodec<Wide35>(
  encode: (w, obj) => _writeWide35(w, obj),
  decode: (r) {
    int _f1 = 0;
    BigInt _f2 = BigInt.zero;
    double _f3 = 0.0;
    double _f4 = 0.0;
    Uint8List _f5 = Uint8List(0);
    String _f6 = '';
    bool _f7 = false;
    int _f8 = 0;
    int _f9 = 0;
    int _f10 = 0;
    BigInt _f11 = BigInt.zero;
    int _f12 = 0;
    int _f13 = 0;
    int _f14 = 0;
    BigInt _f15 = BigInt.zero;
    double _f16 = 0.0;
    double _f17 = 0.0;
    Uint8List _f18 = Uint8List(0);
    String _f19 = '';
    bool _f20 = false;
    int _f21 = 0;
    int _f22 = 0;
    int _f23 = 0;
    BigInt _f24 = BigInt.zero;
    int _f25 = 0;
    int _f26 = 0;
    int _f27 = 0;
    BigInt _f28 = BigInt.zero;
    double _f29 = 0.0;
    double _f30 = 0.0;
    Uint8List _f31 = Uint8List(0);
    String _f32 = '';
    bool _f33 = false;
    int _f34 = 0;
    int _f35 = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'f1': _f1 = r.readUint32(); break;
        case 'f2': _f2 = r.readUint64(); break;
        case 'f3': _f3 = r.readFloat32(); break;
        case 'f4': _f4 = r.readFloat64(); break;
        case 'f5': _f5 = r.readBytes(); break;
        case 'f6': _f6 = r.readString(); break;
        case 'f7': _f7 = r.readBool(); break;
        case 'f8': _f8 = r.readInt32(); break;
        case 'f9': _f9 = r.readInt32(); break;
        case 'f10': _f10 = r.readInt32(); break;
        case 'f11': _f11 = r.readInt64(); break;
        case 'f12': _f12 = r.readUint32(); break;
        case 'f13': _f13 = r.readUint32(); break;
        case 'f14': _f14 = r.readUint32(); break;
        case 'f15': _f15 = r.readUint64(); break;
        case 'f16': _f16 = r.readFloat32(); break;
        case 'f17': _f17 = r.readFloat64(); break;
        case 'f18': _f18 = r.readBytes(); break;
        case 'f19': _f19 = r.readString(); break;
        case 'f20': _f20 = r.readBool(); break;
        case 'f21': _f21 = r.readInt32(); break;
        case 'f22': _f22 = r.readInt32(); break;
        case 'f23': _f23 = r.readInt32(); break;
        case 'f24': _f24 = r.readInt64(); break;
        case 'f25': _f25 = r.readUint32(); break;
        case 'f26': _f26 = r.readUint32(); break;
        case 'f27': _f27 = r.readUint32(); break;
        case 'f28': _f28 = r.readUint64(); break;
        case 'f29': _f29 = r.readFloat32(); break;
        case 'f30': _f30 = r.readFloat64(); break;
        case 'f31': _f31 = r.readBytes(); break;
        case 'f32': _f32 = r.readString(); break;
        case 'f33': _f33 = r.readBool(); break;
        case 'f34': _f34 = r.readInt32(); break;
        case 'f35': _f35 = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Wide35(f1: _f1, f2: _f2, f3: _f3, f4: _f4, f5: _f5, f6: _f6, f7: _f7, f8: _f8, f9: _f9, f10: _f10, f11: _f11, f12: _f12, f13: _f13, f14: _f14, f15: _f15, f16: _f16, f17: _f17, f18: _f18, f19: _f19, f20: _f20, f21: _f21, f22: _f22, f23: _f23, f24: _f24, f25: _f25, f26: _f26, f27: _f27, f28: _f28, f29: _f29, f30: _f30, f31: _f31, f32: _f32, f33: _f33, f34: _f34, f35: _f35);
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

void _writeWide40(SpecWriter w, Wide40 obj) {
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

final Wide40Codec = SpecCodec<Wide40>(
  encode: (w, obj) => _writeWide40(w, obj),
  decode: (r) {
    int _f1 = 0;
    int _f2 = 0;
    int _f3 = 0;
    BigInt _f4 = BigInt.zero;
    int _f5 = 0;
    int _f6 = 0;
    int _f7 = 0;
    BigInt _f8 = BigInt.zero;
    double _f9 = 0.0;
    double _f10 = 0.0;
    Uint8List _f11 = Uint8List(0);
    String _f12 = '';
    bool _f13 = false;
    int _f14 = 0;
    int _f15 = 0;
    int _f16 = 0;
    BigInt _f17 = BigInt.zero;
    int _f18 = 0;
    int _f19 = 0;
    int _f20 = 0;
    BigInt _f21 = BigInt.zero;
    double _f22 = 0.0;
    double _f23 = 0.0;
    Uint8List _f24 = Uint8List(0);
    String _f25 = '';
    bool _f26 = false;
    int _f27 = 0;
    int _f28 = 0;
    int _f29 = 0;
    BigInt _f30 = BigInt.zero;
    int _f31 = 0;
    int _f32 = 0;
    int _f33 = 0;
    BigInt _f34 = BigInt.zero;
    double _f35 = 0.0;
    double _f36 = 0.0;
    Uint8List _f37 = Uint8List(0);
    String _f38 = '';
    bool _f39 = false;
    int _f40 = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'f1': _f1 = r.readInt32(); break;
        case 'f2': _f2 = r.readInt32(); break;
        case 'f3': _f3 = r.readInt32(); break;
        case 'f4': _f4 = r.readInt64(); break;
        case 'f5': _f5 = r.readUint32(); break;
        case 'f6': _f6 = r.readUint32(); break;
        case 'f7': _f7 = r.readUint32(); break;
        case 'f8': _f8 = r.readUint64(); break;
        case 'f9': _f9 = r.readFloat32(); break;
        case 'f10': _f10 = r.readFloat64(); break;
        case 'f11': _f11 = r.readBytes(); break;
        case 'f12': _f12 = r.readString(); break;
        case 'f13': _f13 = r.readBool(); break;
        case 'f14': _f14 = r.readInt32(); break;
        case 'f15': _f15 = r.readInt32(); break;
        case 'f16': _f16 = r.readInt32(); break;
        case 'f17': _f17 = r.readInt64(); break;
        case 'f18': _f18 = r.readUint32(); break;
        case 'f19': _f19 = r.readUint32(); break;
        case 'f20': _f20 = r.readUint32(); break;
        case 'f21': _f21 = r.readUint64(); break;
        case 'f22': _f22 = r.readFloat32(); break;
        case 'f23': _f23 = r.readFloat64(); break;
        case 'f24': _f24 = r.readBytes(); break;
        case 'f25': _f25 = r.readString(); break;
        case 'f26': _f26 = r.readBool(); break;
        case 'f27': _f27 = r.readInt32(); break;
        case 'f28': _f28 = r.readInt32(); break;
        case 'f29': _f29 = r.readInt32(); break;
        case 'f30': _f30 = r.readInt64(); break;
        case 'f31': _f31 = r.readUint32(); break;
        case 'f32': _f32 = r.readUint32(); break;
        case 'f33': _f33 = r.readUint32(); break;
        case 'f34': _f34 = r.readUint64(); break;
        case 'f35': _f35 = r.readFloat32(); break;
        case 'f36': _f36 = r.readFloat64(); break;
        case 'f37': _f37 = r.readBytes(); break;
        case 'f38': _f38 = r.readString(); break;
        case 'f39': _f39 = r.readBool(); break;
        case 'f40': _f40 = r.readInt32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return Wide40(f1: _f1, f2: _f2, f3: _f3, f4: _f4, f5: _f5, f6: _f6, f7: _f7, f8: _f8, f9: _f9, f10: _f10, f11: _f11, f12: _f12, f13: _f13, f14: _f14, f15: _f15, f16: _f16, f17: _f17, f18: _f18, f19: _f19, f20: _f20, f21: _f21, f22: _f22, f23: _f23, f24: _f24, f25: _f25, f26: _f26, f27: _f27, f28: _f28, f29: _f29, f30: _f30, f31: _f31, f32: _f32, f33: _f33, f34: _f34, f35: _f35, f36: _f36, f37: _f37, f38: _f38, f39: _f39, f40: _f40);
  },
);

class EdgeEmpty {
  EdgeEmpty();
}

void _writeEdgeEmpty(SpecWriter w, EdgeEmpty obj) {
  w.beginObject(0);
  w.endObject();
}

final EdgeEmptyCodec = SpecCodec<EdgeEmpty>(
  encode: (w, obj) => _writeEdgeEmpty(w, obj),
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

void _writeEdgeOneOpt(SpecWriter w, EdgeOneOpt obj) {
  var _n = 0;
  if (obj.maybe != null) _n++;
  w.beginObject(_n);
  if (obj.maybe != null) { w.writeField('maybe'); w.writeString(obj.maybe!); }
  w.endObject();
}

final EdgeOneOptCodec = SpecCodec<EdgeOneOpt>(
  encode: (w, obj) => _writeEdgeOneOpt(w, obj),
  decode: (r) {
    String? _maybe;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'maybe': _maybe = r.readString(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return EdgeOneOpt(maybe: _maybe);
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

void _writeEdgeBigNums(SpecWriter w, EdgeBigNums obj) {
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

final EdgeBigNumsCodec = SpecCodec<EdgeBigNums>(
  encode: (w, obj) => _writeEdgeBigNums(w, obj),
  decode: (r) {
    int _i8 = 0;
    int _i16 = 0;
    int _i32 = 0;
    BigInt _i64 = BigInt.zero;
    int _u8 = 0;
    int _u16 = 0;
    int _u32 = 0;
    BigInt _u64 = BigInt.zero;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'i8': _i8 = r.readInt32(); break;
        case 'i16': _i16 = r.readInt32(); break;
        case 'i32': _i32 = r.readInt32(); break;
        case 'i64': _i64 = r.readInt64(); break;
        case 'u8': _u8 = r.readUint32(); break;
        case 'u16': _u16 = r.readUint32(); break;
        case 'u32': _u32 = r.readUint32(); break;
        case 'u64': _u64 = r.readUint64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return EdgeBigNums(i8: _i8, i16: _i16, i32: _i32, i64: _i64, u8: _u8, u16: _u16, u32: _u32, u64: _u64);
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

void _writeEdgeZeroVals(SpecWriter w, EdgeZeroVals obj) {
  w.beginObject(5);
  w.writeField('s'); w.writeString(obj.s);
  w.writeField('i'); w.writeInt32(obj.i);
  w.writeField('f'); w.writeFloat64(obj.f);
  w.writeField('b'); w.writeBool(obj.b);
  w.writeField('by_field'); w.writeBytes(obj.by_field);
  w.endObject();
}

final EdgeZeroValsCodec = SpecCodec<EdgeZeroVals>(
  encode: (w, obj) => _writeEdgeZeroVals(w, obj),
  decode: (r) {
    String _s = '';
    int _i = 0;
    double _f = 0.0;
    bool _b = false;
    Uint8List _by_field = Uint8List(0);
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 's': _s = r.readString(); break;
        case 'i': _i = r.readInt32(); break;
        case 'f': _f = r.readFloat64(); break;
        case 'b': _b = r.readBool(); break;
        case 'by_field': _by_field = r.readBytes(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return EdgeZeroVals(s: _s, i: _i, f: _f, b: _b, by_field: _by_field);
  },
);

class EdgeNullable {
  final String? a;
  final int? b;
  final Inner? c;
  final List<String>? d;
  EdgeNullable({this.a, this.b, this.c, this.d});
}

void _writeEdgeNullable(SpecWriter w, EdgeNullable obj) {
  var _n = 0;
  if (obj.a != null) _n++;
  if (obj.b != null) _n++;
  if (obj.c != null) _n++;
  if (obj.d != null) _n++;
  w.beginObject(_n);
  if (obj.a != null) { w.writeField('a'); w.writeString(obj.a!); }
  if (obj.b != null) { w.writeField('b'); w.writeInt32(obj.b!); }
  if (obj.c != null) { w.writeField('c'); _writeInner(w, obj.c!); }
  if (obj.d != null) { w.writeField('d'); w.beginArray(obj.d!.length); for (final _e in obj.d!) { w.nextElement(); w.writeString(_e); } w.endArray(); }
  w.endObject();
}

final EdgeNullableCodec = SpecCodec<EdgeNullable>(
  encode: (w, obj) => _writeEdgeNullable(w, obj),
  decode: (r) {
    String? _a;
    int? _b;
    Inner? _c;
    List<String>? _d;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.readString(); break;
        case 'b': _b = r.readInt32(); break;
        case 'c': _c = r.isNull() ? (() { r.readNull(); return null; })() : InnerCodec.decode(r); break;
        case 'd': _d = () { final _list = <String>[]; r.beginArray(); while (r.hasNextElement()) { _list.add(r.readString()); } r.endArray(); return _list; }(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return EdgeNullable(a: _a, b: _b, c: _c, d: _d);
  },
);

class EdgeNegZero {
  final double v;
  EdgeNegZero({required this.v});
}

void _writeEdgeNegZero(SpecWriter w, EdgeNegZero obj) {
  w.beginObject(1);
  w.writeField('v'); w.writeFloat64(obj.v);
  w.endObject();
}

final EdgeNegZeroCodec = SpecCodec<EdgeNegZero>(
  encode: (w, obj) => _writeEdgeNegZero(w, obj),
  decode: (r) {
    double _v = 0.0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'v': _v = r.readFloat64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return EdgeNegZero(v: _v);
  },
);

class EdgeNullByte {
  final String s;
  final Uint8List b;
  EdgeNullByte({required this.s, required this.b});
}

void _writeEdgeNullByte(SpecWriter w, EdgeNullByte obj) {
  w.beginObject(2);
  w.writeField('s'); w.writeString(obj.s);
  w.writeField('b'); w.writeBytes(obj.b);
  w.endObject();
}

final EdgeNullByteCodec = SpecCodec<EdgeNullByte>(
  encode: (w, obj) => _writeEdgeNullByte(w, obj),
  decode: (r) {
    String _s = '';
    Uint8List _b = Uint8List(0);
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 's': _s = r.readString(); break;
        case 'b': _b = r.readBytes(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return EdgeNullByte(s: _s, b: _b);
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

void _writeEdgeBoundary(SpecWriter w, EdgeBoundary obj) {
  w.beginObject(6);
  w.writeField('i32_neg129'); w.writeInt32(obj.i32_neg129);
  w.writeField('i32_128'); w.writeInt32(obj.i32_128);
  w.writeField('i32_256'); w.writeInt32(obj.i32_256);
  w.writeField('i32_65536'); w.writeInt32(obj.i32_65536);
  w.writeField('i32_neg32769'); w.writeInt32(obj.i32_neg32769);
  w.writeField('u32_65536'); w.writeUint32(obj.u32_65536);
  w.endObject();
}

final EdgeBoundaryCodec = SpecCodec<EdgeBoundary>(
  encode: (w, obj) => _writeEdgeBoundary(w, obj),
  decode: (r) {
    int _i32_neg129 = 0;
    int _i32_128 = 0;
    int _i32_256 = 0;
    int _i32_65536 = 0;
    int _i32_neg32769 = 0;
    int _u32_65536 = 0;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'i32_neg129': _i32_neg129 = r.readInt32(); break;
        case 'i32_128': _i32_128 = r.readInt32(); break;
        case 'i32_256': _i32_256 = r.readInt32(); break;
        case 'i32_65536': _i32_65536 = r.readInt32(); break;
        case 'i32_neg32769': _i32_neg32769 = r.readInt32(); break;
        case 'u32_65536': _u32_65536 = r.readUint32(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return EdgeBoundary(i32_neg129: _i32_neg129, i32_128: _i32_128, i32_256: _i32_256, i32_65536: _i32_65536, i32_neg32769: _i32_neg32769, u32_65536: _u32_65536);
  },
);

class EdgeStrLen {
  final String s31;
  final String s32;
  final String s255;
  final String s256;
  EdgeStrLen({required this.s31, required this.s32, required this.s255, required this.s256});
}

void _writeEdgeStrLen(SpecWriter w, EdgeStrLen obj) {
  w.beginObject(4);
  w.writeField('s31'); w.writeString(obj.s31);
  w.writeField('s32'); w.writeString(obj.s32);
  w.writeField('s255'); w.writeString(obj.s255);
  w.writeField('s256'); w.writeString(obj.s256);
  w.endObject();
}

final EdgeStrLenCodec = SpecCodec<EdgeStrLen>(
  encode: (w, obj) => _writeEdgeStrLen(w, obj),
  decode: (r) {
    String _s31 = '';
    String _s32 = '';
    String _s255 = '';
    String _s256 = '';
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 's31': _s31 = r.readString(); break;
        case 's32': _s32 = r.readString(); break;
        case 's255': _s255 = r.readString(); break;
        case 's256': _s256 = r.readString(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return EdgeStrLen(s31: _s31, s32: _s32, s255: _s255, s256: _s256);
  },
);

class EdgeBytesLen {
  final Uint8List b31;
  final Uint8List b32;
  final Uint8List b255;
  final Uint8List b256;
  EdgeBytesLen({required this.b31, required this.b32, required this.b255, required this.b256});
}

void _writeEdgeBytesLen(SpecWriter w, EdgeBytesLen obj) {
  w.beginObject(4);
  w.writeField('b31'); w.writeBytes(obj.b31);
  w.writeField('b32'); w.writeBytes(obj.b32);
  w.writeField('b255'); w.writeBytes(obj.b255);
  w.writeField('b256'); w.writeBytes(obj.b256);
  w.endObject();
}

final EdgeBytesLenCodec = SpecCodec<EdgeBytesLen>(
  encode: (w, obj) => _writeEdgeBytesLen(w, obj),
  decode: (r) {
    Uint8List _b31 = Uint8List(0);
    Uint8List _b32 = Uint8List(0);
    Uint8List _b255 = Uint8List(0);
    Uint8List _b256 = Uint8List(0);
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'b31': _b31 = r.readBytes(); break;
        case 'b32': _b32 = r.readBytes(); break;
        case 'b255': _b255 = r.readBytes(); break;
        case 'b256': _b256 = r.readBytes(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return EdgeBytesLen(b31: _b31, b32: _b32, b255: _b255, b256: _b256);
  },
);

class EdgeArrEmpty {
  final List<String> items;
  EdgeArrEmpty({required this.items});
}

void _writeEdgeArrEmpty(SpecWriter w, EdgeArrEmpty obj) {
  w.beginObject(1);
  w.writeField('items'); w.beginArray(obj.items.length); for (final _e in obj.items) { w.nextElement(); w.writeString(_e); } w.endArray();
  w.endObject();
}

final EdgeArrEmptyCodec = SpecCodec<EdgeArrEmpty>(
  encode: (w, obj) => _writeEdgeArrEmpty(w, obj),
  decode: (r) {
    List<String> _items = [];
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'items': _items = () { final _list = <String>[]; r.beginArray(); while (r.hasNextElement()) { _list.add(r.readString()); } r.endArray(); return _list; }(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return EdgeArrEmpty(items: _items);
  },
);

class EdgeArrBoundary {
  final List<int> a15;
  final List<int> a16;
  EdgeArrBoundary({required this.a15, required this.a16});
}

void _writeEdgeArrBoundary(SpecWriter w, EdgeArrBoundary obj) {
  w.beginObject(2);
  w.writeField('a15'); w.beginArray(obj.a15.length); for (final _e in obj.a15) { w.nextElement(); w.writeInt32(_e); } w.endArray();
  w.writeField('a16'); w.beginArray(obj.a16.length); for (final _e in obj.a16) { w.nextElement(); w.writeInt32(_e); } w.endArray();
  w.endObject();
}

final EdgeArrBoundaryCodec = SpecCodec<EdgeArrBoundary>(
  encode: (w, obj) => _writeEdgeArrBoundary(w, obj),
  decode: (r) {
    List<int> _a15 = [];
    List<int> _a16 = [];
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a15': _a15 = () { final _list = <int>[]; r.beginArray(); while (r.hasNextElement()) { _list.add(r.readInt32()); } r.endArray(); return _list; }(); break;
        case 'a16': _a16 = () { final _list = <int>[]; r.beginArray(); while (r.hasNextElement()) { _list.add(r.readInt32()); } r.endArray(); return _list; }(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return EdgeArrBoundary(a15: _a15, a16: _a16);
  },
);

class OptArr1 {
  final String req;
  final List<int>? items;
  OptArr1({required this.req, this.items});
}

void _writeOptArr1(SpecWriter w, OptArr1 obj) {
  var _n = 1;
  if (obj.items != null) _n++;
  w.beginObject(_n);
  w.writeField('req'); w.writeString(obj.req);
  if (obj.items != null) { w.writeField('items'); w.beginArray(obj.items!.length); for (final _e in obj.items!) { w.nextElement(); w.writeInt32(_e); } w.endArray(); }
  w.endObject();
}

final OptArr1Codec = SpecCodec<OptArr1>(
  encode: (w, obj) => _writeOptArr1(w, obj),
  decode: (r) {
    String _req = '';
    List<int>? _items;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'req': _req = r.readString(); break;
        case 'items': _items = () { final _list = <int>[]; r.beginArray(); while (r.hasNextElement()) { _list.add(r.readInt32()); } r.endArray(); return _list; }(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptArr1(req: _req, items: _items);
  },
);

class OptArr2 {
  final int id;
  final List<String>? names;
  final List<bool>? flags;
  OptArr2({required this.id, this.names, this.flags});
}

void _writeOptArr2(SpecWriter w, OptArr2 obj) {
  var _n = 1;
  if (obj.names != null) _n++;
  if (obj.flags != null) _n++;
  w.beginObject(_n);
  w.writeField('id'); w.writeInt32(obj.id);
  if (obj.names != null) { w.writeField('names'); w.beginArray(obj.names!.length); for (final _e in obj.names!) { w.nextElement(); w.writeString(_e); } w.endArray(); }
  if (obj.flags != null) { w.writeField('flags'); w.beginArray(obj.flags!.length); for (final _e in obj.flags!) { w.nextElement(); w.writeBool(_e); } w.endArray(); }
  w.endObject();
}

final OptArr2Codec = SpecCodec<OptArr2>(
  encode: (w, obj) => _writeOptArr2(w, obj),
  decode: (r) {
    int _id = 0;
    List<String>? _names;
    List<bool>? _flags;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'id': _id = r.readInt32(); break;
        case 'names': _names = () { final _list = <String>[]; r.beginArray(); while (r.hasNextElement()) { _list.add(r.readString()); } r.endArray(); return _list; }(); break;
        case 'flags': _flags = () { final _list = <bool>[]; r.beginArray(); while (r.hasNextElement()) { _list.add(r.readBool()); } r.endArray(); return _list; }(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptArr2(id: _id, names: _names, flags: _flags);
  },
);

class OptArr3 {
  final List<String>? a;
  final List<double>? b;
  OptArr3({this.a, this.b});
}

void _writeOptArr3(SpecWriter w, OptArr3 obj) {
  var _n = 0;
  if (obj.a != null) _n++;
  if (obj.b != null) _n++;
  w.beginObject(_n);
  if (obj.a != null) { w.writeField('a'); w.beginArray(obj.a!.length); for (final _e in obj.a!) { w.nextElement(); w.writeString(_e); } w.endArray(); }
  if (obj.b != null) { w.writeField('b'); w.beginArray(obj.b!.length); for (final _e in obj.b!) { w.nextElement(); w.writeFloat64(_e); } w.endArray(); }
  w.endObject();
}

final OptArr3Codec = SpecCodec<OptArr3>(
  encode: (w, obj) => _writeOptArr3(w, obj),
  decode: (r) {
    List<String>? _a;
    List<double>? _b;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = () { final _list = <String>[]; r.beginArray(); while (r.hasNextElement()) { _list.add(r.readString()); } r.endArray(); return _list; }(); break;
        case 'b': _b = () { final _list = <double>[]; r.beginArray(); while (r.hasNextElement()) { _list.add(r.readFloat64()); } r.endArray(); return _list; }(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptArr3(a: _a, b: _b);
  },
);

class OptArr4 {
  final Uint8List payload;
  final List<Uint8List>? chunks;
  OptArr4({required this.payload, this.chunks});
}

void _writeOptArr4(SpecWriter w, OptArr4 obj) {
  var _n = 1;
  if (obj.chunks != null) _n++;
  w.beginObject(_n);
  w.writeField('payload'); w.writeBytes(obj.payload);
  if (obj.chunks != null) { w.writeField('chunks'); w.beginArray(obj.chunks!.length); for (final _e in obj.chunks!) { w.nextElement(); w.writeBytes(_e); } w.endArray(); }
  w.endObject();
}

final OptArr4Codec = SpecCodec<OptArr4>(
  encode: (w, obj) => _writeOptArr4(w, obj),
  decode: (r) {
    Uint8List _payload = Uint8List(0);
    List<Uint8List>? _chunks;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'payload': _payload = r.readBytes(); break;
        case 'chunks': _chunks = () { final _list = <Uint8List>[]; r.beginArray(); while (r.hasNextElement()) { _list.add(r.readBytes()); } r.endArray(); return _list; }(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptArr4(payload: _payload, chunks: _chunks);
  },
);

class OptArr5 {
  final List<Inner>? models;
  final String name;
  OptArr5({this.models, required this.name});
}

void _writeOptArr5(SpecWriter w, OptArr5 obj) {
  var _n = 1;
  if (obj.models != null) _n++;
  w.beginObject(_n);
  if (obj.models != null) { w.writeField('models'); w.beginArray(obj.models!.length); for (final _e in obj.models!) { w.nextElement(); _writeInner(w, _e); } w.endArray(); }
  w.writeField('name'); w.writeString(obj.name);
  w.endObject();
}

final OptArr5Codec = SpecCodec<OptArr5>(
  encode: (w, obj) => _writeOptArr5(w, obj),
  decode: (r) {
    List<Inner>? _models;
    String _name = '';
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'models': _models = () { final _list = <Inner>[]; r.beginArray(); while (r.hasNextElement()) { _list.add(InnerCodec.decode(r)); } r.endArray(); return _list; }(); break;
        case 'name': _name = r.readString(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return OptArr5(models: _models, name: _name);
  },
);

class NestOpt1 {
  final Label outer;
  final String name;
  NestOpt1({required this.outer, required this.name});
}

void _writeNestOpt1(SpecWriter w, NestOpt1 obj) {
  w.beginObject(2);
  w.writeField('outer'); _writeLabel(w, obj.outer);
  w.writeField('name'); w.writeString(obj.name);
  w.endObject();
}

final NestOpt1Codec = SpecCodec<NestOpt1>(
  encode: (w, obj) => _writeNestOpt1(w, obj),
  decode: (r) {
    late Label _outer;
    String _name = '';
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'outer': _outer = LabelCodec.decode(r); break;
        case 'name': _name = r.readString(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return NestOpt1(outer: _outer, name: _name);
  },
);

class NestOpt2 {
  final IdVal? a;
  final IdVal? b;
  final IdVal? c;
  NestOpt2({this.a, this.b, this.c});
}

void _writeNestOpt2(SpecWriter w, NestOpt2 obj) {
  var _n = 0;
  if (obj.a != null) _n++;
  if (obj.b != null) _n++;
  if (obj.c != null) _n++;
  w.beginObject(_n);
  if (obj.a != null) { w.writeField('a'); _writeIdVal(w, obj.a!); }
  if (obj.b != null) { w.writeField('b'); _writeIdVal(w, obj.b!); }
  if (obj.c != null) { w.writeField('c'); _writeIdVal(w, obj.c!); }
  w.endObject();
}

final NestOpt2Codec = SpecCodec<NestOpt2>(
  encode: (w, obj) => _writeNestOpt2(w, obj),
  decode: (r) {
    IdVal? _a;
    IdVal? _b;
    IdVal? _c;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = r.isNull() ? (() { r.readNull(); return null; })() : IdValCodec.decode(r); break;
        case 'b': _b = r.isNull() ? (() { r.readNull(); return null; })() : IdValCodec.decode(r); break;
        case 'c': _c = r.isNull() ? (() { r.readNull(); return null; })() : IdValCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return NestOpt2(a: _a, b: _b, c: _c);
  },
);

class NestOpt3 {
  final Money money;
  final Range32? value_range;
  NestOpt3({required this.money, this.value_range});
}

void _writeNestOpt3(SpecWriter w, NestOpt3 obj) {
  var _n = 1;
  if (obj.value_range != null) _n++;
  w.beginObject(_n);
  w.writeField('money'); _writeMoney(w, obj.money);
  if (obj.value_range != null) { w.writeField('value_range'); _writeRange32(w, obj.value_range!); }
  w.endObject();
}

final NestOpt3Codec = SpecCodec<NestOpt3>(
  encode: (w, obj) => _writeNestOpt3(w, obj),
  decode: (r) {
    late Money _money;
    Range32? _value_range;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'money': _money = MoneyCodec.decode(r); break;
        case 'value_range': _value_range = r.isNull() ? (() { r.readNull(); return null; })() : Range32Codec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return NestOpt3(money: _money, value_range: _value_range);
  },
);

class NestOpt4 {
  final Addr? addr;
  final Coord? coord;
  final String name;
  NestOpt4({this.addr, this.coord, required this.name});
}

void _writeNestOpt4(SpecWriter w, NestOpt4 obj) {
  var _n = 1;
  if (obj.addr != null) _n++;
  if (obj.coord != null) _n++;
  w.beginObject(_n);
  if (obj.addr != null) { w.writeField('addr'); _writeAddr(w, obj.addr!); }
  if (obj.coord != null) { w.writeField('coord'); _writeCoord(w, obj.coord!); }
  w.writeField('name'); w.writeString(obj.name);
  w.endObject();
}

final NestOpt4Codec = SpecCodec<NestOpt4>(
  encode: (w, obj) => _writeNestOpt4(w, obj),
  decode: (r) {
    Addr? _addr;
    Coord? _coord;
    String _name = '';
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'addr': _addr = r.isNull() ? (() { r.readNull(); return null; })() : AddrCodec.decode(r); break;
        case 'coord': _coord = r.isNull() ? (() { r.readNull(); return null; })() : CoordCodec.decode(r); break;
        case 'name': _name = r.readString(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return NestOpt4(addr: _addr, coord: _coord, name: _name);
  },
);

class NestOpt5 {
  final Point3 point;
  final Addr addr;
  final Label? label;
  NestOpt5({required this.point, required this.addr, this.label});
}

void _writeNestOpt5(SpecWriter w, NestOpt5 obj) {
  var _n = 2;
  if (obj.label != null) _n++;
  w.beginObject(_n);
  w.writeField('point'); _writePoint3(w, obj.point);
  w.writeField('addr'); _writeAddr(w, obj.addr);
  if (obj.label != null) { w.writeField('label'); _writeLabel(w, obj.label!); }
  w.endObject();
}

final NestOpt5Codec = SpecCodec<NestOpt5>(
  encode: (w, obj) => _writeNestOpt5(w, obj),
  decode: (r) {
    late Point3 _point;
    late Addr _addr;
    Label? _label;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'point': _point = Point3Codec.decode(r); break;
        case 'addr': _addr = AddrCodec.decode(r); break;
        case 'label': _label = r.isNull() ? (() { r.readNull(); return null; })() : LabelCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return NestOpt5(point: _point, addr: _addr, label: _label);
  },
);

class NestOptInner1 {
  final String tag;
  final OptInner? nested;
  NestOptInner1({required this.tag, this.nested});
}

void _writeNestOptInner1(SpecWriter w, NestOptInner1 obj) {
  var _n = 1;
  if (obj.nested != null) _n++;
  w.beginObject(_n);
  w.writeField('tag'); w.writeString(obj.tag);
  if (obj.nested != null) { w.writeField('nested'); _writeOptInner(w, obj.nested!); }
  w.endObject();
}

final NestOptInner1Codec = SpecCodec<NestOptInner1>(
  encode: (w, obj) => _writeNestOptInner1(w, obj),
  decode: (r) {
    String _tag = '';
    OptInner? _nested;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'tag': _tag = r.readString(); break;
        case 'nested': _nested = r.isNull() ? (() { r.readNull(); return null; })() : OptInnerCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return NestOptInner1(tag: _tag, nested: _nested);
  },
);

class NestOptInner2 {
  final String tag;
  final OptInner nested;
  NestOptInner2({required this.tag, required this.nested});
}

void _writeNestOptInner2(SpecWriter w, NestOptInner2 obj) {
  w.beginObject(2);
  w.writeField('tag'); w.writeString(obj.tag);
  w.writeField('nested'); _writeOptInner(w, obj.nested);
  w.endObject();
}

final NestOptInner2Codec = SpecCodec<NestOptInner2>(
  encode: (w, obj) => _writeNestOptInner2(w, obj),
  decode: (r) {
    String _tag = '';
    late OptInner _nested;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'tag': _tag = r.readString(); break;
        case 'nested': _nested = OptInnerCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return NestOptInner2(tag: _tag, nested: _nested);
  },
);

class NestOptInner3 {
  final OptInner? outer;
  final OptInner? nested;
  NestOptInner3({this.outer, this.nested});
}

void _writeNestOptInner3(SpecWriter w, NestOptInner3 obj) {
  var _n = 0;
  if (obj.outer != null) _n++;
  if (obj.nested != null) _n++;
  w.beginObject(_n);
  if (obj.outer != null) { w.writeField('outer'); _writeOptInner(w, obj.outer!); }
  if (obj.nested != null) { w.writeField('nested'); _writeOptInner(w, obj.nested!); }
  w.endObject();
}

final NestOptInner3Codec = SpecCodec<NestOptInner3>(
  encode: (w, obj) => _writeNestOptInner3(w, obj),
  decode: (r) {
    OptInner? _outer;
    OptInner? _nested;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'outer': _outer = r.isNull() ? (() { r.readNull(); return null; })() : OptInnerCodec.decode(r); break;
        case 'nested': _nested = r.isNull() ? (() { r.readNull(); return null; })() : OptInnerCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return NestOptInner3(outer: _outer, nested: _nested);
  },
);

class DeepNest1 {
  final String label;
  final Addr nested;
  DeepNest1({required this.label, required this.nested});
}

void _writeDeepNest1(SpecWriter w, DeepNest1 obj) {
  w.beginObject(2);
  w.writeField('label'); w.writeString(obj.label);
  w.writeField('nested'); _writeAddr(w, obj.nested);
  w.endObject();
}

final DeepNest1Codec = SpecCodec<DeepNest1>(
  encode: (w, obj) => _writeDeepNest1(w, obj),
  decode: (r) {
    String _label = '';
    late Addr _nested;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'label': _label = r.readString(); break;
        case 'nested': _nested = AddrCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DeepNest1(label: _label, nested: _nested);
  },
);

class DeepNest2 {
  final String name;
  final Money money;
  final Addr addr;
  DeepNest2({required this.name, required this.money, required this.addr});
}

void _writeDeepNest2(SpecWriter w, DeepNest2 obj) {
  w.beginObject(3);
  w.writeField('name'); w.writeString(obj.name);
  w.writeField('money'); _writeMoney(w, obj.money);
  w.writeField('addr'); _writeAddr(w, obj.addr);
  w.endObject();
}

final DeepNest2Codec = SpecCodec<DeepNest2>(
  encode: (w, obj) => _writeDeepNest2(w, obj),
  decode: (r) {
    String _name = '';
    late Money _money;
    late Addr _addr;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'name': _name = r.readString(); break;
        case 'money': _money = MoneyCodec.decode(r); break;
        case 'addr': _addr = AddrCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DeepNest2(name: _name, money: _money, addr: _addr);
  },
);

class DeepNest3 {
  final String title;
  final Point3 point;
  final Range32 value_range;
  final Money money;
  DeepNest3({required this.title, required this.point, required this.value_range, required this.money});
}

void _writeDeepNest3(SpecWriter w, DeepNest3 obj) {
  w.beginObject(4);
  w.writeField('title'); w.writeString(obj.title);
  w.writeField('point'); _writePoint3(w, obj.point);
  w.writeField('value_range'); _writeRange32(w, obj.value_range);
  w.writeField('money'); _writeMoney(w, obj.money);
  w.endObject();
}

final DeepNest3Codec = SpecCodec<DeepNest3>(
  encode: (w, obj) => _writeDeepNest3(w, obj),
  decode: (r) {
    String _title = '';
    late Point3 _point;
    late Range32 _value_range;
    late Money _money;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'title': _title = r.readString(); break;
        case 'point': _point = Point3Codec.decode(r); break;
        case 'value_range': _value_range = Range32Codec.decode(r); break;
        case 'money': _money = MoneyCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DeepNest3(title: _title, point: _point, value_range: _value_range, money: _money);
  },
);

class DeepNest4 {
  final List<Coord> coords;
  final Inner nested;
  final String tag;
  DeepNest4({required this.coords, required this.nested, required this.tag});
}

void _writeDeepNest4(SpecWriter w, DeepNest4 obj) {
  w.beginObject(3);
  w.writeField('coords'); w.beginArray(obj.coords.length); for (final _e in obj.coords) { w.nextElement(); _writeCoord(w, _e); } w.endArray();
  w.writeField('nested'); _writeInner(w, obj.nested);
  w.writeField('tag'); w.writeString(obj.tag);
  w.endObject();
}

final DeepNest4Codec = SpecCodec<DeepNest4>(
  encode: (w, obj) => _writeDeepNest4(w, obj),
  decode: (r) {
    List<Coord> _coords = [];
    late Inner _nested;
    String _tag = '';
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'coords': _coords = () { final _list = <Coord>[]; r.beginArray(); while (r.hasNextElement()) { _list.add(CoordCodec.decode(r)); } r.endArray(); return _list; }(); break;
        case 'nested': _nested = InnerCodec.decode(r); break;
        case 'tag': _tag = r.readString(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DeepNest4(coords: _coords, nested: _nested, tag: _tag);
  },
);

class DeepNest5 {
  final List<Label> labels;
  final Money money;
  final String name;
  DeepNest5({required this.labels, required this.money, required this.name});
}

void _writeDeepNest5(SpecWriter w, DeepNest5 obj) {
  w.beginObject(3);
  w.writeField('labels'); w.beginArray(obj.labels.length); for (final _e in obj.labels) { w.nextElement(); _writeLabel(w, _e); } w.endArray();
  w.writeField('money'); _writeMoney(w, obj.money);
  w.writeField('name'); w.writeString(obj.name);
  w.endObject();
}

final DeepNest5Codec = SpecCodec<DeepNest5>(
  encode: (w, obj) => _writeDeepNest5(w, obj),
  decode: (r) {
    List<Label> _labels = [];
    late Money _money;
    String _name = '';
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'labels': _labels = () { final _list = <Label>[]; r.beginArray(); while (r.hasNextElement()) { _list.add(LabelCodec.decode(r)); } r.endArray(); return _list; }(); break;
        case 'money': _money = MoneyCodec.decode(r); break;
        case 'name': _name = r.readString(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DeepNest5(labels: _labels, money: _money, name: _name);
  },
);

class DeepNest6 {
  final List<IdVal> items;
  final Addr? addr;
  final Coord coord;
  DeepNest6({required this.items, this.addr, required this.coord});
}

void _writeDeepNest6(SpecWriter w, DeepNest6 obj) {
  var _n = 2;
  if (obj.addr != null) _n++;
  w.beginObject(_n);
  w.writeField('items'); w.beginArray(obj.items.length); for (final _e in obj.items) { w.nextElement(); _writeIdVal(w, _e); } w.endArray();
  if (obj.addr != null) { w.writeField('addr'); _writeAddr(w, obj.addr!); }
  w.writeField('coord'); _writeCoord(w, obj.coord);
  w.endObject();
}

final DeepNest6Codec = SpecCodec<DeepNest6>(
  encode: (w, obj) => _writeDeepNest6(w, obj),
  decode: (r) {
    List<IdVal> _items = [];
    Addr? _addr;
    late Coord _coord;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'items': _items = () { final _list = <IdVal>[]; r.beginArray(); while (r.hasNextElement()) { _list.add(IdValCodec.decode(r)); } r.endArray(); return _list; }(); break;
        case 'addr': _addr = r.isNull() ? (() { r.readNull(); return null; })() : AddrCodec.decode(r); break;
        case 'coord': _coord = CoordCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DeepNest6(items: _items, addr: _addr, coord: _coord);
  },
);

class DeepNest7 {
  final Addr a;
  final Addr b;
  final Addr c;
  DeepNest7({required this.a, required this.b, required this.c});
}

void _writeDeepNest7(SpecWriter w, DeepNest7 obj) {
  w.beginObject(3);
  w.writeField('a'); _writeAddr(w, obj.a);
  w.writeField('b'); _writeAddr(w, obj.b);
  w.writeField('c'); _writeAddr(w, obj.c);
  w.endObject();
}

final DeepNest7Codec = SpecCodec<DeepNest7>(
  encode: (w, obj) => _writeDeepNest7(w, obj),
  decode: (r) {
    late Addr _a;
    late Addr _b;
    late Addr _c;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': _a = AddrCodec.decode(r); break;
        case 'b': _b = AddrCodec.decode(r); break;
        case 'c': _c = AddrCodec.decode(r); break;
        default: r.skip();
      }
    }
    r.endObject();
    return DeepNest7(a: _a, b: _b, c: _c);
  },
);

class TimestampEntry {
  final BigInt ts;
  final String event;
  final Uint8List? payload;
  TimestampEntry({required this.ts, required this.event, this.payload});
}

void _writeTimestampEntry(SpecWriter w, TimestampEntry obj) {
  var _n = 2;
  if (obj.payload != null) _n++;
  w.beginObject(_n);
  w.writeField('ts'); w.writeInt64(obj.ts);
  w.writeField('event'); w.writeString(obj.event);
  if (obj.payload != null) { w.writeField('payload'); w.writeBytes(obj.payload!); }
  w.endObject();
}

final TimestampEntryCodec = SpecCodec<TimestampEntry>(
  encode: (w, obj) => _writeTimestampEntry(w, obj),
  decode: (r) {
    BigInt _ts = BigInt.zero;
    String _event = '';
    Uint8List? _payload;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'ts': _ts = r.readInt64(); break;
        case 'event': _event = r.readString(); break;
        case 'payload': _payload = r.readBytes(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return TimestampEntry(ts: _ts, event: _event, payload: _payload);
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

void _writeConfigEntry(SpecWriter w, ConfigEntry obj) {
  var _n = 1;
  if (obj.intValue != null) _n++;
  if (obj.strValue != null) _n++;
  if (obj.boolValue != null) _n++;
  if (obj.floatValue != null) _n++;
  w.beginObject(_n);
  w.writeField('key'); w.writeString(obj.key);
  if (obj.intValue != null) { w.writeField('intValue'); w.writeInt32(obj.intValue!); }
  if (obj.strValue != null) { w.writeField('strValue'); w.writeString(obj.strValue!); }
  if (obj.boolValue != null) { w.writeField('boolValue'); w.writeBool(obj.boolValue!); }
  if (obj.floatValue != null) { w.writeField('floatValue'); w.writeFloat64(obj.floatValue!); }
  w.endObject();
}

final ConfigEntryCodec = SpecCodec<ConfigEntry>(
  encode: (w, obj) => _writeConfigEntry(w, obj),
  decode: (r) {
    String _key = '';
    int? _intValue;
    String? _strValue;
    bool? _boolValue;
    double? _floatValue;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'key': _key = r.readString(); break;
        case 'intValue': _intValue = r.readInt32(); break;
        case 'strValue': _strValue = r.readString(); break;
        case 'boolValue': _boolValue = r.readBool(); break;
        case 'floatValue': _floatValue = r.readFloat64(); break;
        default: r.skip();
      }
    }
    r.endObject();
    return ConfigEntry(key: _key, intValue: _intValue, strValue: _strValue, boolValue: _boolValue, floatValue: _floatValue);
  },
);
