import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main(){
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lyncas Sales',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const WebViewDemo(),
    );
  }
}


  class WebViewDemo extends StatefulWidget {
  const WebViewDemo({super.key});

  @override
  State<WebViewDemo> createState() => _WebViewDemoState();
  }

  class _WebViewDemoState extends State<WebViewDemo> {
  WebViewController controller = WebViewController();

  @override
  void initState(){
  super.initState();
    
  controller
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setBackgroundColor(const Color(0xFFFFFFFF))
  ..setNavigationDelegate(NavigationDelegate(
  onProgress: (progress) => {},
  onPageFinished: (url) => {},
  ))
  ..loadRequest(Uri.parse('http://192.168.0.102:8080/'));
  }

 @override
 Widget build(BuildContext context) {
 return Scaffold(
backgroundColor: Colors.white,

       body: WebViewWidget(controller: controller,),

 );
}
}