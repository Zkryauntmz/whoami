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
        ),
        body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: WebView(
              initialUrl: url + data,
              javascriptMode: JavascriptMode.unrestricted,

              //"https://twitter.com/" '$data'
              //"htttp://www." '$name' ".com/" '$data'
              //            searchUserUrl(name, data)),
            )));
  }
}
