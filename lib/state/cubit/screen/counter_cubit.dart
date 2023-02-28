import 'package:default_package/state/cubit/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubitScreen extends StatelessWidget {
  const CounterCubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(create: (context) => CounterCubit(),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<CounterCubit,int>(
          builder: (context, count) {
            return InkWell(
              onTap: () {
                BlocProvider.of<CounterCubit>(context).increment();
              },
              child: Center(child: 
                Text(count.toString(),style:const TextStyle(fontSize: 50),),
                ),
            );
          },
        ),
      ),
    );
  }
}