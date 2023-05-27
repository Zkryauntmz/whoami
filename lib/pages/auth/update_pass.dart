// ignore_for_file: avoid_print, unused_field

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UpdatePass extends StatefulWidget {
  const UpdatePass({super.key});

  @override
  State<UpdatePass> createState() => _UpdatePassState();
}

class _UpdatePassState extends State<UpdatePass> {
  var oldPasswordController = TextEditingController;
  var newPasswordController = TextEditingController;
  var auth = FirebaseAuth.instance;
  var currentUser = FirebaseAuth.instance.currentUser;

  changePassword({email, oldPassword, newPassword}) async {
    var cred =
        EmailAuthProvider.credential(email: email, password: oldPassword);
    await currentUser
        ?.reauthenticateWithCredential(cred)
        .then((value) => currentUser?.updatePassword(newPassword))
        .catchError((error) {
      print(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Appbar(),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextFormField(
              //controller: oldPasswordController,
              decoration: const InputDecoration(
                isDense: true,
                alignLabelWithHint: true,
                //labelStyle: 'Old Password',
                hintText: 'Old Password',
                border: OutlineInputBorder(),
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              // controller: newPasswordController,
              decoration: const InputDecoration(
                isDense: true,
                alignLabelWithHint: true,
                //   labelStyle: 'Old Password',
                hintText: 'New Password',
                hintStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            /*ElevatedButton(
                onPressed:() async{ await changePassword(email: "zekoj1819@gmail.com",oldPassword: oldPasswordController.text, newPassword: newPasswordController.text )}, 
                child: const Text('Change Password'));*/
          ]),
        ));
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
