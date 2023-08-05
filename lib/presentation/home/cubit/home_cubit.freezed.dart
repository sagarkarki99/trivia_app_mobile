// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String gameId) gameCreated,
    required TResult Function(String message) loading,
    required TResult Function(InitialGameState gameState) gameJoined,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String gameId)? gameCreated,
    TResult? Function(String message)? loading,
    TResult? Function(InitialGameState gameState)? gameJoined,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String gameId)? gameCreated,
    TResult Function(String message)? loading,
    TResult Function(InitialGameState gameState)? gameJoined,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(GameCreated value) gameCreated,
    required TResult Function(Loading value) loading,
    required TResult Function(GameJoined value) gameJoined,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(GameCreated value)? gameCreated,
    TResult? Function(Loading value)? loading,
    TResult? Function(GameJoined value)? gameJoined,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(GameCreated value)? gameCreated,
    TResult Function(Loading value)? loading,
    TResult Function(GameJoined value)? gameJoined,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

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
    extends _$HomeStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'HomeState.initial()';
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
    required TResult Function(String gameId) gameCreated,
    required TResult Function(String message) loading,
    required TResult Function(InitialGameState gameState) gameJoined,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String gameId)? gameCreated,
    TResult? Function(String message)? loading,
    TResult? Function(InitialGameState gameState)? gameJoined,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String gameId)? gameCreated,
    TResult Function(String message)? loading,
    TResult Function(InitialGameState gameState)? gameJoined,
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
    required TResult Function(GameCreated value) gameCreated,
    required TResult Function(Loading value) loading,
    required TResult Function(GameJoined value) gameJoined,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(GameCreated value)? gameCreated,
    TResult? Function(Loading value)? loading,
    TResult? Function(GameJoined value)? gameJoined,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(GameCreated value)? gameCreated,
    TResult Function(Loading value)? loading,
    TResult Function(GameJoined value)? gameJoined,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements HomeState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$GameCreatedCopyWith<$Res> {
  factory _$$GameCreatedCopyWith(
          _$GameCreated value, $Res Function(_$GameCreated) then) =
      __$$GameCreatedCopyWithImpl<$Res>;
  @useResult
  $Res call({String gameId});
}

/// @nodoc
class __$$GameCreatedCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$GameCreated>
    implements _$$GameCreatedCopyWith<$Res> {
  __$$GameCreatedCopyWithImpl(
      _$GameCreated _value, $Res Function(_$GameCreated) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameId = null,
  }) {
    return _then(_$GameCreated(
      null == gameId
          ? _value.gameId
          : gameId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GameCreated implements GameCreated {
  const _$GameCreated(this.gameId);

  @override
  final String gameId;

  @override
  String toString() {
    return 'HomeState.gameCreated(gameId: $gameId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameCreated &&
            (identical(other.gameId, gameId) || other.gameId == gameId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, gameId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameCreatedCopyWith<_$GameCreated> get copyWith =>
      __$$GameCreatedCopyWithImpl<_$GameCreated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String gameId) gameCreated,
    required TResult Function(String message) loading,
    required TResult Function(InitialGameState gameState) gameJoined,
  }) {
    return gameCreated(gameId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String gameId)? gameCreated,
    TResult? Function(String message)? loading,
    TResult? Function(InitialGameState gameState)? gameJoined,
  }) {
    return gameCreated?.call(gameId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String gameId)? gameCreated,
    TResult Function(String message)? loading,
    TResult Function(InitialGameState gameState)? gameJoined,
    required TResult orElse(),
  }) {
    if (gameCreated != null) {
      return gameCreated(gameId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(GameCreated value) gameCreated,
    required TResult Function(Loading value) loading,
    required TResult Function(GameJoined value) gameJoined,
  }) {
    return gameCreated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(GameCreated value)? gameCreated,
    TResult? Function(Loading value)? loading,
    TResult? Function(GameJoined value)? gameJoined,
  }) {
    return gameCreated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(GameCreated value)? gameCreated,
    TResult Function(Loading value)? loading,
    TResult Function(GameJoined value)? gameJoined,
    required TResult orElse(),
  }) {
    if (gameCreated != null) {
      return gameCreated(this);
    }
    return orElse();
  }
}

abstract class GameCreated implements HomeState {
  const factory GameCreated(final String gameId) = _$GameCreated;

