import 'package:default_package/firebase/auth/screen/login/login_screen.dart';
import 'package:default_package/firebase/main_firebase.dart';
import 'package:default_package/stream/default_stream.dart';
import 'package:default_package/stream/view_model/read_stream.dart';
import 'package:default_package/stream/view_model/stream_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  // sheridPreference
  // firebase auth
  WidgetsFlutterBinding.ensureInitialized();
  // firebase auth
  await Firebase.initializeApp();
  

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => CounterViewModel()),
      ChangeNotifierProvider(create: (_) => StreamControllerModel()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainFireBase(),
    );
  }
}
