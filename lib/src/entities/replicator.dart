/// Implement this interface to generate classes that can
/// generate source code representing [this].
abstract class Replicator {
  /// Source code replicating this.
  String replicate();
}
