import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String email, password;
  final formkey = GlobalKey<FormState>();
  final firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff21254A),
      body: SingleChildScrollView(
        child: Center(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              height: 250,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/images/topImage.png"),
                fit: BoxFit.cover,
              )),
            ),
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
                    forgotPasswordField(),
                    customSizedBox(),
                    signInButton(),
                    customSizedBox(),
                    signUpButton(),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Center signUpButton() {
    return Center(
      child: TextButton(
          onPressed: () => Navigator.pushNamed(context, "/signUpPage"),
          child: const Text(
            'Hesap Oluştur ',
            style: TextStyle(color: Colors.pink),
          )),
    );
  }

  Center signInButton() {
    return Center(
      child: TextButton(
        onPressed: () async {
          if (formkey.currentState!.validate()) {
            formkey.currentState!.save();
            try {
              final userResult = await firebaseAuth.signInWithEmailAndPassword(
                  email: email, password: password);
              Navigator.pushReplacementNamed(context, "/homePage");

              //   print(userResult.user!.email);
            } catch (e) {
              print(e.toString());
            }
          } else {}
        },
        child: Container(
          height: 50,
          width: 100,
          margin: const EdgeInsets.symmetric(horizontal: 60),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: const Color(0xff31274F)),
          child: const Center(
            child: Text(
              "Giris Yap ",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  Center forgotPasswordField() {
    return Center(
      child: TextButton(
          onPressed: () {},
          child: const Text(
            'Sifremi Unuttum ',
            style: TextStyle(color: Colors.pink),
          )),
    );
  }

  TextFormField passwordTextField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Bilgileri Eksiksiz Doldurunuz !!";
        } else {}
      },
      onSaved: (value) {
        password = value!;
      },
      obscureText: true,
      style: const TextStyle(color: Colors.white),
      decoration: customInputDecoration('Sifreniz'),
    );
  }

  TextFormField emailTextField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Bilgileri Eksiksiz Doldurunuz !!";
        } else {}
      },
      onSaved: (value) {
        email = value!;
      },
      style: const TextStyle(color: Colors.white),
      decoration: customInputDecoration('Kullanıcı Adı'),
    );
  }

  Text titleText() {
    return const Text(
      'Merhaba , \nHosgeldin...',
      style: TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget customSizedBox() => const SizedBox(
        height: 20,
      );
  InputDecoration customInputDecoration(String hintText) {
    return InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey)),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey)));
  }
}
