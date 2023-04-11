import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  String topImage = "assets/images/profile.png";
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
          // Remove padding
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text('Oflutter.com'),
              accountEmail: const Text('example@gmail.com'),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                    child: Image.asset(
                  topImage,
                  height: 90,
                  width: 90,
                )),
              ),
              decoration: const BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () => null,
            ),
            ListTile(
              leading: const Icon(Icons.login_outlined),
              title: Text('Log out'),
              onTap: () => null,
            ),
          ]),
    );
  }
}
