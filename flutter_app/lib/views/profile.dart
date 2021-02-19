import 'dart:developer';
import 'package:flutter/material.dart';

class ProfilPage extends StatefulWidget {

  @override
  _ProfilPageState createState() => _ProfilPageState();

}

class _ProfilPageState extends State<ProfilPage> {

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