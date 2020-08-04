/// Implement this interface to generate classes that can
/// generate source code representing themselves.
abstract class Replicator {
  /// Returns source code replicating [this].
  String get sourceCode;
}
