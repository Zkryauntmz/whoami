// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:whoami/widgets/NavBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map> myProducts =
      List.generate(100000, (index) => {"id": index, "name": "Product $index"})
          .toList();
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchBar(),
      drawer: NavBar(),
    );
  }

  AppBar searchBar() {
    return AppBar(
        // The search area here
        title: Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Center(
        child: TextField(
          controller: myController,
          decoration: InputDecoration(
              // prefixIcon: const Icon(Icons.search),
              suffixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  /* Clear the search field */

                  print(myController.text);
                },
              ),
              hintText: '  Aramak İstediğiniz Kullanıcı adını giriniz ',
              border: InputBorder.none),
        ),
      ),
    ));
  }
}
