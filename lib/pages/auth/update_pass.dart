// ignore_for_file: avoid_print, unused_field

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../service/auth.service.dart';

class UpdatePass extends StatefulWidget {
  const UpdatePass({super.key});

  @override
  State<UpdatePass> createState() => _UpdatePassState();
}

class _UpdatePassState extends State<UpdatePass> {
  TextEditingController updatePasswordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final firebaseAuth = FirebaseAuth.instance;
  final authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(),
      body: appBody(),
      backgroundColor: Colors.blue[200],
    );
  }

  SingleChildScrollView appBody() {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    customSizedBox(),
                    emailTextField(),
                    customSizedBox(),
                    updatePasswordButton(),
                    customSizedBox(),
                    customSizedBox(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  TextFormField emailTextField() {
    return TextFormField(
      controller: updatePasswordController,
      style: const TextStyle(color: Colors.black),
      decoration: customInputDecoration("Email"),
    );
  }

  Center updatePasswordButton() {
    return Center(
      child: TextButton(
        onPressed: () async {
          var updateEmail = updatePasswordController.text.trim();
          try {
            FirebaseAuth.instance.sendPasswordResetEmail(email: updateEmail);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Sifre Guncelleme Mailiniz Yollandı"),
              ),
            );
            Navigator.pushReplacementNamed(context, "/HomePage");
          } on FirebaseAuthException catch (e) {
            print('Erro $e');
          }
        },
        child: const Text(
          "Dogrulama Emaili Yolla ",
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  AppBar Appbar() {
    return AppBar(
        // The search area here
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
        elevation: 0.00,
        backgroundColor: Colors.redAccent[400],
        title: const Text('Update Password'));
  }
}

Widget customSizedBox() => const SizedBox(
      height: 20,
    );
InputDecoration customInputDecoration(String hintText) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: const TextStyle(color: Colors.black),
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
      ),
    ),
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
      ),
    ),
  );
}
