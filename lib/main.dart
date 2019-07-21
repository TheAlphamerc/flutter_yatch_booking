import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_yatch_booking/pages/checkout.dart';
import 'package:flutter_yatch_booking/pages/home_page_body.dart';
import 'package:flutter_yatch_booking/pages/yatch_detail.dart';
import 'package:flutter_yatch_booking/scopedModel/connectedModel.dart';
import 'package:scoped_model/scoped_model.dart';

import 'helper/customRoute.dart';
import 'model/yatch.dart';

void main() {
  //debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final YatchModel yatchModel = YatchModel();
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
        model: yatchModel,
        child: MaterialApp(
          theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'OpenSans'),
          routes: <String, WidgetBuilder>{
            '/': (_) => MyHomePage(),
            '/detail': (_) => YatchDetail(),
            '/checkout': (_) => Checkout()
          },
          onGenerateRoute: (RouteSettings settings) {
            Yatch yatch;
            final List<String> pathElements = settings.name.split('/');
            if (pathElements[0] == '') {
              return null;
            }
            if (pathElements[0] == 'detail') {
              final String planetId = pathElements[1];
              yatch = yatchModel.allYatch.firstWhere((x) {
                return x.id == planetId;
              });
                return CustomRoute<bool>(
                builder: (BuildContext context) => YatchDetail(yatch: yatch));
            }
            else if (pathElements[0] == 'checkout') {
              final String planetId = pathElements[1];
              yatch = yatchModel.allYatch.firstWhere((x) {
                return x.id == planetId;
              });
              return CustomRoute<bool>(
                builder: (BuildContext context) => Checkout(model: yatch));
            }

            else return CustomRoute<bool>(
                builder: (BuildContext context) => Checkout(model: yatch));
          },
          title: 'Flutter Demo',
        ));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, YatchModel model) {
        return Scaffold(body: HomePageBody(model));
      },
    );
  }
}
