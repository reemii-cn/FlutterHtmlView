import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html_view/flutter_simple_html.dart';

void _setTargetPlatformForDesktop() {
  TargetPlatform targetPlatform;
  if (Platform.isMacOS) {
    targetPlatform = TargetPlatform.iOS;
  } else if (Platform.isLinux || Platform.isWindows) {
    targetPlatform = TargetPlatform.android;
  }
  if (targetPlatform != null) {
    debugDefaultTargetPlatformOverride = targetPlatform;
  }
}

void main() {
  _setTargetPlatformForDesktop();
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String html = '''
        <link href='http://cdn.quilljs.com/1.3.6/quill.core.css' rel='stylesheet'>
<body class='ql-editor'>
	<p>
		<p>
			&nbsp;为规范事务性罪犯履职行为，避免事务性罪犯在履职过程中因言语不规范引发与其他罪犯之间的冲突以及履职不到位、敏锐性不足等问题，第五分监狱一监区结合分监狱下发的《小龙潭监狱第五分监狱事务性罪犯管理职责》对监区事务性罪犯进行履职培训和整顿教育。
		</p>
		<p>
			<br>
		</p>
		<p>
			<img src="https://img-blog.csdn.net/20161202170132289?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQv/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center" alt="">
		</p>
		<p>
			&nbsp;&nbsp;&nbsp;
		</p>
		<p>
			会上，监区警察首先通报了近期监区发生的几起违规违纪行为，分析事务性罪犯在此过程中做得好的方面和存在的不足，肯定大多数事务性罪犯能够按照警察的要求认真履职，对身边发生的违规违纪行为进行规劝，在劝阻他人违规违纪过程中保持克制，始终树立“有事找警察”的服刑理念。其次，组织学习了《小龙潭监狱第五分监狱事务性罪犯管理职责》，就履职中“发现、制止、报告”等程序进行了重点讲解，要求与会人员善于化解矛盾而不是激化矛盾，对履职中可能出现的各种刁难进行了模拟应对，让大家更加明确自己在遇到问题的时候要怎么做。
		</p>
		<p>
			<br>
		</p>
		<p>
			监区警察还从履职中应该重点关注的人和事进行了讲解，以增强事务性罪犯对异常现象的敏锐性，做到及时把异常的人和现象及时报告警察处理。
		</p>
		<p>
			最后，监区警察鼓励事务性罪犯要大胆履职，珍惜监区良好的改造氛围和自己取得的改造成绩，珍惜岗位给自己的锻炼机会。
		</p>
		<p>
		</p>
		<p>
			2312
		</p>
		<p>
			&nbsp;
		</p>
		<p>
			&nbsp;&nbsp;&nbsp;通过整顿教育，进一步明确了监区管理事务性罪犯的具体要求，让他们在改造中更好的规劝其他罪犯，维护好监区的安全和稳定。
		</p>
		<p>
			<br>
		</p>
		<p class="ql-align-right">
		</p>
		<p class="ql-align-right">
			作者：
			<a href="http://www.xltjynw.com/Common/ShowAuthor.aspx?authorname=%e8%82%96%e6%98%a5%e6%98%8e++%e6%96%87%2f%e5%9b%be"
			target="_blank">
				肖春明 文/图
			</a>
			&nbsp;&nbsp;&nbsp;&nbsp;来源：
			<a href="http://www.xltjynw.com/Common/ShowCopyFrom.aspx?copyfrom=%e7%ac%ac%e4%ba%94%e5%88%86%e7%9b%91%e7%8b%b1%e4%b8%80%e7%9b%91%e5%8c%ba"
			target="_blank">
				第五分监狱一监区
			</a>
			&nbsp;&nbsp;
		</p>
	</p>
</body>
        ''';

    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Plugin example app'),
        ),
        body: new Container(
          child: new SimpleHtmlRender(
            html: html,
          ),
        ),
      ),
    );

//    return new MaterialApp(
//      home: new Scaffold(
//        appBar: new AppBar(
//          title: new Text('Plugin example app'),
//        ),
//        body: new SingleChildScrollView(
//          child: new Center(
//            child: new HtmlView(
//              data: html,
//              baseURL: "https://images.unsplash.com",
//              onLaunchFail: (url) {
//                print("launch $url failed");
//              },
//            ),
//          ),
//        ),
//      ),
//    );
  }
}
