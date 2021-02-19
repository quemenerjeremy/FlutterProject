import 'package:flutter/material.dart';

class PageDetails extends StatefulWidget {

  final int id;

  PageDetails({Key key, this.id}) : super(key: key);

  @override
  _PageDetailsState createState() => _PageDetailsState();

}

class _PageDetailsState extends State<PageDetails> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: Text("Article title", style: TextStyle(fontSize: 25, color: Theme.of(context).accentColor)),
      ),

      body: Center(child: Text("PageDetails for the id : ${widget.id}")),

    );
  }
}