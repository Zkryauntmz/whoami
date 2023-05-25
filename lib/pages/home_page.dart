// ignore_for_file: avoid_print, unused_field

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:whoami/widgets/NavBar.dart';
import 'package:http/http.dart' as http;
import 'auth/screen2.dart';

class PhotoItem {
  late String image;
  late String name;
  late String url;

  PhotoItem(this.image, this.name, this.url);
}

final TextEditingController myController = TextEditingController();
final List<PhotoItem> _items = [
  PhotoItem(
    "https://cdn-icons-png.flaticon.com/512/124/124010.png",
    "facebook",
    "https://www.facebook.com/",
  ),
  PhotoItem(
    "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Instagram_icon.png/2048px-Instagram_icon.png",
    "instagram",
    "https://www.instagram.com/",
  ),
  PhotoItem(
    "https://cdn-icons-png.flaticon.com/512/174/174857.png",
    "linkedin",
    "https://www.linkedin.com/in/",
  ),
  PhotoItem(
      "https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png",
      "github",
      "https://www.github.com/"),
  PhotoItem(
    "https://cdn-icons-png.flaticon.com/512/124/124021.png",
    "twitter",
    "https://www.twitter.com/",
  ),
  PhotoItem(
    "https://seeklogo.com/images/T/tiktok-logo-B9AC5FE794-seeklogo.com.png",
    "tiktok",
    "https://www.tiktok.com/@",
  ),
  PhotoItem(
    "https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Telegram_2019_Logo.svg/768px-Telegram_2019_Logo.svg.png",
    "telegram",
    "https://t.me/",
  ),
  PhotoItem(
    "https://play-lh.googleusercontent.com/dVsv8Hc4TOUeLFAahxR8KANg22W9dj2jBsTW1VHv3CV-5NCZjP9D9i2j5IpfVx2NTB8",
    "pinterest",
    "https://tr.pinterest.com/",
  ),
  PhotoItem(
    "https://www.youtube.com/img/desktop/yt_1200.png",
    "Youtube",
    "https://www.youtube.com/@",
  ),
  PhotoItem(
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTp0XYQs3vYq-YHipSF_Thb3JDTWCSv2XBsoog-k5iWpRopmaCkay_6fNVSU4VZE8VAfH0&usqp=CAU",
    "Reddit",
    "https://www.reddit.com/r/",
  ),
  PhotoItem(
    "https://cdn-icons-png.flaticon.com/512/124/124021.png",
    "twitter",
    "https://stackoverflow.com/users/",
  ),
  PhotoItem(
    "https://cdn-icons-png.flaticon.com/512/124/124021.png",
    "twitter",
    "https://www.twitter.com/",
  ),
  PhotoItem(
    "https://cdn-icons-png.flaticon.com/512/124/124021.png",
    "twitter",
    "https://www.twitter.com/",
  ),
  PhotoItem(
    "https://cdn-icons-png.flaticon.com/512/124/124021.png",
    "twitter",
    "https://www.twitter.com/",
  ),
  PhotoItem(
    "https://cdn-icons-png.flaticon.com/512/124/124021.png",
    "twitter",
    "https://www.twitter.com/",
  ),
  PhotoItem(
    "https://cdn-icons-png.flaticon.com/512/124/124021.png",
    "twitter",
    "https://www.twitter.com/",
  ),
  PhotoItem(
    "https://cdn-icons-png.flaticon.com/512/124/124021.png",
    "twitter",
    "https://www.twitter.com/",
  ),
  PhotoItem(
    "https://cdn-icons-png.flaticon.com/512/124/124021.png",
    "twitter",
    "https://www.twitter.com/",
  ),
  PhotoItem(
    "https://cdn-icons-png.flaticon.com/512/124/124021.png",
    "twitter",
    "https://www.twitter.com/",
  ),
  PhotoItem(
    "https://cdn-icons-png.flaticon.com/512/124/124021.png",
    "twitter",
    "https://www.twitter.com/",
  ),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchBar(),
      drawer: NavBar(),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          crossAxisCount: 3,
        ),
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (myController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Bos Deger Girmeyin"),
                  ),
                );

                print('Bos Deger girmeyiniz');
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RouteTwo(
                      name: _items[index].name,
                      data: myController.text,
                      url: _items[index].url,
                    ),
                  ),
                );
              }
            },
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(_items[index].image),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
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
                print(myController.text);
              },
            ),
            hintText: '  Aramak İstediğiniz Kullanıcı adını giriniz ',
            border: InputBorder.none),
      ),
    ),
  ));
}







/*
searchUserUrl(
  String social,
  String userdata,
) {
  late String searchUrl;
  print(social);
  print(userdata);
  switch (social) {
    case "FACEBOOK":
      searchUrl = "https://www.facebook.com/" '$userdata';
      break;
    case "INSTAGRAM":
      searchUrl = "https://www.instagram.com/" '$userdata';
      break;
    case "LINKEDIN":
      searchUrl = "https://www.linkedin.com/in/" '$userdata';
      break;
    case "GITHUB":
      searchUrl = 'https://www.github.com/' '$userdata';
      break;
    case "TWEETER":
      break;
  }
  print(searchUrl);
  return searchUrl;
}*/
