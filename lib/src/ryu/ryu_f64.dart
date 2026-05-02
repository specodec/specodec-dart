import "dart:typed_data";
import 'tables_f64.dart';
import 'ryu_math.dart';

const int DOUBLE_MANTISSA_BITS = 52;
const int DOUBLE_BIAS = 1023;
const int DOUBLE_POW5_INV_BITCOUNT = 125;
const int DOUBLE_POW5_BITCOUNT = 125;

String float64ToString(double d) {
  ByteData bd = ByteData(8);
  bd.setFloat64(0, d, Endian.big);
  int bitsInt = bd.getUint64(0, Endian.big);
  BigInt bits = BigInt.from(bitsInt);
  
  BigInt sign = bits >> 63;
  BigInt ieeeMantissa = bits & BigInt.from(0xFFFFFFFFFFFFF);
  int ieeeExponent = ((bits >> 52) & BigInt.from(0x7FF)).toInt();
  
  if (ieeeExponent == 2047) {
    if (ieeeMantissa == BigInt.zero) {
      return sign == BigInt.one ? "-Infinity" : "Infinity";
    }
    return "NaN";
  }
  
  if (ieeeExponent == 0 && ieeeMantissa == BigInt.zero) {
    return sign == BigInt.one ? "-0E0" : "0E0";
  }
  
  int e2;
  BigInt m2;
  if (ieeeExponent == 0) {
    e2 = 1 - DOUBLE_BIAS - DOUBLE_MANTISSA_BITS;
    m2 = ieeeMantissa;
  } else {
    e2 = ieeeExponent - DOUBLE_BIAS - DOUBLE_MANTISSA_BITS;
    m2 = (BigInt.one << DOUBLE_MANTISSA_BITS) | ieeeMantissa;
  }
  
  bool signBit = sign == BigInt.one;
  BigInt m2shifted = m2 << 8;
  
  if (e2 < -1074) {
    return signBit ? "-0E0" : "0E0";
  }
  
  BigInt vr, vp, vm;
  int e10;
  
  if (e2 >= 0) {
    int q = log10Pow2_64(e2);
    e10 = q;
    int k = DOUBLE_POW5_INV_BITCOUNT + pow5bits_64(q) - 1;
    int i = -e2 + q + k;
    vr = mulPow5InvDivPow2_64(m2shifted, q, i);
    int j = q - k;
    vp = mulPow5InvDivPow2_64(BigInt.from(4) * m2shifted - BigInt.from(2), q, i);
    vm = mulPow5InvDivPow2_64(BigInt.from(4) * m2shifted + BigInt.from(2), q, i);
    
    if (j >= 0) {
      BigInt pow10 = POW10_64[j];
      vr = vr * pow10;
      vp = vp * pow10;
      vm = vm * pow10;
    } else {
      vr = vr >> BigInt.from(-j);
      vp = vp >> BigInt.from(-j);
      vm = vm >> BigInt.from(-j);
    }
  } else {
    int q = log10Pow5_64(-e2);
    e10 = q + e2;
    int i = -e2 - q;
    int k = pow5bits_64(i) - DOUBLE_POW5_BITCOUNT;
    int j = q - k;
    vr = mulPow5DivPow2_64(m2shifted, i, j);
    vp = mulPow5DivPow2_64(BigInt.from(4) * m2shifted - BigInt.from(2), i, j);
    vm = mulPow5DivPow2_64(BigInt.from(4) * m2shifted + BigInt.from(2), i, j);
    
    if (j >= 0) {
      BigInt pow10 = POW10_64[j];
      vr = vr * pow10;
      vp = vp * pow10;
      vm = vm * pow10;
    }
  }
  
  int removed = 0;
  int lastRemovedDigit = 0;
  
  while ((vp / BigInt.from(10)) > (vm / BigInt.from(10))) {
    lastRemovedDigit = (vr % BigInt.from(10)).toInt();
    vr = vr / BigInt.from(10);
    vp = vp / BigInt.from(10);
    vm = vm / BigInt.from(10);
    removed++;
  }
  
  int exp = e10 + removed;
  
  String result = "${signBit ? '-' : ''}${vr}";
  
  if (exp >= 10) {
    String expStr = exp.toString();
    return "$resultE${exp >= 0 ? '+' : ''}$expStr";
  } else {
    return "$resultE${exp >= 0 ? '+' : ''}$exp";
  }
}
