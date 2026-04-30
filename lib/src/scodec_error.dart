class SCodecError implements Exception {
  final String code;
  final String message;
  SCodecError(this.code, this.message);
  @override String toString() => 'SCodecError($code): $message';
}
