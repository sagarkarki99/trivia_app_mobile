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
  static List<Color> dark = [const Color(0xFF1F2633)];
  static List<Color> red = [const Color(0xFFD81F26)];
  static List<Color> grey = [const Color(0xFFF0F3F5)];
  static List<Color> lightBrown = [const Color(0xFFF1EDEA)];
  static List<Color> lightGreen = [const Color(0xFFBAD9D7)];
  static List<Color> disabled = [const Color(0xFFDDDDDD)];
}
