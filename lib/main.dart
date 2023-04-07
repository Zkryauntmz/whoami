import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:whoami/pages/home_page.dart';
import 'package:whoami/pages/login_page.dart';
import 'package:whoami/pages/sing_up.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        "/loginPage": (context) => const LoginPage(),
        "/signUpPage": (context) => const SignUp(),
        "/homePage": (context) => const HomePage(),
      },
      theme: ThemeData(
          //   scaffoldBackgroundColor: CustomColors.scaffoldBackgroundColor,
          ),
      home: const LoginPage(),
    );
  }
}
