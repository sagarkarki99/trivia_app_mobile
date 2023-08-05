import 'dart:convert';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:trivia_app/models/game_state.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  final storage = const FlutterSecureStorage();
  AuthCubit() : super(const AuthState(user: null));

  static ConnectedUser _getRandomUser() {
    return ConnectedUser(
      id: 'id${Random().nextInt(100)}',
      name: 'User${Random().nextInt(100)}',
      imageUrl: 'asdf',
      email: 'random@example.com',
    );
  }

  ConnectedUser? get user => state.user;

  Future<void> setUser() async {
    final isUserAvailable = await storage.containsKey(key: 'user');
    final userString = isUserAvailable ? await storage.read(key: 'user') : null;
    if (userString == null) return;
    final user = ConnectedUser.fromJson(jsonDecode(userString));
    emit(AuthState(user: user));
  }

  Future<void> signInWithGoogle() async {
    // Trigger the authentication flow
    try {
      final googleSignIn = GoogleSignIn(
        clientId:
            '139679036178-2abn3d8vql02odkj7d5u95c00mviinp7.apps.googleusercontent.com',
        scopes: [
          'email',
          'openid',
          'profile',
        ],
      );

      final googleUser = await googleSignIn.signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final connectedUser = ConnectedUser(
        id: userCredential.user?.uid ?? '',
        name: userCredential.user?.displayName ?? 'Trivia User',
        email: userCredential.user?.email ?? '',
        imageUrl: userCredential.user?.photoURL,
      );
      await _saveUser(connectedUser);
      emit(
        AuthState(user: connectedUser),
      );
    } on Exception catch (e) {
      debugPrint(e.toString());
      throw Exception();
    }
  }

  Future<void> _saveUser(ConnectedUser connectedUser) async {
    storage.write(key: 'user', value: connectedUser.toJson().toString());
  }
}
