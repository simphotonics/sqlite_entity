/// Annotation used to annotate classes extending [TableInfo].
/// Requests the generation of a data model.
class GenerateModel {
  const GenerateModel();
}

/// Annotation used to annotate classes extending [TableInfo].
/// Creates an additional field to store the timestamp.
class GenerateTimeStampedModel extends GenerateModel {
  const GenerateTimeStampedModel({
    this.fieldName = 'timeStamp',
  });

  /// Name used for the timeStamp field and database column.
  final String fieldName;
}

/// Annotation used to annotate classes extending [TableInfo].
/// Creates two additional fields to store the object creation time
/// and the object completion time.
class GenerateTimeTrackableModel extends GenerateModel {
  const GenerateTimeTrackableModel({
    this.startFieldName = 'start',
    this.endFieldName = 'end',
  });

  /// Name used for the start time field and database column.
  final String startFieldName;

  /// Name used for the model field containing the object completion time.
  /// The same label is used for the database column.
  final String endFieldName;
}
