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
      primary: AppColorPalette.black600,
      secondary: AppColorPalette.yellow100,
      text: AppColorPalette.grey900,
      textInverse: const Color.fromARGB(255, 149, 5, 5),
      textSubtle: AppColorPalette.grey700,
      textSubtlest: AppColorPalette.grey500,
      backgroundDanger: AppColorPalette.black500,
    ),
    AppSpaceExtension.fromBaseSpace(8),
    AppTypographyExtension.fromColors(
      defaultFontColor: const Color.fromARGB(255, 162, 132, 132),
      linkColor: Colors.blue,
      dimFontColor: AppColorPalette.grey700,
    )
  ],
);

@riverpod
ThemeData lightTheme(LightThemeRef ref) {
  return _lightTheme;
}
