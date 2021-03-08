import 'dart:developer';
import 'package:flutter/material.dart';

class FavoriteArtciles extends StatefulWidget {

  @override
  _FavoriteArtciles createState() => _FavoriteArtciles();

}

class Article extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite articles"),
      ),
      body: Center(
            child: Container(
              child: Center(
                child: Card (
                  color: Colors.lightBlueAccent,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                            "Coronavirus France COVID19: Cases of coronavirus in France rise today",
                            style: TextStyle(fontSize: 30)),
                        Image.asset('assets/images/img.jpg'),
                        Text(
                            "There have been at least 3,560,700 confirmed cases of coronavirus in France, according to the French government. As of Sunday morning, 83,964 people had died. "
                                "National health authorities in France do not provide cumulative regional data for test-confirmed cases of the virus; only daily snapshots are reported. "
                                "They do, however, report regional data for the total number of people hospitalized for Covid-19 and how many of those people have recovered or died. ",
                            style: TextStyle( fontSize: 20)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
      ),
    );
  }
}
class _FavoriteArtciles extends State<FavoriteArtciles> {
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.separated(
          itemCount: 2,
          separatorBuilder: (BuildContext context,
              int index) => const Divider(),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 400,
              child: Center(
                  child: Card (
                    color: Colors.white54,
                    child: Container(
                      width: 380,
                      height: 600,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Image.asset('assets/images/img.jpg'),
                          Text(
                              "Coronavirus France COVID19: Cases of coronavirus in France rise today",
                              style: TextStyle()),
                          TextButton(
                            child: const Text('See more', style: TextStyle(fontSize: 30)),
                            onPressed: () {Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Article()),
                              );
                            },
                          ),
                          Padding (
                            padding: EdgeInsets.only(right: 300),
                            child: Container(
                              height: 50,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget> [
                                  IconButton(
                                      icon: Icon(Icons.favorite,color: Colors.red,),

                                      onPressed: null)],),
                            )
                          )
                        ],
                      ),
                    ),
                  ),
              ),
            );
          },
        ),
      ),
    );
  }
}

