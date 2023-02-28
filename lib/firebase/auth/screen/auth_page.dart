import 'package:default_package/firebase/auth/screen/login/login_screen.dart';
import 'package:default_package/firebase/auth/screen/sign_in/sing_in.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogged = false;

  @override
  Widget build(BuildContext context) {
    return isLogged?
           LoginScreen(onClickSignUp: swichAuthPages,):
           SignInScreen(onClickSignIp: swichAuthPages,);
  }

  void swichAuthPages() {
    setState(() {
      isLogged = !isLogged;
    });
  }
}