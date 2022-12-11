import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firestore_books/utils/my_utils.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required FirebaseAuth auth})
      : _auth = auth,
        super(LoginInitial());

  final FirebaseAuth _auth;


  Stream<User?> authState() async* {
    yield* FirebaseAuth.instance.authStateChanges();
  }

  Stream<User?> get userInfoChanges => FirebaseAuth.instance.userChanges();
  User get user => _auth.currentUser!;

  void signUp({
    required String email,
    required String password,
  }) async {
    emit(LoginInitial());
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      emit(LoginSuccess(email: email, password: password));
    } on FirebaseAuthException catch (e) {
      emit(LoginError(errorText: e.toString()));
    }
  }

  void loginIn({
    required String email,
    required String password,
  }) async {
    emit(LoginInitial());
    try {
      await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      emit(LoginSuccess(email: email, password: password));
    } on FirebaseAuthException catch (e) {
      emit(LoginError(errorText: e.toString()));
    }
  }

  void logOut() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      MyUtils.getMyToast(message: e.toString());
    }
  }

  void deleteAccount() async {
    try {
      await _auth.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      MyUtils.getMyToast(message: e.toString());
    }
  }

  void updateDisplayName({required String displayName}) async {
    try {
      await _auth.currentUser!.updateDisplayName(displayName);
    } on FirebaseAuthException catch (e) {
      MyUtils.getMyToast(message: e.toString());
    }
  }

  void updateEmail({required String email}) async {
    try {
      await _auth.currentUser!.updateEmail(email);
    } on FirebaseAuthException catch (e) {
      MyUtils.getMyToast(message: e.toString());
    }
  }
}