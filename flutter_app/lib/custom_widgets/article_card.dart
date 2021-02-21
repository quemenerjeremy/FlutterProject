import 'dart:developer';
import 'package:flutter/material.dart';

class ArticlePage extends StatefulWidget {

  @override
  _ArticlePageState createState() => _ArticlePageState();

}

class _ArticlePageState extends State<ArticlePage> {

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
                child: InkWell(
                  onTap: () {
                    print("Tap at index : ${index}");
                  },
                  child: Card(
                    color: Colors.blue,
                    child: Container(
                      width: 300,
                      height: 300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset('assets/images/img.jpg'),
                          Text("Descriptions...........", style: TextStyle())
                        ],
                      ),
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