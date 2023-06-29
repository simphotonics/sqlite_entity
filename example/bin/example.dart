import 'package:sqlite_entity/sqlite_entity.dart';

class PlayerTable extends Table {
  /// Player id.
  static const id = Column<int>(constraints: {
    Constraint.primaryKey,
    Constraint.notNull,
  });

  /// Player status
  static const isActive = Column<bool>();

  /// First name of player.
  static const firstName = Column<String>();

  /// Last name of player.
  static const lastName = Column<String>();
}

class TeamTable extends ModelDefinition {
  static const id = Column<int>(
    constraints: {
      Constraint.primaryKey,
      Constraint.notNull,
    },
    defaultValue: 0,
  );

  static const pid1 = Column<int>(
    constraints: {
      Constraint.notNull,
    },
    defaultValue: 0,
  );

  static const pid2 = Column<int>(constraints: {
    Constraint.notNull,
  }, defaultValue: 1);

  /// Foreign Key
  static const foreignKey1 = ForeignKey(
      parentKey: PlayerTable.id,
      childKey: TeamTable.pid1,
      constraints: {
        ForeignKeyConstraint.deferrable,
        ForeignKeyConstraint.initallyDeferred,
      });

  static const foreignKey2 = ForeignKey(
    parentKey: PlayerTable.id,
    childKey: TeamTable.pid2,
  );

  final differentPlayers = const CheckConstraint(
    NotEqual<int>(
      pid1,
      pid2,
    ),
  );

  static const uniqueTeams = Index(
    isUnique: true,
    exprs: {
      Min(TeamTable.pid1, TeamTable.pid2),
      Max(TeamTable.pid1, TeamTable.pid2),
    },
  );
}

class Team extends Model {
  const Team(
      {required this.id,
      required this.pid1,
      required this.test,
      required this.pid2});

  /// Converts a [Map<String,dynamic>] to a [Team].
  Team.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        pid1 = map['pid1'],
        test = map['test'],
        pid2 = map['pid2'];

  final int id;

  final int pid1;

  final bool test;

  final int pid2;


  /// Converts a [Team] to [Map<String,dynamic>].
  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'pid1': pid1,
      'test': test,
      'pid2': pid2,
    };
  }

  /// Creates a [Map<String, dynamic>] representing a [Team]
  /// object without a primary key. The primary key is assigned by the
  /// database during insertion.
  static Map<String, dynamic> initMap({required int pid1, required int pid2}) {
    return {
      'pid1': pid1,
      'pid2': pid2,
    };
  }
}
