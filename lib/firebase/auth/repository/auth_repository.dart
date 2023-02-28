import 'package:default_package/utils/my_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth firebaseAuth;

  AuthRepository({required this.firebaseAuth});

// --------------------------- yaratish  --------------------------------------

Future<void> signUp({required String email, required String password}) async {

  try {
    await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch(error) {
    MyUtils.getMyToast(message: error.message.toString());
  }  
}

// -------------------------- royhatga kiritish -----------------------------------

Future<void> signIn({required String email, required String password}) async {
 
   try {
    await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
   }  on FirebaseAuthException catch(error) {
    MyUtils.getMyToast(message: error.message.toString());
  }  
  
}

//!
//---- Registratsadan o'tkan User ni Bor yoki yogligni tekshirish uchun yoziladi -------

// Stream<User?> authState() async* {
//   yield* firebaseAuth.authStateChanges();
// }


}