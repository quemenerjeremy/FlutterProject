import 'package:flutter/material.dart';

// PageDetails is the page that the user will access to the artciles infos.

class PageDetails extends StatefulWidget {

  // Id is the index of the card that has been clicked. It comes as parameter of the PageDetails class.
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

  // The class will just display a new Scaffold with the title of the selected article and it's id.

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