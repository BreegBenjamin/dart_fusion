/// A library that brings together a harmonious blend of essential tools, utilities, and components designed to supercharge your Dart projects.

library dart_fusion;

import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

part 'src/d_behavior.dart';
part 'src/d_image.dart';
part 'src/d_log.dart';
part 'src/d_state_widget.dart';
part 'src/d_builder.dart';
part 'src/d_extensions.dart';
part 'src/d_button.dart';
part 'src/d_models.dart';
part 'src/d_overlay.dart';
part 'src/d_typedefs.dart';
part 'src/d_parse.dart';
part 'src/d_textarea.dart';
part 'src/d_annotation.dart';

class DartFusion {
  static Future<void> initialize({
    bool asset = true,
    bool model = true,
    String? localizationAPI,
  }) async {
    if (kDebugMode) {
      try {
        if (asset) {
          final process = await Process.run(
              'dart', ['run', 'dart_fusion', 'asset'],
              runInShell: true);
          print('\x1B[33m[Asset]\x1B[0m ${process.stdout}${process.stderr}');
        }
        if (model) {
          final process = await Process.run(
              'dart', ['run', 'dart_fusion', 'model'],
              runInShell: true);
          print('\x1B[33m[Model]\x1B[0m ${process.stdout}${process.stderr}');
        }
        if (localizationAPI != null) {
          final process = await Process.run(
              'dart',
              [
                'run',
                'dart_fusion',
                'localize',
                '--api-key="$localizationAPI"',
              ],
              runInShell: true);
          print('\x1B[33m[Localize]\x1B[0m ${process.stdout}${process.stderr}');
        }
      } catch (e) {
        print(e);
      }
    }
  }
}