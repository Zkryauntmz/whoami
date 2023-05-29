import 'package:flutter/material.dart';
import 'package:whoami/pages/home_page.dart';

class LikedScreen extends StatelessWidget {
  const LikedScreen({super.key});

  Widget showList() {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: liked.length,
      itemBuilder: (BuildContext context, int index) {
        return rowItem(context, index);
      },
    );
  }

  Widget rowItem(context, index) {
    return Dismissible(
      key: Key(liked[index]),
      onDismissed: (direction) {},
      background: deleteBgItem(),
      child: Card(
        child: ListTile(
          title: Text(liked[index]),
        ),
      ),
    );
  }

  Widget deleteBgItem() {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 20),
      color: Colors.red,
      child: const Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: showList(),
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
