abstract class KevinSessionResult {
  const KevinSessionResult();
}

class KevinSessionResultGeneralError extends KevinSessionResult {
  final String message;

  const KevinSessionResultGeneralError({
    required this.message,
  });
}

class KevinSessionResultCancelled extends KevinSessionResult {}
