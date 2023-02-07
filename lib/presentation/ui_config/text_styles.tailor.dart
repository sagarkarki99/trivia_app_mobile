// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'text_styles.dart';

// **************************************************************************
// ThemeTailorGenerator
// **************************************************************************

class TextStyles extends ThemeExtension<TextStyles> {
  const TextStyles({
    required this.h1,
    required this.h2,
    required this.h3,
    required this.h4,
    required this.bodyLarge,
    required this.bodyRegular,
    required this.bodySmall,
    required this.bodyExtraSmall,
  });

  final TextStyle h1;
  final TextStyle h2;
  final TextStyle h3;
  final TextStyle h4;
  final TextStyle bodyLarge;
  final TextStyle bodyRegular;
  final TextStyle bodySmall;
  final TextStyle bodyExtraSmall;

  static final TextStyles light = TextStyles(
    h1: _$TextStyles.h1[0],
    h2: _$TextStyles.h2[0],
    h3: _$TextStyles.h3[0],
    h4: _$TextStyles.h4[0],
    bodyLarge: _$TextStyles.bodyLarge[0],
    bodyRegular: _$TextStyles.bodyRegular[0],
    bodySmall: _$TextStyles.bodySmall[0],
    bodyExtraSmall: _$TextStyles.bodyExtraSmall[0],
  );

  static final themes = [
    light,
  ];

  @override
  TextStyles copyWith({
    TextStyle? h1,
    TextStyle? h2,
    TextStyle? h3,
    TextStyle? h4,
    TextStyle? bodyLarge,
    TextStyle? bodyRegular,
    TextStyle? bodySmall,
    TextStyle? bodyExtraSmall,
  }) {
    return TextStyles(
      h1: h1 ?? this.h1,
      h2: h2 ?? this.h2,
      h3: h3 ?? this.h3,
      h4: h4 ?? this.h4,
      bodyLarge: bodyLarge ?? this.bodyLarge,
      bodyRegular: bodyRegular ?? this.bodyRegular,
      bodySmall: bodySmall ?? this.bodySmall,
      bodyExtraSmall: bodyExtraSmall ?? this.bodyExtraSmall,
    );
  }

  @override
  TextStyles lerp(ThemeExtension<TextStyles>? other, double t) {
    if (other is! TextStyles) return this;
    return TextStyles(
      h1: TextStyle.lerp(h1, other.h1, t)!,
      h2: TextStyle.lerp(h2, other.h2, t)!,
      h3: TextStyle.lerp(h3, other.h3, t)!,
      h4: TextStyle.lerp(h4, other.h4, t)!,
      bodyLarge: TextStyle.lerp(bodyLarge, other.bodyLarge, t)!,
      bodyRegular: TextStyle.lerp(bodyRegular, other.bodyRegular, t)!,
      bodySmall: TextStyle.lerp(bodySmall, other.bodySmall, t)!,
      bodyExtraSmall: TextStyle.lerp(bodyExtraSmall, other.bodyExtraSmall, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TextStyles &&
            const DeepCollectionEquality().equals(h1, other.h1) &&
            const DeepCollectionEquality().equals(h2, other.h2) &&
            const DeepCollectionEquality().equals(h3, other.h3) &&
            const DeepCollectionEquality().equals(h4, other.h4) &&
            const DeepCollectionEquality().equals(bodyLarge, other.bodyLarge) &&
            const DeepCollectionEquality()
                .equals(bodyRegular, other.bodyRegular) &&
            const DeepCollectionEquality().equals(bodySmall, other.bodySmall) &&
            const DeepCollectionEquality()
                .equals(bodyExtraSmall, other.bodyExtraSmall));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(h1),
        const DeepCollectionEquality().hash(h2),
        const DeepCollectionEquality().hash(h3),
        const DeepCollectionEquality().hash(h4),
        const DeepCollectionEquality().hash(bodyLarge),
        const DeepCollectionEquality().hash(bodyRegular),
        const DeepCollectionEquality().hash(bodySmall),
        const DeepCollectionEquality().hash(bodyExtraSmall));
  }
}

extension TextStylesBuildContext on BuildContext {
  TextStyles get textStyles => Theme.of(this).extension<TextStyles>()!;
}
