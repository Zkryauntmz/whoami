import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:whoami/pages/auth/forget_pass.dart';

import 'package:whoami/pages/auth/login_page.dart';
import 'package:whoami/pages/auth/screen2.dart';
import 'package:whoami/pages/auth/sign_up.dart';
import 'package:whoami/pages/auth/update_pass.dart';
import 'package:whoami/pages/home_page.dart';
import 'package:whoami/pages/liked.dart';
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
        "/signUp": (context) => SignUp(),
        "/homePage": (context) => const HomePage(),
        "/forgetPass": (context) => const ForgetPassword(),
        "/screen2": (context) => RouteTwo(
              name: '',
              data: '',
              url: '',
            ),
        "/update": (context) => const UpdatePass(),
        "/liked": (context) => const LikedScreen(),
      },
      theme: ThemeData(
        scaffoldBackgroundColor: CustomColors.scaffoldBackgroundColor,
      ),
      home: const Scaffold(
        body: HomePage(),
      ),
    );
  }
}
