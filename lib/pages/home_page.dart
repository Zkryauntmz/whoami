import 'package:flutter/material.dart';
import 'package:whoami/widgets/NavBar.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String search = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      body: Column(
        children: [
          Center(
            child: searchingTextField(),
          ),
        ],
      ),
    );
  }
}

TextFormField searchingTextField() {
  return TextFormField(
    validator: (value) {
      if (value!.isEmpty) {
        return "Bilgileri Eksiksiz Doldurunuz";
      } else {}
      return null;
    },
    onSaved: (value) {
      var search = value!;
    },
    obscureText: true,
    style: const TextStyle(color: Colors.white),
    decoration:
        customInputDecoration("Aramak Istediğiniz Kullanıcı Adını Giriniz ..."),
  );
}

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
