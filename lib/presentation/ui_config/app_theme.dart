import 'package:flutter/material.dart';
import 'package:trivia_app/presentation/ui_config/app_colors.dart';
import 'package:trivia_app/presentation/ui_config/text_styles.dart';

class AppTheme {
  static AppColors get appColor => AppColors.light;

  static ThemeData get light => ThemeData(
        backgroundColor: appColor.background,
        textTheme: textTheme,
        brightness: Brightness.light,
      );

  static TextTheme get textTheme => TextTheme(
        headline1: TextStyles.light.headline1,
        headline2: TextStyles.light.headline2,
        headline3: TextStyles.light.headline3,
        headline4: TextStyles.light.headline4,
        headline5: TextStyles.light.headline5,
        headline6: TextStyles.light.headline6,
        bodyText1: TextStyles.light.bodyText1,
        bodyText2: TextStyles.light.bodyText2,
        subtitle1: TextStyles.light.subtitle1,
        subtitle2: TextStyles.light.subtitle2,
        overline: TextStyles.light.overline,
        button: TextStyles.light.button,
        caption: TextStyles.light.caption,
      );
}
