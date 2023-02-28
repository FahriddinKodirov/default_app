import 'package:default_package/state/bloc/example_two/counter_two_event.dart';
import 'package:default_package/state/bloc/example_two/counter_two_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocA extends Bloc<BlocAEvent,BlocAState>{
  BlocA():super(LoadIncrement(plus: 0)){
    on<FetchIncrement>(fetchIncrement);
  }
 int a = 1;
 
 fetchIncrement(event, emit){
   a++;
   emit(LoadIncrement(plus: a));
 }
}