import 'package:flutter/material.dart';
import 'package:whoami/pages/home_page.dart';

class LikedScreen extends StatelessWidget {
  const LikedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: ListView.builder(
            itemCount: liked.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(liked[index]),
                leading: const Icon(
                  Icons.delete,
                ),
              );
            },
          ),
        ),
        backgroundColor: Colors.blue,
        appBar: AppBar(
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
            title: const Text('LIKED USERS')));
  }
}
