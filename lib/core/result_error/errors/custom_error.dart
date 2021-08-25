class CustomError {
  final String message;
  final bool isException;
  CustomError({
    this.message = 'An unexpected error has occured',
    this.isException = false,
  });
}
