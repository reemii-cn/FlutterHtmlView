import 'package:flutter/material.dart';
import 'package:flutter_html_view/html_parser.dart';

class SimpleHtmlRender extends StatelessWidget {
  final String html;
  final String baseUrl;
  const SimpleHtmlRender({Key key, this.html, this.baseUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: html?.isNotEmpty ?? false
          ? HtmlParser(baseUrl: baseUrl).parseHTML(html)
          : <Widget>[],
    );
  }
}
