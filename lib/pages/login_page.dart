import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whoami/service/auth.service.dart';
import 'package:whoami/widgets/custom_text_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String email, password;
  final formkey = GlobalKey<FormState>();
  final firebaseAuth = FirebaseAuth.instance;
  final authService = AuthService();
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
                child: Center(
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
                      CustomTextButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, "/signUpPage"),
                        buttonText: "Hesap Oluştur ",
                      ),
                      customSizedBox(),
                      CustomTextButton(
                          onPressed: () async {
                            final result = await authService.signInAnonymous();
                            if (result != null) {
                              // ignore: use_build_context_synchronously
                              Navigator.pushReplacementNamed(
                                  context, "/homePage");
                            } else {
                              // ignore: avoid_print
                              print("Hata İle Karşılaşıldır ..");
                            }
                          },
                          buttonText: "Misafir Girişi"),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Center signInButton() {
    return Center(
      child: TextButton(
        onPressed: signIn,
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

  void signIn() async {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      final result = await authService.signIn(email, password);
      if (result == "success") {
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Hata"),
                content: Text(result),
              );
            });
      }
    }
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
        return null;
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
        return null;
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
