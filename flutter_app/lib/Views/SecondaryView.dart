import 'package:flutter/material.dart';

class SecondaryView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SecondaryView"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("This is the SecondaryView <3"),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                }, 
                child: Text("Back to MainView"))
        ],
      ),
      ),
    );
  }

}