import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthHandler{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  Future<bool> createEmailUser(String email , String password) async {
    AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = result.user;
    if (user != null){
      print(user.email);
      return true;
    }
    else{
      return false;
    }
  }
  Future<dynamic> signInEmailUser(String email , String password) async {
    AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = result.user;
    if (user != null){
      print(user.email);
      return true;
    }
    else{
      return false;
    }
  }
  signOutUser() async {
    await _auth.signOut();
  }
}