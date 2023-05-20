// ignore_for_file: unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AuthService {
  final firebaseAuth = FirebaseAuth.instance;
  final firebaseFirestore = FirebaseFirestore.instance;

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
      print('Mailiniz kontrol Ediniz '); // ignore: empty_catches
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
      switch (e.code) {
        case "user-not-found":
          res = "KULLANICI BULUNAMADI";

          break;
        case "wrong-password":
          res = "Hatali Sifre";
          break;
        case "user-disabled":
          res = "Pasif Kullanıcı";
          break;
        default:
          res = "Bir hata ile Karşılaşıldı , Daha Sonra Tekrar Deneyiniz ...";
      }
    }
    return res;
  }
}
