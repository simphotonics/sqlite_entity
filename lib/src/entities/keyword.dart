/// Provides the getter `keyword`.
abstract interface class Keyword {
  /// Returns the keyword associated with the enum instance.
  String get keyword;

  static const $in = 'IN';
  static const where = 'WHERE';
  static const deleteFrom = 'DELETE FROM';
  }