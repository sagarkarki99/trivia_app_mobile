import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'text_styles.tailor.dart';

@Tailor(
  themes: ['light'],
  themeGetter: ThemeGetter.onBuildContext,
)
class _$TextStyles {
  static final TextStyle _base = TextStyle(
    fontFamily: FontNames.quicksand,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static List<TextStyle> h1 = [
    _base.copyWith(fontSize: 48),
  ];

  static List<TextStyle> h2 = [
    _base.copyWith(fontSize: 28),
  ];

  static List<TextStyle> h3 = [
    _base.copyWith(fontSize: 24),
  ];

  static List<TextStyle> h4 = [
    _base.copyWith(fontSize: 18),
  ];

  static List<TextStyle> bodyLarge = [
    _base.copyWith(fontSize: 16),
  ];

  static List<TextStyle> bodyRegular = [
    _base.copyWith(fontSize: 14, fontFamily: FontNames.dongle)
  ];

  static List<TextStyle> bodySmall = [
    _base.copyWith(fontSize: 12, fontFamily: FontNames.dongle),
  ];

  static List<TextStyle> bodyExtraSmall = [
    _base.copyWith(fontSize: 10, fontFamily: FontNames.dongle)
  ];
}

class FontNames {
  static String quicksand = 'Quicksand';
  static String dongle = 'Dongle';
}

class AppTextTheme {
  static TextTheme get instance => const TextTheme().copyWith(
        headlineLarge: TextStyles.light.h1,
        headlineMedium: TextStyles.light.h2,
        headlineSmall: TextStyles.light.h3,
        displayLarge: TextStyles.light.h4,
        displayMedium: TextStyles.light.bodyLarge,
        displaySmall: TextStyles.light.bodyRegular,
        bodyLarge: TextStyles.light.bodyLarge,
        bodyMedium: TextStyles.light.bodyRegular,
        bodySmall: TextStyles.light.bodySmall,
        titleLarge: TextStyles.light.h4,
        titleMedium: TextStyles.light.bodyLarge,
        titleSmall: TextStyles.light.bodySmall,
        labelLarge: TextStyles.light.bodyLarge,
        labelMedium: TextStyles.light.bodyRegular,
        labelSmall: TextStyles.light.bodySmall,
      );
}
