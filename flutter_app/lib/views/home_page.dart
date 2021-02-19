import 'dart:developer';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading ? Center(child: CircularProgressIndicator()) : Center(
        child: ListView.separated(
          itemCount: 10,
          separatorBuilder: (BuildContext context, int index) => const Divider(),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 400,
              child: Center(
              ),
            );
          },
        ),
      ),
    );
  }
}