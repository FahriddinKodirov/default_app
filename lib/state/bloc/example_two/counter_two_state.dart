import 'package:flutter_bloc/flutter_bloc.dart';



abstract class BlocAState {}

class LoadIncrement extends BlocAState {
  final int plus;
    
  LoadIncrement({required this.plus});

}

