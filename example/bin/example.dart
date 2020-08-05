import 'package:ansicolor/ansicolor.dart';
import 'package:meta/meta.dart';
import 'package:sqlite_entities/sqlite_entities.dart';

class TeamDefinition extends ModelDefinition {
  const TeamDefinition();

  final id = const Column<Integer>(constraints: {
    Constraint.PRIMARY_KEY,
  });

  final pid1 = const Column<Integer>(
    constraints: {
      Constraint.NOT_NULL,
    },
  );

  final test = const Column<Boolean>(
    constraints: {Constraint.PRIMARY_KEY},
  );

  final pid2 = const Column<Integer>(constraints: {
    Constraint.NOT_NULL,
  });

  /// Foreign Key
  final foreignKey1 = const ForeignKey(
      parentColumn: Player.$id,
      childColumn: Team.$pid1,
      constraints: {
        ForeignKeyConstraint.DEFERRABLE,
        ForeignKeyConstraint.INITIALLY_DEFERRED
      });

  final foreignKey2 = const ForeignKey(
    parentColumn: Player.$id,
    childColumn: Team.$pid2,
  );

  final differentPlayers = const CheckConstraint<Team>(expressions: [
    NotEqual(
      Team.$pid1,
      Team.$pid2,
    ),
    Expr(
        left: ColumnLiteral(Team.$id),
        right: Literal(Integer(187)),
        operatorName: '!=',
        exprFormat: ExprFormat.OPERATOR),
  ]);

  static const uniqueTeams = Index(
    isUnique: true,
    name: 'unique_teams',
    expressions: [
      Min(Team.$pid1, Team.$pid2),
      Max(Team.$pid1, Team.$pid2),
    ],
  );
}

class Team extends Model {
  const Team(
      {
      @required this.id,
      @required this.pid1,
      @required this.test,
      @required this.pid2});

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

  /// Column: Team.id.
  static const $id = AnchoredColumn<Team, Integer>(
    constraints: {
      Constraint.PRIMARY_KEY,
    },
    name: 'id',
  );

  /// Column: Team.pid1.
  static const $pid1 = AnchoredColumn<Team, Integer>(
    constraints: {
      Constraint.NOT_NULL,
    },
    name: 'pid1',
  );

  /// Column: Team.test.
  static const $test = AnchoredColumn<Team, Boolean>(
    constraints: {
      Constraint.PRIMARY_KEY,
    },
    name: 'test',
  );

  /// Column: Team.pid2.
  static const $pid2 = AnchoredColumn<Team, Integer>(
    constraints: {
      Constraint.NOT_NULL,
    },
    name: 'pid2',
  );

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
  static Map<String, dynamic> initMap(
      {@required int pid1, @required int pid2}) {
    return {
      'pid1': pid1,
      'pid2': pid2,
    };
  }
}

class Player extends Model {
  const Player(
      {
      @required this.id,
      @required this.isActive,
      @required this.firstName,
      @required this.timeStamp});

  /// Converts a [Map<String,dynamic>] to a [Player].
  Player.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        isActive = map['isActive'],
        firstName = map['firstName'],
        timeStamp = map['timeStamp'];

  final int id;

  final bool isActive;

  /// First name of player.
  final String firstName;

  /// Time stamp encoded as [microsecondsSinceEpoch].
  final int timeStamp;

  /// Column: Player.id.
  static const $id = AnchoredColumn<Player, Integer>(
    constraints: {
      Constraint.PRIMARY_KEY,
    },
    defaultValue: Integer(99),
    name: 'id',
  );

  /// Column: Player.isActive.
  static const $isActive = AnchoredColumn<Player, Boolean>(
    defaultValue: Boolean(true),
    name: 'isActive',
  );

  /// Column: Player.firstName.
  static const $firstName = AnchoredColumn<Player, Text>(
    defaultValue: Text('Thomas'),
    name: 'firstName',
  );

  /// Column: Player.timeStamp.
  static const $timeStamp = AnchoredColumn<Player, Integer>(
    constraints: {
      Constraint.NOT_NULL,
    },
    name: 'timeStamp',
  );

  /// Converts a [Player] to [Map<String,dynamic>].
  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'isActive': isActive,
      'firstName': firstName,
      'timeStamp': timeStamp,
    };
  }

  /// Creates a [Map<String, dynamic>] representing a [Player]
  /// object without a primary key. The primary key is assigned by the
  /// database during insertion.
  static Map<String, dynamic> initMap(
      {@required bool isActive,
      @required String firstName,
      @required int timeStamp}) {
    return {
      'isActive': isActive,
      'firstName': firstName,
      'timeStamp': timeStamp,
    };
  }
}

// To run this program navigate to
// the folder 'directed_graph/example'
// in your terminal and type:
//
// # dart bin/example.dart
//
// followed by enter.
void main() {
  final blue = AnsiPen()..blue(bold: true);
  final magenta = AnsiPen()..magenta(bold: true);
  final green = AnsiPen()..green(bold: true);

  print(magenta('Team.\$id'));
  print(blue(Team.$id.toString()));
  print('');
  print(magenta('Min(Team.\$pid1, Player.\$id)'));
  print(blue(Min(Team.$pid1, Player.$id).toString()));
  print('');
  print(magenta('TeamDefinition().differentPlayers'));
  print(blue(TeamDefinition().differentPlayers.toString()));
  print('');
  print(magenta('TeamDefinition.uniqueTeams'));
  print(blue(TeamDefinition.uniqueTeams.toString()));
  print('');
  var column = TeamDefinition().pid1;

  print(magenta('Column pid1.'));
  print(blue(column.toString()));

  print('');
  print(magenta('Overriding name of column pid1. New name: ') +
      green('PID_1') +
      '.');
  column = column.overrideWith(name: 'PID_1');
  print(blue(column.toString()));

  print('');
  print(magenta('Print string value of constraint ') +
      blue('${Constraint.PRIMARY_KEY}: ') +
      green(Constraint.PRIMARY_KEY.stringValue) +
      '.');
  print(blue(Constraint.PRIMARY_KEY.toString()));
}
