import 'package:flutter/material.dart';
import 'package:flutter_firestore_books/ui/login/login.dart';
import 'package:flutter_firestore_books/ui/login/sign_up.dart';


class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogged = true;

  @override
  Widget build(BuildContext context) {
    return isLogged
        ? LoginPage(onClickSignUp: switchAuthPages)
        : SignUp(onClickedSignIn: switchAuthPages);
  }
  void switchAuthPages() => setState(() {
    isLogged = !isLogged;
  });
}