// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'text_styles.dart';

// **************************************************************************
// ThemeTailorGenerator
// **************************************************************************

class TextStyles extends ThemeExtension<TextStyles> {
  const TextStyles({
    required this.headline1,
    required this.headline2,
    required this.headline3,
    required this.headline4,
    required this.headline5,
    required this.headline6,
    required this.bodyText1,
    required this.bodyText2,
    required this.subtitle1,
    required this.subtitle2,
    required this.overline,
    required this.button,
    required this.caption,
  });

  final TextStyle headline1;
  final TextStyle headline2;
  final TextStyle headline3;
  final TextStyle headline4;
  final TextStyle headline5;
  final TextStyle headline6;
  final TextStyle bodyText1;
  final TextStyle bodyText2;
  final TextStyle subtitle1;
  final TextStyle subtitle2;
  final TextStyle overline;
  final TextStyle button;
  final TextStyle caption;

  static final TextStyles light = TextStyles(
    headline1: _$TextStyles.headline1[0],
    headline2: _$TextStyles.headline2[0],
    headline3: _$TextStyles.headline3[0],
    headline4: _$TextStyles.headline4[0],
    headline5: _$TextStyles.headline5[0],
    headline6: _$TextStyles.headline6[0],
    bodyText1: _$TextStyles.bodyText1[0],
    bodyText2: _$TextStyles.bodyText2[0],
    subtitle1: _$TextStyles.subtitle1[0],
    subtitle2: _$TextStyles.subtitle2[0],
    overline: _$TextStyles.overline[0],
    button: _$TextStyles.button[0],
    caption: _$TextStyles.caption[0],
  );

  static final themes = [
    light,
  ];

  @override
  TextStyles copyWith({
    TextStyle? headline1,
    TextStyle? headline2,
    TextStyle? headline3,
    TextStyle? headline4,
    TextStyle? headline5,
    TextStyle? headline6,
    TextStyle? bodyText1,
    TextStyle? bodyText2,
    TextStyle? subtitle1,
    TextStyle? subtitle2,
    TextStyle? overline,
    TextStyle? button,
    TextStyle? caption,
  }) {
    return TextStyles(
      headline1: headline1 ?? this.headline1,
      headline2: headline2 ?? this.headline2,
      headline3: headline3 ?? this.headline3,
      headline4: headline4 ?? this.headline4,
      headline5: headline5 ?? this.headline5,
      headline6: headline6 ?? this.headline6,
      bodyText1: bodyText1 ?? this.bodyText1,
      bodyText2: bodyText2 ?? this.bodyText2,
      subtitle1: subtitle1 ?? this.subtitle1,
      subtitle2: subtitle2 ?? this.subtitle2,
      overline: overline ?? this.overline,
      button: button ?? this.button,
      caption: caption ?? this.caption,
    );
  }

  @override
  TextStyles lerp(ThemeExtension<TextStyles>? other, double t) {
    if (other is! TextStyles) return this;
    return TextStyles(
      headline1: TextStyle.lerp(headline1, other.headline1, t)!,
      headline2: TextStyle.lerp(headline2, other.headline2, t)!,
      headline3: TextStyle.lerp(headline3, other.headline3, t)!,
      headline4: TextStyle.lerp(headline4, other.headline4, t)!,
      headline5: TextStyle.lerp(headline5, other.headline5, t)!,
      headline6: TextStyle.lerp(headline6, other.headline6, t)!,
      bodyText1: TextStyle.lerp(bodyText1, other.bodyText1, t)!,
      bodyText2: TextStyle.lerp(bodyText2, other.bodyText2, t)!,
      subtitle1: TextStyle.lerp(subtitle1, other.subtitle1, t)!,
      subtitle2: TextStyle.lerp(subtitle2, other.subtitle2, t)!,
      overline: TextStyle.lerp(overline, other.overline, t)!,
      button: TextStyle.lerp(button, other.button, t)!,
      caption: TextStyle.lerp(caption, other.caption, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TextStyles &&
            const DeepCollectionEquality().equals(headline1, other.headline1) &&
            const DeepCollectionEquality().equals(headline2, other.headline2) &&
            const DeepCollectionEquality().equals(headline3, other.headline3) &&
            const DeepCollectionEquality().equals(headline4, other.headline4) &&
            const DeepCollectionEquality().equals(headline5, other.headline5) &&
            const DeepCollectionEquality().equals(headline6, other.headline6) &&
            const DeepCollectionEquality().equals(bodyText1, other.bodyText1) &&
            const DeepCollectionEquality().equals(bodyText2, other.bodyText2) &&
            const DeepCollectionEquality().equals(subtitle1, other.subtitle1) &&
            const DeepCollectionEquality().equals(subtitle2, other.subtitle2) &&
            const DeepCollectionEquality().equals(overline, other.overline) &&
            const DeepCollectionEquality().equals(button, other.button) &&
            const DeepCollectionEquality().equals(caption, other.caption));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(headline1),
        const DeepCollectionEquality().hash(headline2),
        const DeepCollectionEquality().hash(headline3),
        const DeepCollectionEquality().hash(headline4),
        const DeepCollectionEquality().hash(headline5),
        const DeepCollectionEquality().hash(headline6),
        const DeepCollectionEquality().hash(bodyText1),
        const DeepCollectionEquality().hash(bodyText2),
        const DeepCollectionEquality().hash(subtitle1),
        const DeepCollectionEquality().hash(subtitle2),
        const DeepCollectionEquality().hash(overline),
        const DeepCollectionEquality().hash(button),
        const DeepCollectionEquality().hash(caption));
  }
}

extension TextStylesBuildContext on BuildContext {
  TextStyles get textStyles => Theme.of(this).extension<TextStyles>()!;
}
