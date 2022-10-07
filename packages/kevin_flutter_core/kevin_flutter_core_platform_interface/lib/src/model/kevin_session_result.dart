abstract class KevinSessionResult {
  const KevinSessionResult();
}

/// Session result general error.
class KevinSessionResultGeneralError extends KevinSessionResult {
  final String? message;

  const KevinSessionResultGeneralError({
    required this.message,
  });
}

/// Session initialisation/session result parsing error.
class KevinSessionUnexpectedError extends KevinSessionResult {
  final String? message;

  const KevinSessionUnexpectedError({required this.message});
}

/// Session cancelled by user.
class KevinSessionResultCancelled extends KevinSessionResult {}
