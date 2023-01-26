import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trivia_app/models/game_state.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState(user: _getRandomUser()));

  static ConnectedUser _getRandomUser() {
    return ConnectedUser(
      id: 'id${Random().nextInt(100)}',
      name: 'User${Random().nextInt(100)}',
      imageUrl: 'asdf',
    );
  }
}
