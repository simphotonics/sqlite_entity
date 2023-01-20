abstract class TableInfo {
  /// Extend this class to specify the content of an Sqlite table.
  ///
  /// Add const static fields of type [Column] and run:
  /// #flutter packages pub run build_runner
  /// to generate the corresponding model.
  ///
  /// Usage:
  /// ```
  /// class PlayerTableInfo extends TableInfo{
  ///
  /// static const id = Column<int>(constraints: [
  ///   SqliteConstraint.PRIMARY_KEY,
  ///   SqliteConstraint.NOT_NULL,
  /// ]);
  ///
  /// static const name = Column<String>();
  /// }
  ///
  /// ```
  /// The build process will generate a model:
  /// ```
  /// class Player(){
  ///   final int id;
  ///   final String name;
  ///
  ///   const Player({this.id, this.name});
  ///
  ///   ... and serialization and deserialization methods
  /// }
  /// ```
  const TableInfo();
}
