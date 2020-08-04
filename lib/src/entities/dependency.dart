//import 'package:build/build.dart' show AssetId;

/// Class holding dependency information of table [child].
/// Table [child] has foreign keys referencing columns in tables [parents].
class Dependency {
  /// Create the dependency object of table [child].
  const Dependency({
    required this.child,
    required this.parents,
  });

  /// Table name
  final String child;

  /// Names of parent tables
  final Set<String> parents;

  @override
  String toString() {
    return 'Child: $child. Parents: $parents.';
  }
}
