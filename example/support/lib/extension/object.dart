extension ObjectExtension<T> on T {
  R let<R>(R Function(T object) block) => block(this);

  T? takeIf(bool Function(T) block) => block(this) ? this : null;

  T? takeUnless(bool Function(T) block) => !block(this) ? this : null;

  R? takeInstance<R>() => this is R ? this as R : null;
}
