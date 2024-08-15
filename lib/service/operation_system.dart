import 'dart:async';
import 'package:async/async.dart';
import 'package:web_and_terminal_pay/service/model/operation_pay_state.dart';

class OperationPay {
  bool _isLoading = false;
  String _text;
  String? _errorMessage;
  bool _isSuccess = false;
  bool _isCanceled = false;
  bool _hasStarted = false;
  CancelableOperation<String?>? _cancelableOperation;
  Timer? _timer;
  Duration _elapsed = Duration.zero;
  final StreamController<OperationPayState> _controller =
      StreamController<OperationPayState>();

  final String initialText;
  final Future<String?> Function() onPressed;
  final Future<String?> Function()? onCancel;

  OperationPay({
    required this.initialText,
    required this.onPressed,
    this.onCancel,
  }) : _text = initialText {
    _controller.add(_createState());
  }

  Stream<OperationPayState> get stateStream => _controller.stream;

  OperationPayState get initialState => _createState();

  OperationPayState _createState() {
    return OperationPayState(
      isLoading: _isLoading,
      text: _text,
      errorMessage: _errorMessage,
      isSuccess: _isSuccess,
      isCanceled: _isCanceled,
      hasStarted: _hasStarted,
      elapsed: _elapsed,
    );
  }

  void _updateState() {
    _controller.add(_createState());
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _elapsed = Duration(seconds: _elapsed.inSeconds + 1);
      _updateState();
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  Future<void> cancelOperation() async {
    await _cancelableOperation?.cancel();
    _stopTimer();
    try {
      String? result;
      if (onCancel != null) result = await onCancel!();
      _text = result ?? 'Операция была отменена';
      _isLoading = false;
      _isCanceled = true;
    } catch (error, stackTrace) {
      _errorMessage = error.toString() + "\n" + "\n" + stackTrace.toString();
      _isLoading = false;
    }
    _updateState();
  }

  Future<void> startOperation() async {
    _isLoading = true;
    _errorMessage = null;
    _isSuccess = false;
    _isCanceled = false;
    _hasStarted = true;
    _elapsed = Duration.zero;
    _updateState();
    _startTimer();

    _cancelableOperation = CancelableOperation.fromFuture(
      onPressed().timeout(const Duration(minutes: 5)),
      onCancel: () {
        _isLoading = false;
        _isCanceled = true;
        _stopTimer();
        _updateState();
      },
    );

    try {
      final result = await _cancelableOperation!.value;
      if (!_isCanceled) {
        _text = result ?? initialText;
        _isSuccess = true;
      }
    } catch (error, stackTrace) {
      if (!_isCanceled) {
        _errorMessage = error.toString() + "\n" + "\n" + stackTrace.toString();
      }
    } finally {
      _isLoading = false;
      _stopTimer();
      _updateState();
    }
  }

  Future<void> dispose() async {
    _timer?.cancel();
    await _cancelableOperation?.cancel();
    await _controller.close();
  }
}
