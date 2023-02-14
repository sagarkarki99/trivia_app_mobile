// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'round_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RoundState {
  RoundStatus get status => throw _privateConstructorUsedError;
  List<Answer> get answers => throw _privateConstructorUsedError;
  String get selectedAnswer => throw _privateConstructorUsedError;
  QuestionPayload get questionPayload => throw _privateConstructorUsedError;
  int get remainingMilliseconds => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RoundStateCopyWith<RoundState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoundStateCopyWith<$Res> {
  factory $RoundStateCopyWith(
          RoundState value, $Res Function(RoundState) then) =
      _$RoundStateCopyWithImpl<$Res, RoundState>;
  @useResult
  $Res call(
      {RoundStatus status,
      List<Answer> answers,
      String selectedAnswer,
      QuestionPayload questionPayload,
      int remainingMilliseconds});

  $RoundStatusCopyWith<$Res> get status;
  $QuestionPayloadCopyWith<$Res> get questionPayload;
}

/// @nodoc
class _$RoundStateCopyWithImpl<$Res, $Val extends RoundState>
    implements $RoundStateCopyWith<$Res> {
  _$RoundStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? answers = null,
    Object? selectedAnswer = null,
    Object? questionPayload = null,
    Object? remainingMilliseconds = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RoundStatus,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<Answer>,
      selectedAnswer: null == selectedAnswer
          ? _value.selectedAnswer
          : selectedAnswer // ignore: cast_nullable_to_non_nullable
              as String,
      questionPayload: null == questionPayload
          ? _value.questionPayload
          : questionPayload // ignore: cast_nullable_to_non_nullable
              as QuestionPayload,
      remainingMilliseconds: null == remainingMilliseconds
          ? _value.remainingMilliseconds
          : remainingMilliseconds // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RoundStatusCopyWith<$Res> get status {
    return $RoundStatusCopyWith<$Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $QuestionPayloadCopyWith<$Res> get questionPayload {
    return $QuestionPayloadCopyWith<$Res>(_value.questionPayload, (value) {
      return _then(_value.copyWith(questionPayload: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_RoundStateCopyWith<$Res>
    implements $RoundStateCopyWith<$Res> {
  factory _$$_RoundStateCopyWith(
          _$_RoundState value, $Res Function(_$_RoundState) then) =
      __$$_RoundStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RoundStatus status,
      List<Answer> answers,
      String selectedAnswer,
      QuestionPayload questionPayload,
      int remainingMilliseconds});

  @override
  $RoundStatusCopyWith<$Res> get status;
  @override
  $QuestionPayloadCopyWith<$Res> get questionPayload;
}

/// @nodoc
class __$$_RoundStateCopyWithImpl<$Res>
    extends _$RoundStateCopyWithImpl<$Res, _$_RoundState>
    implements _$$_RoundStateCopyWith<$Res> {
  __$$_RoundStateCopyWithImpl(
      _$_RoundState _value, $Res Function(_$_RoundState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? answers = null,
    Object? selectedAnswer = null,
    Object? questionPayload = null,
    Object? remainingMilliseconds = null,
  }) {
    return _then(_$_RoundState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RoundStatus,
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<Answer>,
      selectedAnswer: null == selectedAnswer
          ? _value.selectedAnswer
          : selectedAnswer // ignore: cast_nullable_to_non_nullable
              as String,
      questionPayload: null == questionPayload
          ? _value.questionPayload
          : questionPayload // ignore: cast_nullable_to_non_nullable
              as QuestionPayload,
      remainingMilliseconds: null == remainingMilliseconds
          ? _value.remainingMilliseconds
          : remainingMilliseconds // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_RoundState extends _RoundState {
  const _$_RoundState(
      {this.status = const RoundStatus.initial(),
      final List<Answer> answers = const [],
      this.selectedAnswer = '',
      required this.questionPayload,
      required this.remainingMilliseconds})
      : _answers = answers,
        super._();

  @override
  @JsonKey()
  final RoundStatus status;
  final List<Answer> _answers;
  @override
  @JsonKey()
  List<Answer> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  @JsonKey()
  final String selectedAnswer;
  @override
  final QuestionPayload questionPayload;
  @override
  final int remainingMilliseconds;

  @override
  String toString() {
    return 'RoundState(status: $status, answers: $answers, selectedAnswer: $selectedAnswer, questionPayload: $questionPayload, remainingMilliseconds: $remainingMilliseconds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RoundState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            (identical(other.selectedAnswer, selectedAnswer) ||
                other.selectedAnswer == selectedAnswer) &&
            (identical(other.questionPayload, questionPayload) ||
                other.questionPayload == questionPayload) &&
            (identical(other.remainingMilliseconds, remainingMilliseconds) ||
                other.remainingMilliseconds == remainingMilliseconds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_answers),
      selectedAnswer,
      questionPayload,
      remainingMilliseconds);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RoundStateCopyWith<_$_RoundState> get copyWith =>
      __$$_RoundStateCopyWithImpl<_$_RoundState>(this, _$identity);
}

abstract class _RoundState extends RoundState {
  const factory _RoundState(
      {final RoundStatus status,
      final List<Answer> answers,
      final String selectedAnswer,
      required final QuestionPayload questionPayload,
      required final int remainingMilliseconds}) = _$_RoundState;
  const _RoundState._() : super._();

  @override
  RoundStatus get status;
  @override
  List<Answer> get answers;
  @override
  String get selectedAnswer;
  @override
  QuestionPayload get questionPayload;
  @override
  int get remainingMilliseconds;
  @override
  @JsonKey(ignore: true)
  _$$_RoundStateCopyWith<_$_RoundState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RoundStatus {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() newAnswerRecieved,
    required TResult Function() newAnswerSubmitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? newAnswerRecieved,
    TResult? Function()? newAnswerSubmitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? newAnswerRecieved,
    TResult Function()? newAnswerSubmitted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_NewAnswerRecieved value) newAnswerRecieved,
    required TResult Function(_NewAnswerSubmitted value) newAnswerSubmitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_NewAnswerRecieved value)? newAnswerRecieved,
    TResult? Function(_NewAnswerSubmitted value)? newAnswerSubmitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_NewAnswerRecieved value)? newAnswerRecieved,
    TResult Function(_NewAnswerSubmitted value)? newAnswerSubmitted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoundStatusCopyWith<$Res> {
  factory $RoundStatusCopyWith(
          RoundStatus value, $Res Function(RoundStatus) then) =
      _$RoundStatusCopyWithImpl<$Res, RoundStatus>;
}

/// @nodoc
class _$RoundStatusCopyWithImpl<$Res, $Val extends RoundStatus>
    implements $RoundStatusCopyWith<$Res> {
  _$RoundStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$RoundStatusCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'RoundStatus.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() newAnswerRecieved,
    required TResult Function() newAnswerSubmitted,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? newAnswerRecieved,
    TResult? Function()? newAnswerSubmitted,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? newAnswerRecieved,
    TResult Function()? newAnswerSubmitted,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_NewAnswerRecieved value) newAnswerRecieved,
    required TResult Function(_NewAnswerSubmitted value) newAnswerSubmitted,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_NewAnswerRecieved value)? newAnswerRecieved,
    TResult? Function(_NewAnswerSubmitted value)? newAnswerSubmitted,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_NewAnswerRecieved value)? newAnswerRecieved,
    TResult Function(_NewAnswerSubmitted value)? newAnswerSubmitted,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements RoundStatus {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_NewAnswerRecievedCopyWith<$Res> {
  factory _$$_NewAnswerRecievedCopyWith(_$_NewAnswerRecieved value,
          $Res Function(_$_NewAnswerRecieved) then) =
      __$$_NewAnswerRecievedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_NewAnswerRecievedCopyWithImpl<$Res>
    extends _$RoundStatusCopyWithImpl<$Res, _$_NewAnswerRecieved>
    implements _$$_NewAnswerRecievedCopyWith<$Res> {
  __$$_NewAnswerRecievedCopyWithImpl(
      _$_NewAnswerRecieved _value, $Res Function(_$_NewAnswerRecieved) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_NewAnswerRecieved implements _NewAnswerRecieved {
  const _$_NewAnswerRecieved();

  @override
  String toString() {
    return 'RoundStatus.newAnswerRecieved()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_NewAnswerRecieved);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() newAnswerRecieved,
    required TResult Function() newAnswerSubmitted,
  }) {
    return newAnswerRecieved();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? newAnswerRecieved,
    TResult? Function()? newAnswerSubmitted,
  }) {
    return newAnswerRecieved?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? newAnswerRecieved,
    TResult Function()? newAnswerSubmitted,
    required TResult orElse(),
  }) {
    if (newAnswerRecieved != null) {
      return newAnswerRecieved();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_NewAnswerRecieved value) newAnswerRecieved,
    required TResult Function(_NewAnswerSubmitted value) newAnswerSubmitted,
  }) {
    return newAnswerRecieved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_NewAnswerRecieved value)? newAnswerRecieved,
    TResult? Function(_NewAnswerSubmitted value)? newAnswerSubmitted,
  }) {
    return newAnswerRecieved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_NewAnswerRecieved value)? newAnswerRecieved,
    TResult Function(_NewAnswerSubmitted value)? newAnswerSubmitted,
    required TResult orElse(),
  }) {
    if (newAnswerRecieved != null) {
      return newAnswerRecieved(this);
    }
    return orElse();
  }
}

