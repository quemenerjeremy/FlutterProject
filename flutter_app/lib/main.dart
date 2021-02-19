import 'package:flutter/material.dart';
import 'package:flutter_app/views/master_page.dart';

void main() {
  runApp(_MyApp());
}

// Class _MyApp start point
class _MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder> {
        '/': (BuildContext context) {
          return MasterPage();
        },
      },
    );

  }

}