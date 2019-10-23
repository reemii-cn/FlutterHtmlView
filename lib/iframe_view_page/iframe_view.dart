import 'package:flutter/material.dart';
import 'package:flutter_html_view/flutter_native_html.dart';

class IframeViewPage extends StatelessWidget {
  final String name;
  final String url;
  const IframeViewPage({Key key, this.name = "其他", this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(name)),
        body: MyInAppWebView(
            webUrl: url,
            webRect: const Rect.fromLTWH(
                0.0, 0.0, double.infinity, double.infinity)));
  }
}
