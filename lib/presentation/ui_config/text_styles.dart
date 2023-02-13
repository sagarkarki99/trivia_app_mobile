import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:trivia_app/presentation/ui_config/theme_extensions.dart';

import 'app_colors.dart';

part 'text_styles.tailor.dart';

@Tailor(
  themes: ['light'],
  themeGetter: ThemeGetter.onBuildContext,
)
class _$TextStyles {
  static final _base = TextStyle(
    fontFamily: FontNames.quicksand,
    color: AppColors.light.dark,
  );

  static final headline1 = [_base.copyWith(fontSize: 24.0).semiBold];
  static final headline2 = [_base.copyWith(fontSize: 20.0).semiBold];
  static final headline3 = [_base.copyWith(fontSize: 18.0).semiBold];
  static final headline4 = [_base.copyWith(fontSize: 16.0).semiBold];
  static final headline5 = [_base.copyWith(fontSize: 13.0).semiBold];
  static final headline6 = [_base.copyWith(fontSize: 10.0).semiBold];
  static final bodyText1 = [_base.copyWith(fontSize: 14.0).semiBold];
  static final bodyText2 = [_base.copyWith(fontSize: 12.0).semiBold];
  static final subtitle1 = [_base.copyWith(fontSize: 14.0).semiBold];
  static final subtitle2 = [_base.copyWith(fontSize: 12.0).semiBold];
  static final overline = [_base.copyWith(fontSize: 11.0).semiBold];
  static final button = [_base.copyWith(fontSize: 12.0).semiBold];
  static final caption = [_base.copyWith(fontSize: 11.0).regular];

  // static final TextStyle _base = TextStyle(
  //   fontFamily: FontNames.quicksand,
  //   leadingDistribution: TextLeadingDistribution.even,
  // );

  // static List<TextStyle> h1 = [
  //   _base.copyWith(fontSize: 48),
  // ];

  // static List<TextStyle> h2 = [
  //   _base.copyWith(fontSize: 28),
  // ];

  // static List<TextStyle> h3 = [
  //   _base.copyWith(fontSize: 24),
  // ];

  // static List<TextStyle> h4 = [
  //   _base.copyWith(fontSize: 18),
  // ];

  // static List<TextStyle> bodyLarge = [
  //   _base.copyWith(fontSize: 16),
  // ];

  // static List<TextStyle> bodyRegular = [
  //   _base.copyWith(fontSize: 14, fontFamily: FontNames.dongle)
  // ];

  // static List<TextStyle> bodySmall = [
  //   _base.copyWith(fontSize: 12, fontFamily: FontNames.dongle),
  // ];

  // static List<TextStyle> bodyExtraSmall = [
  //   _base.copyWith(fontSize: 10, fontFamily: FontNames.dongle)
  // ];
}

class FontNames {
  static String quicksand = 'Quicksand';
  static String dongle = 'Dongle';
}
