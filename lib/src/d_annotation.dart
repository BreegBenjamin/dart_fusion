part of '../dart_fusion.dart';

/// Annotation of variable inside a class with [Model] annotation.
///
/// ```dart
/// @variable
/// final DModel value;
///
/// // or you can annotate it like this
///
/// @Variable(name: 'd_model', toJSON: true, fromJSON: true)
/// final DModel value;
/// ```
///
/// when you run
/// ```bash
/// dart run dart_fusion model
/// ```
///
/// the variable will be used in [Model.fromJSON], [Model.toJSON] and [Model.copyWith].
/// resulting something like
///
/// ```dart
/// class MyClass {
///   MyClass copyWith(DModel? value) {
///     return MyClass(value: value ?? this.value);
///   }
///
///   JSON get toJSON => {'d_model': value};
///
///   static MyClass fromJSON(JSON value){
///     return MyClass(value: DModel.fromJSON(value.of<JSON>('d_model')));
///   }
/// }
///
/// ```
class Variable {
  /// Default constructor of [Variable], with [toJSON] defaults to `false`
  /// [fromJSON] default to `false`.
  const Variable({
    this.name,
    this.toJSON = false,
    this.fromJSON = false,
    this.defaultsTo,
  });

  /// Json key value
  ///
  /// ```dart
  /// @Variable(name: 'sample_test')
  /// final String test;
  /// ```
  final String? name;

  /// Is variable has [toJSON] function or not.
  ///
  /// ```dart
  /// @Variable(toJSON: true)
  /// final ExtendedDModel model;
  /// ```
  final bool toJSON;

  /// Is variable has [fromJSON] function or not.
  ///
  /// ```dart
  /// @Variable(fromJSON: true)
  /// final ExtendedDModel model;
  /// ```
  final bool fromJSON;

  /// Default value if the expected value is null.
  ///
  /// ```dart
  /// @Variable(defaultsTo: 'Lorem ipsum')
  /// final String test;
  /// ```
  final Object? defaultsTo;
}

/// Annotation of class as an indicator to generate a [fromJSON],
/// [toJSON] and [copyWith] inside the annotated class.
///
/// ```dart
/// @model
/// class MyClass extends DModel {}
///
/// // or you can annotate it like this
///
/// @Model(immutable: false, copyWith: false)
/// class MyClass extends DModel {}
/// ```
class Model {
  /// Default constructor of [Model], with [immutable] defaults to `true`,
  /// [toJSON] defaults to `true`, [copyWith] defaults to `true`,
  /// [fromJSON] defaults to `true`.
  const Model({
    this.immutable = true,
    this.toJSON = true,
    this.copyWith = true,
    this.fromJSON = true,
    this.test = true,
  });

  /// Indicates whether code for JSON serialization should be generated or not.
  final bool toJSON;

  /// Indicates whether code for generating copy methods should be generated or not.
  final bool copyWith;

  /// Indicates whether code for JSON deserialization should be generated or not.
  final bool fromJSON;

  /// Whether class is immutable or not.
  final bool immutable;

  /// Whether want to generate test model or not.
  final bool test;
}

/// A constant instance of [Variable] to be used as an annotation.
/// Use this constant as an annotation on variable to specify
/// wether its part of code generation or not.
///
/// ```dart
/// @variable
/// final DModel value;
///
/// // or you can annotate it like this
///
/// @Variable(name: 'd_model', toJSON: true, fromJSON: true)
/// final DModel value;
/// ```
const Variable variable = Variable();

/// A constant instance of [Model] to be used as an annotation.
/// Use this constant as an annotation on classes to specify
/// wether its part of code generation or not.
///
/// ```dart
/// @model
/// class MyClass extends DModel {}
///
/// // or you can annotate it like this
///
/// @Model(immutable: false, copyWith: false)
/// class MyClass extends DModel {}
/// ```
const Model model = Model();
