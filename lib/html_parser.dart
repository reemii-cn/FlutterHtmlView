import 'dart:convert';

// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html_view/flutter_html_text.dart';
// import 'package:flutter_html_view/flutter_html_video.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' show parse;
// import 'package:video_player/video_player.dart';

import 'flutter_native_html.dart';

class HtmlParser {
  TextOverflow overflow;
  int maxLines;
  String baseUrl;
  Function onLaunchFail;

  HtmlParser({this.baseUrl, this.onLaunchFail, this.overflow, this.maxLines});

  _parseChildren(dom.Element e, widgetList) {
    if (e.localName == "img" && e.attributes.containsKey('src')) {
      var src = e.attributes['src'];

      if (src.startsWith("http") || src.startsWith("https")) {
        widgetList.add(Image.network(
          src,
          fit: BoxFit.scaleDown,
        ));
      } else if (src.startsWith('data:image')) {
        var exp = new RegExp(r'data:.*;base64,');
        var base64Str = src.replaceAll(exp, '');
        var bytes = base64.decode(base64Str);
        widgetList.add(new Image.memory(bytes, fit: BoxFit.scaleDown));
      } else if (baseUrl != null && baseUrl.isNotEmpty && src.startsWith("/")) {
        widgetList.add(new Image.network(
          baseUrl + src,
          fit: BoxFit.scaleDown,
        ));
      }
    } else if (e.localName == "video") {
      // if (e.attributes.containsKey('src')) {
      //   var src = e.attributes['src'];
      //   // var videoElements = e.getElementsByTagName("video");
      //   widgetList.add(
      //     new NetworkPlayerLifeCycle(
      //       src,
      //       (BuildContext context, VideoPlayerController controller) =>
      //           new AspectRatioVideo(controller),
      //     ),
      //   );
      // } else {
      //   if (e.children.length > 0) {
      //     e.children.forEach((dom.Element source) {
      //       try {
      //         if (source.attributes['type'] == "video/mp4") {
      //           var src = e.children[0].attributes['src'];
      //           widgetList.add(
      //             new NetworkPlayerLifeCycle(
      //               src,
      //               (BuildContext context, VideoPlayerController controller) =>
      //                   new AspectRatioVideo(controller),
      //             ),
      //           );
      //         }
      //       } catch (e) {
      //         print(e);
      //       }
      //     });
      //   }
      // }
    } else if (e.localName == 'iframe') {
      // todo 渲染iframe
      var src = e.attributes['src'];
      if (src?.isEmpty ?? true) return;
      widgetList.add(MyInAppWebView(
          webUrl: src,
          webRect: const Rect.fromLTWH(0.0, 0.0, double.infinity, 400.0)));
    } else {
      if (e.children.length > 0 || !_onlyHasText(e.children))
        e.children.forEach((e) => _parseChildren(e, widgetList));
      else
        widgetList.add(new HtmlText(
          data: e.outerHtml,
          onLaunchFail: this.onLaunchFail,
          overflow: this.overflow,
          maxLines: this.maxLines,
        ));
    }
  }

  bool _onlyHasText(List<dom.Element> elements) {
    for (var ele in elements) {
      if (ele.localName == 'img' ||
          ele.localName == 'iframe' ||
          ele.localName == 'video') return false;
    }
    return true;
  }

  List<Widget> parseHTML(String html) {
    List<Widget> widgetList = new List();

    dom.Document document = parse(html);

    dom.Element docBody = document.body;

    List<dom.Element> styleElements = docBody.getElementsByTagName("style");
    List<dom.Element> scriptElements = docBody.getElementsByTagName("script");
    if (styleElements.length > 0) {
      for (int i = 0; i < styleElements.length; i++) {
        docBody.getElementsByTagName("style").first.remove();
      }
    }
    if (scriptElements.length > 0) {
      for (int i = 0; i < scriptElements.length; i++) {
        docBody.getElementsByTagName("script").first.remove();
      }
    }

    List<dom.Element> docBodyChildren = docBody.children;
    if (docBodyChildren.length > 0)
      docBodyChildren.forEach((e) => _parseChildren(e, widgetList));

    return widgetList;
  }
}
