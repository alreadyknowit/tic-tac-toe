import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  Future<void> _signInAnon() async {
    try {
       await FirebaseAuth.instance.signInAnonymously();
      //FirebaseUser user = res.user;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
