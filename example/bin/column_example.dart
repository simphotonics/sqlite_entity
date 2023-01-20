import 'package:sqlite_entity/sqlite_entity.dart' show Column;

void main(List<String> args) {
  final col = Column<double>(defaultValue: 29.0);

  print(col.replicate());
}
