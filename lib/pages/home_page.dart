// ignore_for_file: avoid_print, unused_field

import 'package:flutter/material.dart';
import 'package:whoami/widgets/NavBar.dart';
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
    "FACEBOOK",
    "https://www.facebook.com/",
  ),
  PhotoItem(
    "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Instagram_icon.png/2048px-Instagram_icon.png",
    "INSTAGRAM",
    "https://www.instagram.com/",
  ),
  PhotoItem(
    "https://cdn-icons-png.flaticon.com/512/174/174857.png",
    "LINKEDIN",
    "https://www.linkedin.com/in/",
  ),
  PhotoItem(
      "https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png",
      "GITHUB",
      "https://www.github.com/"),
  PhotoItem(
    "https://cdn-icons-png.flaticon.com/512/124/124021.png",
    "TWITTER",
    "https://www.twitter.com/",
  ),
  PhotoItem(
    "https://seeklogo.com/images/T/tiktok-logo-B9AC5FE794-seeklogo.com.png",
    "TIKTOK",
    "https://www.tiktok.com/@",
  ),
  PhotoItem(
    "https://play-lh.googleusercontent.com/dVsv8Hc4TOUeLFAahxR8KANg22W9dj2jBsTW1VHv3CV-5NCZjP9D9i2j5IpfVx2NTB8",
    "PINSTEREST",
    "https://tr.pinterest.com/",
  ),
  PhotoItem(
    "https://www.youtube.com/img/desktop/yt_1200.png",
    "YOUTUBE",
    "https://www.youtube.com/@",
  ),
  PhotoItem(
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTp0XYQs3vYq-YHipSF_Thb3JDTWCSv2XBsoog-k5iWpRopmaCkay_6fNVSU4VZE8VAfH0&usqp=CAU",
    "REDDIT",
    "https://www.reddit.com/r/",
  ),
  PhotoItem(
    "https://cdn-icons-png.flaticon.com/512/3938/3938067.png",
    "VK",
    "https://vk.com/",
  ),
  PhotoItem(
    "https://static.vecteezy.com/system/resources/previews/018/910/819/original/twitch-logo-twitch-icon-twitch-symbol-free-free-vector.jpg",
    "TWİTCH TV",
    "https://www.twitch.tv//",
  ),
  PhotoItem(
    "https://cdns.iconmonstr.com/wp-content/releases/preview/2012/240/iconmonstr-tumblr-3.png",
    "TUMBLR",
    "https://www.tumblr.com/",
  ),
  PhotoItem(
    "https://cdn.icon-icons.com/icons2/1508/PNG/512/9gag_104549.png",
    "9GAG",
    "https://9gag.com/u/",
  ),
  PhotoItem(
    "https://cdn.icon-icons.com/icons2/2972/PNG/512/askfm_logo_icon_186890.png",
    "ASK.FM",
    "https://ask.fm/",
  ),
  PhotoItem(
    "https://store-images.s-microsoft.com/image/apps.38986.9007199266245737.4ac20127-5f19-4331-ac09-d2ce324e483a.6ce1617b-b233-4789-ad55-712caf23cfb3",
    "FLİPBOARD",
    "https://flipboard.com/@",
  ),
  PhotoItem(
    "https://static1.dmcdn.net/images/dailymotion-logo-ogtag.png.v2889585078f8ced02",
    "DAILYMOTİON",
    "https://www.dailymotion.com/",
  ),
  PhotoItem(
    "https://play-lh.googleusercontent.com/RdCklOFg3SLN5QF8OR7cU-5bs1ESYo_pqGYrK2ena3XZDcrLOpjf7vLtNQELOR7Uo4MH",
    "VSCO",
    "https://vsco.co/",
  ),
  PhotoItem(
    "https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,f_auto,q_auto:eco,dpr_1/lwzjoock7hcnuuo0nmmr",
    "WATTPAD",
    "https://www.wattpad.com/user/",
  ),
  PhotoItem(
    "https://upload.wikimedia.org/wikipedia/en/thumb/8/80/Wikipedia-logo-v2.svg/1200px-Wikipedia-logo-v2.svg.png",
    "WIKIPEDİA",
    "https://tr.wikipedia.org/wiki/",
  ),
  PhotoItem(
    "https://play-lh.googleusercontent.com/N71vAyC7rR2b37QDIvFOHF-sMhzt4A75hzb0UoY1t3dbAYROWWkteY-BIjqaBjF6qhg",
    "YOUNOW",
    "https://www.younow.com/",
  ),
];
List<dynamic> liked = [];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  //const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: searchBar(),
      drawer: NavBar(),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 25,
          mainAxisSpacing: 25,
          crossAxisCount: 3,
        ),
        itemCount: _items.length,
        padding: const EdgeInsets.all(15),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (myController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("BOS DEĞER GIRMEYIN"),
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
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(_items[index].image),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (myController.text.isEmpty) {
            return;
          } else {
            liked.add(myController.text);
          }
        },
        highlightElevation: 50,
        hoverElevation: 50,
        hoverColor: Colors.redAccent,
        backgroundColor: Colors.redAccent,
        child: const Icon(Icons.add),
      ),
    );
  }
}

AppBar searchBar() {
  return AppBar(
      // The search area here
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
      title: Container(
        width: 320,
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
                    // print(myController.text);
                    print(liked);
                  },
                ),
                hintText: ' KULLANICI BILGILERINI GIRINIZ  ',
                border: InputBorder.none),
          ),
        ),
      ));
}
