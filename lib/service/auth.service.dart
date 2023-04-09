import 'package:firebase_auth/firebase_auth.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';

class AuthService {
  final firebaseAuth = FirebaseAuth.instance;

  Future signInAnonymous() async {
    try {
      final result = await firebaseAuth.signInAnonymously();
      // ignore: avoid_print
      print(result.user!.uid);
      return result.user;
    } catch (e) {
      // ignore: avoid_print
      print("Anon Error ");
      return null;
    }
  }

  Future forgotPassword(String email) async {
    try {
      // ignore: unused_local_variable
      final result = await firebaseAuth.sendPasswordResetEmail(email: email);
      // ignore: avoid_print
      print("Mail Kutunuzu Kontrol Ediniz ...");
      // ignore: empty_catches
    } catch (e) {}
  }

  Future signIn(String email, String password) async {
    String? res;
    try {
      // ignore: unused_local_variable
      final result = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      res = "Success";
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        res = "Kullanıcı Bulunamadı ";
      } else if (e.code == "wrong-password ") {
        res = "Sifre Yanlışş.";
      } else if (e.code == "user-disabled") {
        res = "Pasif Kullanıcı ..";
      }
    }
    return res;
  }
}
