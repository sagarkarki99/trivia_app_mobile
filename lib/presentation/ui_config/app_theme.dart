import 'package:flutter/material.dart';
import 'package:trivia_app/presentation/ui_config/app_colors.dart';
import 'package:trivia_app/presentation/ui_config/text_styles.dart';

class AppTheme {
  static AppColors get appColor => AppColors.light;

  static ThemeData get light => ThemeData(
        backgroundColor: appColor.background,
        textTheme: AppTextTheme.instance,
      );
}
