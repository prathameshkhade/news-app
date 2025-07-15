class Failure {
  final String message;
  final int? code;

  Failure({
    required this.message,
    this.code,
  });

  @override
  String toString() {
    return 'Failure(message: $message, code: $code)';
  }
}