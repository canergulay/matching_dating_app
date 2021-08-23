class CustomError {
  final String message;
  final bool isException;
  CustomError({
    required this.message,
    this.isException = false,
  });
}
