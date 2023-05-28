// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:whoami/pages/home_page.dart';

// ignore: use_key_in_widget_constructors
class NavBar extends StatefulWidget {
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
          // Remove padding
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('Hosgeldiniz'),
              accountEmail: Text(""),
              decoration: BoxDecoration(
                color: Colors.redAccent,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () => Navigator.pushNamed(context, "/update"),
            ),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text('Liked'),
              onTap: () => Navigator.pushNamed(context, "/update"),
            ),
            ListTile(
              leading: const Icon(Icons.login_outlined),
              title: const Text('Log out'),
              onTap: () => Navigator.pushNamed(context, "/loginPage"),
            ),
          ]),
    );
  }
}
