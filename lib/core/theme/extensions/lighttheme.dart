import 'package:flutter/material.dart';
import 'package:movieapp_cleanarchitrcture/core/theme/extensions/app_colorplette.dart';
import 'package:movieapp_cleanarchitrcture/core/theme/extensions/color_extension.dart';
import 'package:movieapp_cleanarchitrcture/core/theme/extensions/space_extension.dart';
import 'package:movieapp_cleanarchitrcture/core/theme/extensions/typography_extension.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'lighttheme.g.dart';

final _lightTheme = ThemeData(
  brightness: Brightness.light,
  extensions: [
    AppColorExtension(
      primary: Colors.yellow,
      secondary: AppColorPalette.yellow100,
      text: AppColorPalette.grey900,
      textInverse: Colors.white,
      textSubtle: AppColorPalette.grey700,
      textSubtlest: AppColorPalette.grey500,
      backgroundDanger: Colors.red,
    ),
    AppSpaceExtension.fromBaseSpace(8),
    AppTypographyExtension.fromColors(
      defaultFontColor: AppColorPalette.grey900,
      linkColor: Colors.blue,
      dimFontColor: AppColorPalette.grey700,
    )
  ],
);

@riverpod
ThemeData lightTheme(LightThemeRef ref) {
  return _lightTheme;
}
