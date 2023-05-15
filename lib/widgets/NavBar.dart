import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
          // Remove padding
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('Hosgeldiniz'),
              accountEmail: Text(''),
              currentAccountPicture: CircleAvatar(),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () => null,
            ),
            ListTile(
              leading: const Icon(Icons.login_outlined),
              title: const Text('Log out'),
              onTap: () => null,
            ),
          ]),
    );
  }
}
