// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GameState {
  List<ConnectedUsers> get connectedUsers => throw _privateConstructorUsedError;
  String get gameId => throw _privateConstructorUsedError;
  GameStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GameStateCopyWith<GameState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameStateCopyWith<$Res> {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) then) =
      _$GameStateCopyWithImpl<$Res, GameState>;
  @useResult
  $Res call(
      {List<ConnectedUsers> connectedUsers, String gameId, GameStatus status});

  $GameStatusCopyWith<$Res> get status;
}

/// @nodoc
class _$GameStateCopyWithImpl<$Res, $Val extends GameState>
    implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? connectedUsers = null,
    Object? gameId = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      connectedUsers: null == connectedUsers
          ? _value.connectedUsers
          : connectedUsers // ignore: cast_nullable_to_non_nullable
              as List<ConnectedUsers>,
      gameId: null == gameId
          ? _value.gameId
          : gameId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GameStatus,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GameStatusCopyWith<$Res> get status {
    return $GameStatusCopyWith<$Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_GameStateCopyWith<$Res> implements $GameStateCopyWith<$Res> {
  factory _$$_GameStateCopyWith(
          _$_GameState value, $Res Function(_$_GameState) then) =
      __$$_GameStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ConnectedUsers> connectedUsers, String gameId, GameStatus status});

  @override
  $GameStatusCopyWith<$Res> get status;
}

/// @nodoc
class __$$_GameStateCopyWithImpl<$Res>
    extends _$GameStateCopyWithImpl<$Res, _$_GameState>
    implements _$$_GameStateCopyWith<$Res> {
  __$$_GameStateCopyWithImpl(
      _$_GameState _value, $Res Function(_$_GameState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? connectedUsers = null,
    Object? gameId = null,
    Object? status = null,
  }) {
    return _then(_$_GameState(
      connectedUsers: null == connectedUsers
          ? _value._connectedUsers
          : connectedUsers // ignore: cast_nullable_to_non_nullable
              as List<ConnectedUsers>,
      gameId: null == gameId
          ? _value.gameId
          : gameId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GameStatus,
    ));
  }
}

/// @nodoc

class _$_GameState implements _GameState {
  _$_GameState(
      {final List<ConnectedUsers> connectedUsers = const [],
      this.gameId = '',
      this.status = const GameStatus.initial()})
      : _connectedUsers = connectedUsers;

  final List<ConnectedUsers> _connectedUsers;
  @override
  @JsonKey()
  List<ConnectedUsers> get connectedUsers {
    if (_connectedUsers is EqualUnmodifiableListView) return _connectedUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_connectedUsers);
  }

  @override
  @JsonKey()
  final String gameId;
  @override
  @JsonKey()
  final GameStatus status;

  @override
  String toString() {
    return 'GameState(connectedUsers: $connectedUsers, gameId: $gameId, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GameState &&
            const DeepCollectionEquality()
                .equals(other._connectedUsers, _connectedUsers) &&
            (identical(other.gameId, gameId) || other.gameId == gameId) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_connectedUsers), gameId, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GameStateCopyWith<_$_GameState> get copyWith =>
      __$$_GameStateCopyWithImpl<_$_GameState>(this, _$identity);
}

abstract class _GameState implements GameState {
  factory _GameState(
      {final List<ConnectedUsers> connectedUsers,
      final String gameId,
      final GameStatus status}) = _$_GameState;

