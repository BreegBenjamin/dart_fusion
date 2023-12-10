part of '../../dart_fusion.dart';

/// Extension on numeric types (int, double) to add utility methods for limiting values within a specified range.
extension NumberExtension<Number extends num> on Number {
  /// Returns the greater of this number and [min]. If this number is less than [min], [min] will be returned.
  ///
  /// ```dart
  /// int min = 5.min(10);
  /// print(min); // 10
  /// ```
  Number min(Number min) => this < min ? min : this;

  /// Returns the lesser of this number and [max]. If this number is greater than [max], [max] will be returned.
  ///
  /// ```dart
  /// double max = 100.0.max(10.0);
  /// print(max); // 10.0
  /// ```
  Number max(Number max) => this > max ? max : this;

  /// Returns this number, clamped to the range of [min] to [max].
  ///
  /// If this number is less than [min], [min] will be returned.
  /// If this number is greater than [max], [max] will be returned.
  /// Otherwise, this number will be returned unchanged.
  ///
  /// ```dart
  /// int number = 75.limit(0, 100);
  /// print(number); // 75
  /// ```
  Number limit(Number min, Number max) => this < min
      ? min
      : this > max
          ? max
          : this;
}

/// Extension on [int] to provide additional functionality.
extension IntegerExtension on int {
  /// Converts the integer to a human-readable string representing bytes, KB, MB, or GB.
  ///
  /// Returns a string representation of the size in bytes, KB, MB, or GB.
  ///
  /// ```dart
  /// int bytes = 1048576;
  /// String parse = bytes.toReadableBytes;
  /// print(parse); // "1048.57 KB"
  /// ```
  String get toReadableBytes {
    if (this < 1024) {
      return '$this B';
    } else if (this < 1024 * 1024) {
      double sizeInKB = this / 1024;
      return '${sizeInKB.toStringAsFixed(2)} KB';
    } else if (this < 1024 * 1024 * 1024) {
      double sizeInMB = this / (1024 * 1024);
      return '${sizeInMB.toStringAsFixed(2)} MB';
    } else {
      double sizeInGB = this / (1024 * 1024 * 1024);
      return '${sizeInGB.toStringAsFixed(2)} GB';
    }
  }
}
