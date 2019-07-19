import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_yatch_booking/pages/checkout.dart';
import 'package:flutter_yatch_booking/pages/home_page_body.dart';
import 'package:flutter_yatch_booking/pages/yatch_detail.dart';

void main() 
{ 
 //debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'OpenSans'),
            routes: <String, WidgetBuilder>{
              '/': (_) => MyHomePage(),
              '/detail': (_) => YatchDetail(),
              '/checkout': (_)=> Checkout()
            },

      title: 'Flutter Demo',
    );
  }
}

class MyHomePage extends StatefulWidget {
  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: HomePageBody()
    );
  }
}
