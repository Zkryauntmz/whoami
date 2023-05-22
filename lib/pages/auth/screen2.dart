import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// text bos olup olmadıgını kontrol ett ona göre iconları göster
// ignore: must_be_immutable
class RouteTwo extends StatelessWidget {
  final String name;
  final String data;
  late String url;

  RouteTwo(
      {Key? key, required this.name, required this.data, required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(name),
        ),
        body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: WebView(initialUrl: name + data

                //"https://twitter.com/" '$data'
                //"htttp://www." '$name' ".com/" '$data'
                //            searchUserUrl(name, data)),
                )));
  }
}
