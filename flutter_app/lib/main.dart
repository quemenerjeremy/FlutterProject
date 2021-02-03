import 'package:flutter/material.dart';
import 'Views/MainView.dart';
import 'Views/SecondaryView.dart';

void main() {
  runApp(_MyApp());
}

// Class _MyApp start point
class _MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      routes: <String, WidgetBuilder> {
        '/': (BuildContext context) {
          return MainView();
        },
        '/SecondaryView': (BuildContext context) {
          return SecondaryView();
        }
      },
    );

  }

}