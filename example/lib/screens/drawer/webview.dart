import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewDrawer extends StatelessWidget {
  final String? url;
  WebViewDrawer({Key? key, this.url}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(initialUrl: url),
      appBar: new AppBar(
        title: Image.asset(
          'lib/assets/icons/gflogo.png',
          width: 150,
        ),
        centerTitle: true,
        backgroundColor: AnterosColors.DARK,
      ),
    );
  }
}
