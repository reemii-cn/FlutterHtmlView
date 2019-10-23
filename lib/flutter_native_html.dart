import 'package:flutter/material.dart';
import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';

class MyInAppWebView extends StatelessWidget {
  String webUrl;
  final Rect webRect;
  InAppWebViewController webView;

  MyInAppWebView({Key key, this.webUrl, this.webRect}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    InAppWebView webWidget = InAppWebView(
      initialUrl: webUrl,
      initialHeaders: {},
      initialOptions: {
        'transparentBackground': true,
        'enableViewportScale': true,
        'suppressesIncrementalRendering': true,
        'allowsBackForwardNavigationGestures': false,
        'allowsLinkPreview': false,
      },
      onWebViewCreated: (InAppWebViewController controller) {
        webView = controller;
      },
      // onLoadStart: (InAppWebViewController controller, String url) {
      //   print("InAppWebView.onLoadStart: $url");
      // },
      // onProgressChanged: (InAppWebViewController controller, int progress) {
      //   double prog = progress / 100;
      //   print('InAppWebView.onProgressChanged: $prog');
      // }
    );
    return Container(
      width: webRect.width,
      height: webRect.height,
      child: webWidget,
    );
  }
}
