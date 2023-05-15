import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whoami/utils/customColors.dart';
import 'package:whoami/utils/customTextStyle.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);
  User? email = FirebaseAuth.instance.currentUser;
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late String email, password;
  final formkey = GlobalKey<FormState>();
  final firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    String topImage = "assets/images/topImage.png";
    return Scaffold(
      body: appBody(height, topImage),
    );
  }

  SingleChildScrollView appBody(double height, String topImage) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            topImageContainer(height, topImage),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleText(),
                    customSizedBox(),
                    emailTextField(),
                    customSizedBox(),
                    passwordTextField(),
                    customSizedBox(),
                    signUpButton(),
                    customSizedBox(),
                    backToLoginPage()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Text titleText() {
    return const Text(
      "Merhaba, \nHosgeldin",
      style: CustomTextStyle.titleTextStyle,
    );
  }

  TextFormField emailTextField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Bilgileri Eksiksiz Doldurunuz";
        } else {}
        return null;
      },
      onSaved: (value) {
        email = value!;
      },
      style: const TextStyle(color: Colors.white),
      decoration: customInputDecoration("Email"),
    );
  }

  TextFormField passwordTextField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Bilgileri Eksiksiz Doldurunuz";
        } else {}
        return null;
      },
      onSaved: (value) {
        password = value!;
      },
      obscureText: true,
      style: const TextStyle(color: Colors.white),
      decoration: customInputDecoration("Sifre"),
    );
  }

  Center signUpButton() {
    return Center(
      child: TextButton(
        onPressed: signIn,
        child: customText(
          "Hesap Olustur",
          CustomColors.textButtonColor,
        ),
      ),
    );
  }

  void signIn() async {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      try {
        // ignore: unused_local_variable
        var userResult = await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        formkey.currentState!.reset();

        FirebaseFirestore.instance
            .collection('Users')
            .doc()
            .set({"email": email, "password": password});

        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
                "Kullanici basariliyla kaydedildi, giris sayfasina yonlendiriliyorsunuz"),
          ),
        );
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, "/loginPage");
      } catch (e) {
        // ignore: avoid_print
        print(e.toString());
      }
    } else {}
  }

  Center backToLoginPage() {
    return Center(
      child: TextButton(
        onPressed: () => Navigator.pushNamed(context, "/loginPage"),
        child: customText(
          "Giris Sayfasina Geri Don",
          CustomColors.textButtonColor,
        ),
      ),
    );
  }

  Container topImageContainer(double height, String topImage) {
    return Container(
      height: height * .25,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(topImage),
        ),
      ),
    );
  }

  Widget customSizedBox() => const SizedBox(
        height: 20,
      );

  Widget customText(String text, Color color) => Text(
        text,
        style: TextStyle(color: color),
      );

  InputDecoration customInputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.grey),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
        ),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
        ),
      ),
    );
  }
}