  @override
  List<ConnectedUsers> get connectedUsers;
  @override
  String get gameId;
  @override
  GameStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_GameStateCopyWith<_$_GameState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GameStatus {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() gameCreated,
    required TResult Function() gameJoined,
    required TResult Function() updated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? gameCreated,
    TResult? Function()? gameJoined,
    TResult? Function()? updated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? gameCreated,
    TResult Function()? gameJoined,
    TResult Function()? updated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(GameCreated value) gameCreated,
    required TResult Function(GameJoined value) gameJoined,
    required TResult Function(Updated value) updated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(GameCreated value)? gameCreated,
    TResult? Function(GameJoined value)? gameJoined,
    TResult? Function(Updated value)? updated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(GameCreated value)? gameCreated,
    TResult Function(GameJoined value)? gameJoined,
    TResult Function(Updated value)? updated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameStatusCopyWith<$Res> {
  factory $GameStatusCopyWith(
          GameStatus value, $Res Function(GameStatus) then) =
      _$GameStatusCopyWithImpl<$Res, GameStatus>;
}

/// @nodoc
class _$GameStatusCopyWithImpl<$Res, $Val extends GameStatus>
    implements $GameStatusCopyWith<$Res> {
  _$GameStatusCopyWithImpl(this._value, this._then);

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
    extends _$GameStatusCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'GameStatus.initial()';
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
    required TResult Function() gameCreated,
    required TResult Function() gameJoined,
    required TResult Function() updated,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? gameCreated,
    TResult? Function()? gameJoined,
    TResult? Function()? updated,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? gameCreated,
    TResult Function()? gameJoined,
    TResult Function()? updated,
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
    required TResult Function(GameJoined value) gameJoined,
    required TResult Function(Updated value) updated,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(GameCreated value)? gameCreated,
    TResult? Function(GameJoined value)? gameJoined,
    TResult? Function(Updated value)? updated,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(GameCreated value)? gameCreated,
    TResult Function(GameJoined value)? gameJoined,
    TResult Function(Updated value)? updated,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements GameStatus {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$GameCreatedCopyWith<$Res> {
  factory _$$GameCreatedCopyWith(
          _$GameCreated value, $Res Function(_$GameCreated) then) =
      __$$GameCreatedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GameCreatedCopyWithImpl<$Res>
    extends _$GameStatusCopyWithImpl<$Res, _$GameCreated>
    implements _$$GameCreatedCopyWith<$Res> {
  __$$GameCreatedCopyWithImpl(
      _$GameCreated _value, $Res Function(_$GameCreated) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GameCreated implements GameCreated {
  const _$GameCreated();

  @override
  String toString() {
    return 'GameStatus.gameCreated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GameCreated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() gameCreated,
    required TResult Function() gameJoined,
    required TResult Function() updated,
  }) {
    return gameCreated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? gameCreated,
    TResult? Function()? gameJoined,
    TResult? Function()? updated,
  }) {
    return gameCreated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? gameCreated,
    TResult Function()? gameJoined,
    TResult Function()? updated,
    required TResult orElse(),
  }) {
    if (gameCreated != null) {
      return gameCreated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(GameCreated value) gameCreated,
    required TResult Function(GameJoined value) gameJoined,
    required TResult Function(Updated value) updated,
  }) {
    return gameCreated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(GameCreated value)? gameCreated,
    TResult? Function(GameJoined value)? gameJoined,
    TResult? Function(Updated value)? updated,
  }) {
    return gameCreated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(GameCreated value)? gameCreated,
    TResult Function(GameJoined value)? gameJoined,
    TResult Function(Updated value)? updated,
    required TResult orElse(),
  }) {
    if (gameCreated != null) {
      return gameCreated(this);
    }
    return orElse();
  }
}

abstract class GameCreated implements GameStatus {
  const factory GameCreated() = _$GameCreated;
}

/// @nodoc
abstract class _$$GameJoinedCopyWith<$Res> {
  factory _$$GameJoinedCopyWith(
          _$GameJoined value, $Res Function(_$GameJoined) then) =
      __$$GameJoinedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GameJoinedCopyWithImpl<$Res>
    extends _$GameStatusCopyWithImpl<$Res, _$GameJoined>
    implements _$$GameJoinedCopyWith<$Res> {
  __$$GameJoinedCopyWithImpl(
      _$GameJoined _value, $Res Function(_$GameJoined) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GameJoined implements GameJoined {
  const _$GameJoined();

  @override
  String toString() {
    return 'GameStatus.gameJoined()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GameJoined);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() gameCreated,
    required TResult Function() gameJoined,
    required TResult Function() updated,
  }) {
    return gameJoined();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? gameCreated,
    TResult? Function()? gameJoined,
    TResult? Function()? updated,
  }) {
    return gameJoined?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? gameCreated,
    TResult Function()? gameJoined,
    TResult Function()? updated,
    required TResult orElse(),
  }) {
    if (gameJoined != null) {
      return gameJoined();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(GameCreated value) gameCreated,
    required TResult Function(GameJoined value) gameJoined,
    required TResult Function(Updated value) updated,
  }) {
    return gameJoined(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(GameCreated value)? gameCreated,
    TResult? Function(GameJoined value)? gameJoined,
    TResult? Function(Updated value)? updated,
  }) {
    return gameJoined?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(GameCreated value)? gameCreated,
    TResult Function(GameJoined value)? gameJoined,
    TResult Function(Updated value)? updated,
    required TResult orElse(),
  }) {
    if (gameJoined != null) {
      return gameJoined(this);
    }
    return orElse();
  }
}

abstract class GameJoined implements GameStatus {
  const factory GameJoined() = _$GameJoined;
}

/// @nodoc
abstract class _$$UpdatedCopyWith<$Res> {
  factory _$$UpdatedCopyWith(_$Updated value, $Res Function(_$Updated) then) =
      __$$UpdatedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpdatedCopyWithImpl<$Res>
    extends _$GameStatusCopyWithImpl<$Res, _$Updated>
    implements _$$UpdatedCopyWith<$Res> {
  __$$UpdatedCopyWithImpl(_$Updated _value, $Res Function(_$Updated) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Updated implements Updated {
  const _$Updated();

  @override
  String toString() {
    return 'GameStatus.updated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Updated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() gameCreated,
    required TResult Function() gameJoined,
    required TResult Function() updated,
  }) {
    return updated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? gameCreated,
    TResult? Function()? gameJoined,
    TResult? Function()? updated,
  }) {
    return updated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? gameCreated,
    TResult Function()? gameJoined,
    TResult Function()? updated,
    required TResult orElse(),
  }) {
    if (updated != null) {
      return updated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(GameCreated value) gameCreated,
    required TResult Function(GameJoined value) gameJoined,
    required TResult Function(Updated value) updated,
  }) {
    return updated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(GameCreated value)? gameCreated,
    TResult? Function(GameJoined value)? gameJoined,
    TResult? Function(Updated value)? updated,
  }) {
    return updated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(GameCreated value)? gameCreated,
    TResult Function(GameJoined value)? gameJoined,
    TResult Function(Updated value)? updated,
    required TResult orElse(),
  }) {
    if (updated != null) {
      return updated(this);
    }
    return orElse();
  }
}

abstract class Updated implements GameStatus {
  const factory Updated() = _$Updated;
}
