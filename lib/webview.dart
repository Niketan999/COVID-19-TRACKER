import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
void main(){
  runApp(Webview());
}
class Webview extends StatefulWidget {
  @override
  _WebviewState createState() => _WebviewState();
}

class _WebviewState extends State<Webview> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          body: Container(
            height: double.infinity,
            width: double.infinity,
            child: WebView(
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: 'https://www.bing.com/covid/local/india?vert=graph',
            ),
          ),
        );
  }
}
