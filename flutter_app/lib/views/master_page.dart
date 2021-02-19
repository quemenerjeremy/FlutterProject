import 'package:flutter/material.dart';
import '../main.dart';

class MainView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("MainView"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Hello World ! This is the main View les Bros !",
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/SecondaryView");
                },
                child: Text(
                  "Change screen"
                ))
          ],
        ),
        /*child: Text(
          "Hello World ! This is the main View les Bros !",
        ),*/
      ),
    );
  }

}