import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices {
  var auth = FirebaseAuth.instance;
  Future signUpWithEmailAndPassword(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return false;
    }
  }
}
