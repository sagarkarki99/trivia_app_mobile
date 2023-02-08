import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'app_colors.tailor.dart';

@Tailor(themes: ['light'])
class _$AppColors {
  static List<Color> background = [
    const Color(0xFFF0EDF7),
    const Color(0XFFF0F8F7)
  ];
  static List<Color> primary = [
    const Color.fromARGB(255, 32, 7, 90),
  ];

  static List<Color> white = [const Color(0XFFFFFFFF)];
  static List<Color> disabled = [const Color(0xFFDDDDDD)];
  static List<Color> green1 = [const Color(0xFF0097A7)];
  static List<Color> green2 = [const Color(0xFF00796B)];
  static List<Color> green3 = [const Color(0xFF388E3C)];
  static List<Color> green4 = [const Color(0xFF689F38)];
}
