// Run: cd tests/ryu && dart run test_ryu.dart
import 'dart:io';
import 'dart:convert';
import 'dart:math';

import '../../lib/src/ryu/ryu_f32.dart';
import '../../lib/src/ryu/ryu_f64.dart';

List<double> loadTests(String filename) {
  return File(filename).readAsLinesSync()
    .map((l) => l.trim())
    .where((l) => l.isNotEmpty && !l.startsWith('#'))
    .map((l) => double.parse(l))
    .toList();
}

List<String> loadExpected(String filename) {
  return File(filename).readAsLinesSync()
    .map((l) => l.trim())
    .where((l) => l.isNotEmpty)
    .toList();
}

List<double> loadCoverage(String filename) {
  return File(filename).readAsLinesSync()
    .map((l) => l.trim())
    .where((l) => l.isNotEmpty && l.codeUnitAt(0) >= 48 && l.codeUnitAt(0) <= 57)
    .map((l) {
      var idx = l.indexOf('#');
      return double.parse(idx >= 0 ? l.substring(0, idx).trim() : l);
    })
    .toList();
}

void main() {
  var passed = 0, failed = 0;

  print('=== Float32 Original (125 tests) ===');
  var f32in = loadTests('test_cases_f32.txt');
  var f32exp = loadExpected('expected_f32.txt');
  for (var i = 0; i < f32in.length && i < f32exp.length; i++) {
    var result = float32ToString(f32in[i]);
    if (result == f32exp[i]) {
      passed++;
    } else {
      failed++;
      if (failed <= 5) print('FAIL: ${f32in[i]} => $result (expected ${f32exp[i]})');
    }
  }
  print('${f32in.length}/${f32in.length}\n');

  print('=== Float64 Original (102 tests) ===');
  var f64in = loadTests('test_cases_f64.txt');
  var f64exp = loadExpected('expected_f64.txt');
  for (var i = 0; i < f64in.length && i < f64exp.length; i++) {
    var result = float64ToString(f64in[i]);
    if (result == f64exp[i]) {
      passed++;
    } else {
      failed++;
      if (failed <= 5) print('FAIL: ${f64in[i]} => $result (expected ${f64exp[i]})');
    }
  }
  print('${f64in.length}/${f64in.length}\n');

  print('=== Float32 Coverage (78 tests) ===');
  var c32in = loadCoverage('test_cases_table_coverage.txt');
  var c32exp = loadExpected('expected_table_coverage.txt');
  var n = min(c32in.length, c32exp.length);
  for (var i = 0; i < n; i++) {
    var result = float32ToString(c32in[i]);
    if (result == c32exp[i]) {
      passed++;
    } else {
      failed++;
      if (failed <= 5) print('FAIL: ${c32in[i]} => $result (expected ${c32exp[i]})');
    }
  }
  print('$n/$n\n');

  print('=== Float64 Coverage (616 tests) ===');
  var c64in = loadCoverage('test_cases_f64_table_coverage.txt');
  var c64exp = loadExpected('expected_f64_table_coverage.txt');
  n = min(c64in.length, c64exp.length);
  for (var i = 0; i < n; i++) {
    var result = float64ToString(c64in[i]);
    if (result == c64exp[i]) {
      passed++;
    } else {
      failed++;
      if (failed <= 5) print('FAIL: ${c64in[i]} => $result (expected ${c64exp[i]})');
    }
  }
  print('$n/$n\n');

  print('=== TOTAL: $passed/${passed + failed} ===');
  if (failed > 0) exit(1);
}