  String get gameId;
  @JsonKey(ignore: true)
  _$$GameCreatedCopyWith<_$GameCreated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingCopyWith<$Res> {
  factory _$$LoadingCopyWith(_$Loading value, $Res Function(_$Loading) then) =
      __$$LoadingCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$LoadingCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$Loading>
    implements _$$LoadingCopyWith<$Res> {
  __$$LoadingCopyWithImpl(_$Loading _value, $Res Function(_$Loading) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$Loading(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Loading implements Loading {
  const _$Loading(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'HomeState.loading(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Loading &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingCopyWith<_$Loading> get copyWith =>
      __$$LoadingCopyWithImpl<_$Loading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String gameId) gameCreated,
    required TResult Function(String message) loading,
    required TResult Function(InitialGameState gameState) gameJoined,
  }) {
    return loading(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String gameId)? gameCreated,
    TResult? Function(String message)? loading,
    TResult? Function(InitialGameState gameState)? gameJoined,
  }) {
    return loading?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String gameId)? gameCreated,
    TResult Function(String message)? loading,
    TResult Function(InitialGameState gameState)? gameJoined,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(GameCreated value) gameCreated,
    required TResult Function(Loading value) loading,
    required TResult Function(GameJoined value) gameJoined,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(GameCreated value)? gameCreated,
    TResult? Function(Loading value)? loading,
    TResult? Function(GameJoined value)? gameJoined,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(GameCreated value)? gameCreated,
    TResult Function(Loading value)? loading,
    TResult Function(GameJoined value)? gameJoined,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements HomeState {
  const factory Loading(final String message) = _$Loading;

  String get message;
  @JsonKey(ignore: true)
  _$$LoadingCopyWith<_$Loading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GameJoinedCopyWith<$Res> {
  factory _$$GameJoinedCopyWith(
          _$GameJoined value, $Res Function(_$GameJoined) then) =
      __$$GameJoinedCopyWithImpl<$Res>;
  @useResult
  $Res call({InitialGameState gameState});
}

/// @nodoc
class __$$GameJoinedCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$GameJoined>
    implements _$$GameJoinedCopyWith<$Res> {
  __$$GameJoinedCopyWithImpl(
      _$GameJoined _value, $Res Function(_$GameJoined) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameState = null,
  }) {
    return _then(_$GameJoined(
      null == gameState
          ? _value.gameState
          : gameState // ignore: cast_nullable_to_non_nullable
              as InitialGameState,
    ));
  }
}

/// @nodoc

class _$GameJoined implements GameJoined {
  const _$GameJoined(this.gameState);

  @override
  final InitialGameState gameState;

  @override
  String toString() {
    return 'HomeState.gameJoined(gameState: $gameState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameJoined &&
            (identical(other.gameState, gameState) ||
                other.gameState == gameState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, gameState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameJoinedCopyWith<_$GameJoined> get copyWith =>
      __$$GameJoinedCopyWithImpl<_$GameJoined>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String gameId) gameCreated,
    required TResult Function(String message) loading,
    required TResult Function(InitialGameState gameState) gameJoined,
  }) {
    return gameJoined(gameState);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String gameId)? gameCreated,
    TResult? Function(String message)? loading,
    TResult? Function(InitialGameState gameState)? gameJoined,
  }) {
    return gameJoined?.call(gameState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String gameId)? gameCreated,
    TResult Function(String message)? loading,
    TResult Function(InitialGameState gameState)? gameJoined,
    required TResult orElse(),
  }) {
    if (gameJoined != null) {
      return gameJoined(gameState);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(GameCreated value) gameCreated,
    required TResult Function(Loading value) loading,
    required TResult Function(GameJoined value) gameJoined,
  }) {
    return gameJoined(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(GameCreated value)? gameCreated,
    TResult? Function(Loading value)? loading,
    TResult? Function(GameJoined value)? gameJoined,
  }) {
    return gameJoined?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(GameCreated value)? gameCreated,
    TResult Function(Loading value)? loading,
    TResult Function(GameJoined value)? gameJoined,
    required TResult orElse(),
  }) {
    if (gameJoined != null) {
      return gameJoined(this);
    }
    return orElse();
  }
}

abstract class GameJoined implements HomeState {
  const factory GameJoined(final InitialGameState gameState) = _$GameJoined;

  InitialGameState get gameState;
  @JsonKey(ignore: true)
  _$$GameJoinedCopyWith<_$GameJoined> get copyWith =>
      throw _privateConstructorUsedError;
}
