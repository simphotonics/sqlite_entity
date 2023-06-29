/// Base class of a data model.
abstract class Model {
  const Model();

  /// Converts a instance of the model to `Map<String, dynamic`.
  Map<String, dynamic> toMap();

  /// Creates a `Map<String, dynamic` representation of [Model]
  /// without a primary key. The primary key is assigned by the
  /// Sqlite database during insertion.
  static Map<String, dynamic> initMap() => const <String, dynamic>{};
}

/// Base class of a data model that includes a time stamp
/// indicating the last time the object was updated.
abstract class TimeStampedModel extends Model {
  const TimeStampedModel(this.timeStamp);

  /// Last time the object was updated [microSecondsSinceEpoch].
  final int timeStamp;

  /// Returns the last time the object was updated as [DateTime].
  DateTime get lastUpdate => DateTime.fromMicrosecondsSinceEpoch(timeStamp);
}

/// Base class of a time trackable data model.
/// * `start` is the object creation time in microseconds since epoch.
/// * `end` is the object completion time in microsecond since epoch.
/// * `end < 1` indicates that end was not set.
///
/// Used with objects that have a specific duration (e.g. a tennis match).
abstract class TimeTrackableModel extends Model {
  const TimeTrackableModel({
    required this.start,
    this.end,
  });

  /// Object creation time in `microSecondsSinceEpoch`.
  final int start;

  /// Object completion time `microSecondsSinceEpoch`.
  final int? end;

  /// Returns the start time as [DateTime].
  DateTime get startTime => DateTime.fromMicrosecondsSinceEpoch(start);

  /// Returns the end time as [DateTime].
  ///
  /// Returns `null` if `end` is `null`.
  DateTime? get endTime =>
      (end == null) ? null : DateTime.fromMicrosecondsSinceEpoch(end!);

  /// Returns the duration between start time and end time.
  ///
  /// Returns the duration between now and start time if
  ///   end has not been set yet.
  Duration get duration => (end == null)
      ? DateTime.now().difference(startTime)
      : endTime!.difference(startTime);

  @override
  String toString() {
    return 'Creation time: $startTime,  completion time: $endTime .';
  }
}
