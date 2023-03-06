// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'app_colors.dart';

// **************************************************************************
// ThemeTailorGenerator
// **************************************************************************

class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.background,
    required this.primary,
    required this.white,
    required this.dark,
    required this.red,
    required this.grey,
    required this.lightBrown,
    required this.lightGreen,
    required this.disabled,
  });

  final Color background;
  final Color primary;
  final Color white;
  final Color dark;
  final Color red;
  final Color grey;
  final Color lightBrown;
  final Color lightGreen;
  final Color disabled;

  static final AppColors light = AppColors(
    background: _$AppColors.background[0],
    primary: _$AppColors.primary[0],
    white: _$AppColors.white[0],
    dark: _$AppColors.dark[0],
    red: _$AppColors.red[0],
    grey: _$AppColors.grey[0],
    lightBrown: _$AppColors.lightBrown[0],
    lightGreen: _$AppColors.lightGreen[0],
    disabled: _$AppColors.disabled[0],
  );

  static final themes = [
    light,
  ];

  @override
  AppColors copyWith({
    Color? background,
    Color? primary,
    Color? white,
    Color? dark,
    Color? red,
    Color? grey,
    Color? lightBrown,
    Color? lightGreen,
    Color? disabled,
  }) {
    return AppColors(
      background: background ?? this.background,
      primary: primary ?? this.primary,
      white: white ?? this.white,
      dark: dark ?? this.dark,
      red: red ?? this.red,
      grey: grey ?? this.grey,
      lightBrown: lightBrown ?? this.lightBrown,
      lightGreen: lightGreen ?? this.lightGreen,
      disabled: disabled ?? this.disabled,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      background: Color.lerp(background, other.background, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      white: Color.lerp(white, other.white, t)!,
      dark: Color.lerp(dark, other.dark, t)!,
      red: Color.lerp(red, other.red, t)!,
      grey: Color.lerp(grey, other.grey, t)!,
      lightBrown: Color.lerp(lightBrown, other.lightBrown, t)!,
      lightGreen: Color.lerp(lightGreen, other.lightGreen, t)!,
      disabled: Color.lerp(disabled, other.disabled, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppColors &&
            const DeepCollectionEquality()
                .equals(background, other.background) &&
            const DeepCollectionEquality().equals(primary, other.primary) &&
            const DeepCollectionEquality().equals(white, other.white) &&
            const DeepCollectionEquality().equals(dark, other.dark) &&
            const DeepCollectionEquality().equals(red, other.red) &&
            const DeepCollectionEquality().equals(grey, other.grey) &&
            const DeepCollectionEquality()
                .equals(lightBrown, other.lightBrown) &&
            const DeepCollectionEquality()
                .equals(lightGreen, other.lightGreen) &&
            const DeepCollectionEquality().equals(disabled, other.disabled));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(background),
        const DeepCollectionEquality().hash(primary),
        const DeepCollectionEquality().hash(white),
        const DeepCollectionEquality().hash(dark),
        const DeepCollectionEquality().hash(red),
        const DeepCollectionEquality().hash(grey),
        const DeepCollectionEquality().hash(lightBrown),
        const DeepCollectionEquality().hash(lightGreen),
        const DeepCollectionEquality().hash(disabled));
  }
}

extension AppColorsBuildContextProps on BuildContext {
  AppColors get _appColors => Theme.of(this).extension<AppColors>()!;
  Color get background => _appColors.background;
  Color get primary => _appColors.primary;
  Color get white => _appColors.white;
  Color get dark => _appColors.dark;
  Color get red => _appColors.red;
  Color get grey => _appColors.grey;
  Color get lightBrown => _appColors.lightBrown;
  Color get lightGreen => _appColors.lightGreen;
  Color get disabled => _appColors.disabled;
}
