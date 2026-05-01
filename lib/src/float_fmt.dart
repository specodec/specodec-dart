import 'dart:typed_data';

// fmtFloat32: returns the shortest decimal string that uniquely identifies
// the given float32 value and round-trips back to the same float32 bits.
//
// Algorithm: iterate precision p = 1..9, return the first
// s = f32.toStringAsPrecision(p) such that the value round-trips through
// a Float32 ByteData write/read cycle.
// Float32 has 24 mantissa bits → at most 9 significant decimal digits needed.
//
// TODO: replace body with a Ryu f32 implementation for O(1) performance.
String fmtFloat32(double value) {
  if (value == 0.0 && value.isNegative) return '-0';
  final bd = ByteData(4)..setFloat32(0, value, Endian.little);
  final f32 = bd.getFloat32(0, Endian.little);
  for (int p = 1; p <= 9; p++) {
    final s = f32.toStringAsPrecision(p);
    final bd2 = ByteData(4)..setFloat32(0, double.parse(s), Endian.little);
    if (bd2.getFloat32(0, Endian.little) == f32) return s;
  }
  return f32.toString(); // unreachable for valid finite float32
}