abstract class _NewAnswerRecieved implements RoundStatus {
  const factory _NewAnswerRecieved() = _$_NewAnswerRecieved;
}

/// @nodoc
abstract class _$$_NewAnswerSubmittedCopyWith<$Res> {
  factory _$$_NewAnswerSubmittedCopyWith(_$_NewAnswerSubmitted value,
          $Res Function(_$_NewAnswerSubmitted) then) =
      __$$_NewAnswerSubmittedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_NewAnswerSubmittedCopyWithImpl<$Res>
    extends _$RoundStatusCopyWithImpl<$Res, _$_NewAnswerSubmitted>
    implements _$$_NewAnswerSubmittedCopyWith<$Res> {
  __$$_NewAnswerSubmittedCopyWithImpl(
      _$_NewAnswerSubmitted _value, $Res Function(_$_NewAnswerSubmitted) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_NewAnswerSubmitted implements _NewAnswerSubmitted {
  const _$_NewAnswerSubmitted();

  @override
  String toString() {
    return 'RoundStatus.newAnswerSubmitted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_NewAnswerSubmitted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() newAnswerRecieved,
    required TResult Function() newAnswerSubmitted,
  }) {
    return newAnswerSubmitted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? newAnswerRecieved,
    TResult? Function()? newAnswerSubmitted,
  }) {
    return newAnswerSubmitted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? newAnswerRecieved,
    TResult Function()? newAnswerSubmitted,
    required TResult orElse(),
  }) {
    if (newAnswerSubmitted != null) {
      return newAnswerSubmitted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_NewAnswerRecieved value) newAnswerRecieved,
    required TResult Function(_NewAnswerSubmitted value) newAnswerSubmitted,
  }) {
    return newAnswerSubmitted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_NewAnswerRecieved value)? newAnswerRecieved,
    TResult? Function(_NewAnswerSubmitted value)? newAnswerSubmitted,
  }) {
    return newAnswerSubmitted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_NewAnswerRecieved value)? newAnswerRecieved,
    TResult Function(_NewAnswerSubmitted value)? newAnswerSubmitted,
    required TResult orElse(),
  }) {
    if (newAnswerSubmitted != null) {
      return newAnswerSubmitted(this);
    }
    return orElse();
  }
}

abstract class _NewAnswerSubmitted implements RoundStatus {
  const factory _NewAnswerSubmitted() = _$_NewAnswerSubmitted;
}
