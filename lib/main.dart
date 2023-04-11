import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:whoami/pages/auth/login_page.dart';
import 'package:whoami/pages/auth/sign_up.dart';
import 'package:whoami/pages/home_page.dart';
import 'package:whoami/utils/customColors.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        "/loginPage": (context) => const LoginPage(),
        "/signUp": (context) => const SignUp(),
        "/homePage": (context) => HomePage()
      },
      theme: ThemeData(
        scaffoldBackgroundColor: CustomColors.scaffoldBackgroundColor,
      ),
      home: const Scaffold(
        body: LoginPage(),
      ),
    );
  }
}
