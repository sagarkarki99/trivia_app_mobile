// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_form_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QuestionFormState {
  FormStatus get status => throw _privateConstructorUsedError;
  String get selected => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuestionFormStateCopyWith<QuestionFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionFormStateCopyWith<$Res> {
  factory $QuestionFormStateCopyWith(
          QuestionFormState value, $Res Function(QuestionFormState) then) =
      _$QuestionFormStateCopyWithImpl<$Res, QuestionFormState>;
  @useResult
  $Res call({FormStatus status, String selected});

  $FormStatusCopyWith<$Res> get status;
}

/// @nodoc
class _$QuestionFormStateCopyWithImpl<$Res, $Val extends QuestionFormState>
    implements $QuestionFormStateCopyWith<$Res> {
  _$QuestionFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? selected = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormStatus,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FormStatusCopyWith<$Res> get status {
    return $FormStatusCopyWith<$Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_QuestionFormStateCopyWith<$Res>
    implements $QuestionFormStateCopyWith<$Res> {
  factory _$$_QuestionFormStateCopyWith(_$_QuestionFormState value,
          $Res Function(_$_QuestionFormState) then) =
      __$$_QuestionFormStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FormStatus status, String selected});

  @override
  $FormStatusCopyWith<$Res> get status;
}

/// @nodoc
class __$$_QuestionFormStateCopyWithImpl<$Res>
    extends _$QuestionFormStateCopyWithImpl<$Res, _$_QuestionFormState>
    implements _$$_QuestionFormStateCopyWith<$Res> {
  __$$_QuestionFormStateCopyWithImpl(
      _$_QuestionFormState _value, $Res Function(_$_QuestionFormState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? selected = null,
  }) {
    return _then(_$_QuestionFormState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormStatus,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_QuestionFormState implements _QuestionFormState {
  const _$_QuestionFormState(
      {this.status = const FormStatus.initial(), this.selected = ''});

  @override
  @JsonKey()
  final FormStatus status;
  @override
  @JsonKey()
  final String selected;

  @override
  String toString() {
    return 'QuestionFormState(status: $status, selected: $selected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuestionFormState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.selected, selected) ||
                other.selected == selected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, selected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionFormStateCopyWith<_$_QuestionFormState> get copyWith =>
      __$$_QuestionFormStateCopyWithImpl<_$_QuestionFormState>(
          this, _$identity);
}

abstract class _QuestionFormState implements QuestionFormState {
  const factory _QuestionFormState(
      {final FormStatus status, final String selected}) = _$_QuestionFormState;

  @override
  FormStatus get status;
  @override
  String get selected;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionFormStateCopyWith<_$_QuestionFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FormStatus {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? ready,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Ready value) ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Ready value)? ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Ready value)? ready,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormStatusCopyWith<$Res> {
  factory $FormStatusCopyWith(
          FormStatus value, $Res Function(FormStatus) then) =
      _$FormStatusCopyWithImpl<$Res, FormStatus>;
}

/// @nodoc
class _$FormStatusCopyWithImpl<$Res, $Val extends FormStatus>
    implements $FormStatusCopyWith<$Res> {
  _$FormStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialCopyWith<$Res> {
  factory _$$InitialCopyWith(_$Initial value, $Res Function(_$Initial) then) =
      __$$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialCopyWithImpl<$Res>
    extends _$FormStatusCopyWithImpl<$Res, _$Initial>
    implements _$$InitialCopyWith<$Res> {
  __$$InitialCopyWithImpl(_$Initial _value, $Res Function(_$Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'FormStatus.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() ready,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? ready,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? ready,
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
    required TResult Function(Initial value) initial,
    required TResult Function(Ready value) ready,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Ready value)? ready,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Ready value)? ready,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements FormStatus {
  const factory Initial() = _$Initial;
}

/// @nodoc
abstract class _$$ReadyCopyWith<$Res> {
  factory _$$ReadyCopyWith(_$Ready value, $Res Function(_$Ready) then) =
      __$$ReadyCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReadyCopyWithImpl<$Res>
    extends _$FormStatusCopyWithImpl<$Res, _$Ready>
    implements _$$ReadyCopyWith<$Res> {
  __$$ReadyCopyWithImpl(_$Ready _value, $Res Function(_$Ready) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Ready implements Ready {
  const _$Ready();

  @override
  String toString() {
    return 'FormStatus.ready()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Ready);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() ready,
  }) {
    return ready();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? ready,
  }) {
    return ready?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? ready,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Ready value) ready,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Ready value)? ready,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Ready value)? ready,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class Ready implements FormStatus {
  const factory Ready() = _$Ready;
}
