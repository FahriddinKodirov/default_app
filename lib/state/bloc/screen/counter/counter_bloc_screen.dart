import 'package:default_package/state/bloc/example_one/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBlocScreen extends StatelessWidget {
  const CounterBlocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create:(context) => CounterBloc(),
      child: Scaffold(
           appBar: AppBar(),
           body: BlocBuilder<CounterBloc,int>(
            builder:(context, count) {
              return InkWell(
                onTap: () => BlocProvider.of<CounterBloc>(context).add(CounterIncrementPressed()),
                child: Center(child: Text(count.toString(),style: const TextStyle(fontSize: 50),)));
            },
          ),
      ),
    );
  }
}