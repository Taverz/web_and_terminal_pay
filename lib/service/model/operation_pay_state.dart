class OperationPayState {
  final bool isLoading;
  final String text;
  final String? errorMessage;
  final bool isSuccess;
  final bool isCanceled;
  final bool hasStarted;
  final Duration elapsed;

  OperationPayState({
    required this.isLoading,
    required this.text,
    required this.errorMessage,
    required this.isSuccess,
    required this.isCanceled,
    required this.hasStarted,
    required this.elapsed,
  });
}
