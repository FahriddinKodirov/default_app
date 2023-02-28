import 'package:default_package/state/bloc/example_two/counter_two_bloc.dart';
import 'package:default_package/state/bloc/example_two/counter_two_event.dart';
import 'package:default_package/state/bloc/example_two/counter_two_state.dart';
import 'package:default_package/state/bloc/screen/counter/counter_bloc_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocAScreen extends StatelessWidget {
  const BlocAScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => BlocA(),
        child: Scaffold(
          appBar: AppBar(),
          body: BlocListener<BlocA, BlocAState>(
            listener: (context, state) {
              if(state is LoadIncrement){
                  Text(state.plus.toString());
                  print(state.plus);
                if(state.plus == 30){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>const CounterBlocScreen()));
                }
              } 

       
            },
            child: IconButton(onPressed: (){
                BlocProvider.of<BlocA>(context).add(FetchIncrement());
            }, icon:const Icon(Icons.add)),
          ),
        ));
  }
}
