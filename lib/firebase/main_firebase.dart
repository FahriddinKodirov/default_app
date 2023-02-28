import 'package:default_package/firebase/auth/cubit/auth_cubit.dart';
import 'package:default_package/firebase/auth/repository/auth_repository.dart';
import 'package:default_package/firebase/auth/screen/auth_page.dart';
import 'package:default_package/firebase/auth/screen/login/login_screen.dart';
import 'package:default_package/firebase/tabbar_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainFireBase extends StatelessWidget {
  const MainFireBase({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(create: (context) => AuthCubit(AuthRepository(firebaseAuth: FirebaseAuth.instance)),
      child: const MainPage()),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.hasData) {
          return const TabBarPage();
        } else {
          return const AuthPage();
        }
      },
    );
  }
}