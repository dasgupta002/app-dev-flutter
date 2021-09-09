import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Headline extends StatefulWidget {
  final String content;
  Headline({ required this.content });

  @override
  _HeadlineState createState() => _HeadlineState();
}

class _HeadlineState extends State<Headline> {
  final Completer<WebViewController> _completer = new Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Native'),
                Text(
                    'News',
                    style: TextStyle(
                        color: Colors.blue
                    )
                )
              ]
          ),
          actions: <Widget>[
            Opacity(
              opacity: 0.0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Icon(Icons.save)
              )
            )
          ]
      ),
      body: Container(
        child: WebView(
          onWebViewCreated: (WebViewController webViewController) {
            _completer.complete(webViewController);
          },
          initialUrl: widget.content
        )
      )
    );
  }
}