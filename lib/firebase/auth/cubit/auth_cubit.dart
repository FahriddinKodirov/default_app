import 'package:default_package/firebase/auth/cubit/auth_state.dart';
import 'package:default_package/firebase/auth/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState>{
  final AuthRepository authRepository;

   AuthCubit(this.authRepository):super(InitialAuthState());

  singUp({required String email, required String password}) {
    authRepository.signUp(email: email, password: password);
  }

  singIn({required String email, required String password}) {
    authRepository.signIn(email: email, password: password);
  }
   
  //  Stream<User?> checkAuthState() => authRepository.authState();
}