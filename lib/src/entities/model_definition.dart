import 'package:exception_templates/exception_templates.dart';

abstract class ModelDefinition {
  /// Extend this class to specify the fields of a data model and
  /// corresponding Sqlite table.
  const ModelDefinition();

  /// Returns the name of this class.
  static const String base = 'Definition';

  /// Returns a data model name: <ModelName>.
  ///
  /// Expects [input] of the form: <ModelName>Definition.
  ///
  /// Throws [GeneratorError] on error.
  static String modelName(String input) {
    final error = ErrorOf<ModelDefinition>(
      message: 'Classes extending ModelDefinition '
          'should be named <ModelClassName>Definition.',
      invalidState: 'Class name: $input.',
      expectedState: 'A class name ending with "Definition".',
    );
    if (input.length < base.length) throw error;
    // Check if input ends with base.
    if (input.replaceRange(0, input.length - base.length, '') != base) {
      throw error;
    }
    // Strip base from end of input.
    return input.replaceRange(input.length - base.length, input.length, '');
  }
}
