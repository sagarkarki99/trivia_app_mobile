// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuestionPayload _$QuestionPayloadFromJson(Map<String, dynamic> json) {
  return _QuestionPayload.fromJson(json);
}

/// @nodoc
mixin _$QuestionPayload {
  String get question => throw _privateConstructorUsedError;
  List<String> get answerOptions => throw _privateConstructorUsedError;
  String get correctAnswer => throw _privateConstructorUsedError;
  int get totalSeconds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionPayloadCopyWith<QuestionPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionPayloadCopyWith<$Res> {
  factory $QuestionPayloadCopyWith(
          QuestionPayload value, $Res Function(QuestionPayload) then) =
      _$QuestionPayloadCopyWithImpl<$Res, QuestionPayload>;
  @useResult
  $Res call(
      {String question,
      List<String> answerOptions,
      String correctAnswer,
      int totalSeconds});
}

/// @nodoc
class _$QuestionPayloadCopyWithImpl<$Res, $Val extends QuestionPayload>
    implements $QuestionPayloadCopyWith<$Res> {
  _$QuestionPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? answerOptions = null,
    Object? correctAnswer = null,
    Object? totalSeconds = null,
  }) {
    return _then(_value.copyWith(
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answerOptions: null == answerOptions
          ? _value.answerOptions
          : answerOptions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      correctAnswer: null == correctAnswer
          ? _value.correctAnswer
          : correctAnswer // ignore: cast_nullable_to_non_nullable
              as String,
      totalSeconds: null == totalSeconds
          ? _value.totalSeconds
          : totalSeconds // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuestionPayloadCopyWith<$Res>
    implements $QuestionPayloadCopyWith<$Res> {
  factory _$$_QuestionPayloadCopyWith(
          _$_QuestionPayload value, $Res Function(_$_QuestionPayload) then) =
      __$$_QuestionPayloadCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String question,
      List<String> answerOptions,
      String correctAnswer,
      int totalSeconds});
}

/// @nodoc
class __$$_QuestionPayloadCopyWithImpl<$Res>
    extends _$QuestionPayloadCopyWithImpl<$Res, _$_QuestionPayload>
    implements _$$_QuestionPayloadCopyWith<$Res> {
  __$$_QuestionPayloadCopyWithImpl(
      _$_QuestionPayload _value, $Res Function(_$_QuestionPayload) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? answerOptions = null,
    Object? correctAnswer = null,
    Object? totalSeconds = null,
  }) {
    return _then(_$_QuestionPayload(
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answerOptions: null == answerOptions
          ? _value._answerOptions
          : answerOptions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      correctAnswer: null == correctAnswer
          ? _value.correctAnswer
          : correctAnswer // ignore: cast_nullable_to_non_nullable
              as String,
      totalSeconds: null == totalSeconds
          ? _value.totalSeconds
          : totalSeconds // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuestionPayload implements _QuestionPayload {
  const _$_QuestionPayload(
      {required this.question,
      required final List<String> answerOptions,
      required this.correctAnswer,
      required this.totalSeconds})
      : _answerOptions = answerOptions;

  factory _$_QuestionPayload.fromJson(Map<String, dynamic> json) =>
      _$$_QuestionPayloadFromJson(json);

  @override
  final String question;
  final List<String> _answerOptions;
  @override
  List<String> get answerOptions {
    if (_answerOptions is EqualUnmodifiableListView) return _answerOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answerOptions);
  }

  @override
  final String correctAnswer;
  @override
  final int totalSeconds;

  @override
  String toString() {
    return 'QuestionPayload(question: $question, answerOptions: $answerOptions, correctAnswer: $correctAnswer, totalSeconds: $totalSeconds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuestionPayload &&
            (identical(other.question, question) ||
                other.question == question) &&
            const DeepCollectionEquality()
                .equals(other._answerOptions, _answerOptions) &&
            (identical(other.correctAnswer, correctAnswer) ||
                other.correctAnswer == correctAnswer) &&
            (identical(other.totalSeconds, totalSeconds) ||
                other.totalSeconds == totalSeconds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      question,
      const DeepCollectionEquality().hash(_answerOptions),
      correctAnswer,
      totalSeconds);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionPayloadCopyWith<_$_QuestionPayload> get copyWith =>
      __$$_QuestionPayloadCopyWithImpl<_$_QuestionPayload>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuestionPayloadToJson(
      this,
    );
  }
}

abstract class _QuestionPayload implements QuestionPayload {
  const factory _QuestionPayload(
      {required final String question,
      required final List<String> answerOptions,
      required final String correctAnswer,
      required final int totalSeconds}) = _$_QuestionPayload;

  factory _QuestionPayload.fromJson(Map<String, dynamic> json) =
      _$_QuestionPayload.fromJson;

  @override
  String get question;
  @override
  List<String> get answerOptions;
  @override
  String get correctAnswer;
  @override
  int get totalSeconds;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionPayloadCopyWith<_$_QuestionPayload> get copyWith =>
      throw _privateConstructorUsedError;
}
