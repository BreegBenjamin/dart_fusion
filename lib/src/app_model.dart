part of '../appstate_widget.dart';

/// Root model that will be used in this entire system.
///
/// ```dart
/// class NewModel extends Model {}
/// ```
class Model extends Equatable {
  /// Default constructor
  const Model();

  /// Convert a JSON to this model.
  ///
  /// ```dart
  /// Model model = Model.fromJSON(json);
  /// ```
  Model fromJSON(JSON value) => const Model();

  /// Copy variables in this model and make a new one out of it.
  ///
  /// ```dart
  /// Model model = const Model();
  /// Model newModel = model.copyWith();
  /// ```
  Model copyWith() => const Model();

  /// Convert this model to JSON.
  ///
  /// ```dart
  /// Model model = const Model();
  /// JSON json = model.toJSON;
  /// ```
  JSON get toJSON => {'model_type': runtimeType};

  @override
  List<Object?> get props => toJSON.entries.map((e) => '${e.key}: ${e.value}').toList();

  @override
  String toString() => toJSON.entries.map((e) => '${e.key}: ${e.value}').toString();
}
