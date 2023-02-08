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
    required this.disabled,
    required this.green1,
    required this.green2,
    required this.green3,
    required this.green4,
  });

  final Color background;
  final Color primary;
  final Color white;
  final Color disabled;
  final Color green1;
  final Color green2;
  final Color green3;
  final Color green4;

  static final AppColors light = AppColors(
    background: _$AppColors.background[0],
    primary: _$AppColors.primary[0],
    white: _$AppColors.white[0],
    disabled: _$AppColors.disabled[0],
    green1: _$AppColors.green1[0],
    green2: _$AppColors.green2[0],
    green3: _$AppColors.green3[0],
    green4: _$AppColors.green4[0],
  );

  static final themes = [
    light,
  ];

  @override
  AppColors copyWith({
    Color? background,
    Color? primary,
    Color? white,
    Color? disabled,
    Color? green1,
    Color? green2,
    Color? green3,
    Color? green4,
  }) {
    return AppColors(
      background: background ?? this.background,
      primary: primary ?? this.primary,
      white: white ?? this.white,
      disabled: disabled ?? this.disabled,
      green1: green1 ?? this.green1,
      green2: green2 ?? this.green2,
      green3: green3 ?? this.green3,
      green4: green4 ?? this.green4,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      background: Color.lerp(background, other.background, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      white: Color.lerp(white, other.white, t)!,
      disabled: Color.lerp(disabled, other.disabled, t)!,
      green1: Color.lerp(green1, other.green1, t)!,
      green2: Color.lerp(green2, other.green2, t)!,
      green3: Color.lerp(green3, other.green3, t)!,
      green4: Color.lerp(green4, other.green4, t)!,
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
            const DeepCollectionEquality().equals(disabled, other.disabled) &&
            const DeepCollectionEquality().equals(green1, other.green1) &&
            const DeepCollectionEquality().equals(green2, other.green2) &&
            const DeepCollectionEquality().equals(green3, other.green3) &&
            const DeepCollectionEquality().equals(green4, other.green4));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(background),
        const DeepCollectionEquality().hash(primary),
        const DeepCollectionEquality().hash(white),
        const DeepCollectionEquality().hash(disabled),
        const DeepCollectionEquality().hash(green1),
        const DeepCollectionEquality().hash(green2),
        const DeepCollectionEquality().hash(green3),
        const DeepCollectionEquality().hash(green4));
  }
}

extension AppColorsBuildContextProps on BuildContext {
  AppColors get _appColors => Theme.of(this).extension<AppColors>()!;
  Color get background => _appColors.background;
  Color get primary => _appColors.primary;
  Color get white => _appColors.white;
  Color get disabled => _appColors.disabled;
  Color get green1 => _appColors.green1;
  Color get green2 => _appColors.green2;
  Color get green3 => _appColors.green3;
  Color get green4 => _appColors.green4;
}
