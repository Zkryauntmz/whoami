import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late String email, password;
  final formkey = GlobalKey<FormState>();
  final firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff21254A),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: formkey,
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
                    backToLoginPage(),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Center signUpButton() {
    return Center(
      child: TextButton(
          onPressed: signIn,
          child: const Text(
            'Hesap Oluştur ',
            style: TextStyle(color: Colors.pink),
          )),
    );
  }

  void signIn() async {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      try {
        var userResult = await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        formkey.currentState!.reset();

        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              "Kayıt işleminiz yapıldı  , Giriş Sayfasına Yönlendiriyorsunuz..."),
        ));
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
          child: const Text(
            'Giriş Sayfasına Geri Dön  ',
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
      'HESAP OLUŞTUR ',
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
