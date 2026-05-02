import "dart:typed_data";
import 'tables_f32.dart';
import 'ryu_math.dart';

const int FLOAT_MANTISSA_BITS = 23;
const int FLOAT_BIAS = 127;
const int FLOAT_POW5_INV_BITCOUNT = 59;
const int FLOAT_POW5_BITCOUNT = 61;

String float32ToString(double f) {
  ByteData bd = ByteData(4);
  bd.setFloat32(0, f, Endian.big);
  int bits = bd.getUint32(0, Endian.big);
  
  int sign = (bits >> 31);
  int ieeeMantissa = bits & 0x7FFFFF;
  int ieeeExponent = (bits >> 23) & 0xFF;
  
  if (ieeeExponent == 255) {
    if (ieeeMantissa == 0) {
      return sign == 1 ? "-Infinity" : "Infinity";
    }
    return "NaN";
  }
  
  if (ieeeExponent == 0 && ieeeMantissa == 0) {
    return sign == 1 ? "-0E0" : "0E0";
  }
  
  int e2, m2;
  if (ieeeExponent == 0) {
    e2 = 1 - FLOAT_BIAS - FLOAT_MANTISSA_BITS;
    m2 = ieeeMantissa;
  } else {
    e2 = ieeeExponent - FLOAT_BIAS - FLOAT_MANTISSA_BITS;
    m2 = (1 << FLOAT_MANTISSA_BITS) | ieeeMantissa;
  }
  
  bool signBit = sign == 1;
  int m2shifted = m2 << 6;
  
  if (e2 < -150) {
    return signBit ? "-0E0" : "0E0";
  }
  
  int vr, vp, vm;
  int e10;
  bool vmTrailingZeros = false;
  bool vrTrailingZeros = false;
  
  if (e2 >= 0) {
    int q = log10Pow2(e2);
    e10 = q;
    int k = FLOAT_POW5_INV_BITCOUNT + pow5bits(q) - 1;
    int i = -e2 + q + k;
    vr = mulPow5InvDivPow2(m2shifted, q, i);
    int j = q - k;
    vp = mulPow5InvDivPow2(4 * m2shifted - 2, q, i);
    vm = mulPow5InvDivPow2(4 * m2shifted + 2, q, i);
    
    if (j >= 0) {
      int pow10 = POW10_32[j];
      vr = vr * pow10;
      vp = vp * pow10;
      vm = vm * pow10;
    } else {
      vr = vr >> -j;
      vp = vp >> -j;
      vm = vm >> -j;
    }
    
    if (q <= 9 && q >= 0) {
      if (vmTrailingZeros) {
        vm -= 1;
      }
    }
  } else {
    int q = log10Pow5(-e2);
    e10 = q + e2;
    int i = -e2 - q;
    int k = pow5bits(i) - FLOAT_POW5_BITCOUNT;
    int j = q - k;
    vr = mulPow5DivPow2(m2shifted, i, j);
    vp = mulPow5DivPow2(4 * m2shifted - 2, i, j);
    vm = mulPow5DivPow2(4 * m2shifted + 2, i, j);
    
    if (q <= 1) {
      vmTrailingZeros = true;
      if (j >= 0) {
        int pow10 = POW10_32[j];
        vr = vr * pow10;
        vp = vp * pow10;
        vm = vm * pow10;
      }
    } else {
      if (j >= 0) {
        int pow10 = POW10_32[j];
        vr = vr * pow10;
        vp = vp * pow10;
        vm = vm * pow10;
      }
    }
  }
  
  int removed = 0;
  int lastRemovedDigit = 0;
  bool output = false;
  
  while (vp / 10 > vm / 10) {
    vmTrailingZeros = vm % 10 == 0;
    vrTrailingZeros = lastRemovedDigit == 0 && vr % 10 == 0;
    lastRemovedDigit = vr % 10;
    vr = vr / 10;
    vp = vp / 10;
    vm = vm / 10;
    removed++;
  }
  
  if (vmTrailingZeros && !vrTrailingZeros) {
    vm -= 1;
  }
  
  int exp = e10 + removed;
  
  if (exp >= 10) {
    String expStr = exp.toString();
    return "${signBit ? '-' : ''}${vr}E${exp >= 0 ? '+' : ''}${expStr}";
  } else {
    return "${signBit ? '-' : ''}${vr}E${exp >= 0 ? '+' : ''}${exp}";
  }
}
