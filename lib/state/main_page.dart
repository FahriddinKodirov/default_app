import 'package:default_package/state/bloc/screen/blocA/blocA_screen.dart';
import 'package:default_package/state/bloc/screen/counter/counter_bloc_screen.dart';
import 'package:default_package/state/cubit/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => CounterCubit(),
        child: const BlocAScreen(),
      ),
    );
  }
}