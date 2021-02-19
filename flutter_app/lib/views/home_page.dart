import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/page_details.dart';

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
              height: 300,
              child: Center(
                child: InkWell(
                  onTap: () {
                    print("Tap at index : ${index}");
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PageDetails(id: index)));
                  },
                  child: Card(
                    color: Colors.white70,
                    child: Container(
                      width: 300,
                      height: 300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset('assets/images/img.jpg'),
                          Text("Article id : ${index}", style: TextStyle())
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