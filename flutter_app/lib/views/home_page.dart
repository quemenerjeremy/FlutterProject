import 'package:flutter/material.dart';
import 'package:flutter_app/views/page_details.dart';

// HomePage StatefulWidget that will display byr default the Top headlines of the moment.

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  // _isLoading a boolean that will notify if the app has recieve the news from the API.
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // If the loading is finished we display the List of our news widgets. Otherwise we will display a loading icon.
      body: _isLoading ? Center(child: CircularProgressIndicator()) : Center(
        // ListView is a fake List that will show the way that we will display our news cards.
        child: ListView.separated(
          itemCount: 10,
          separatorBuilder: (BuildContext context, int index) => const Divider(),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 300,
              child: Center(
                // InkWell is a widget that allows a click event on the child widget.
                child: InkWell(
                  onTap: () {
                    // If a user click on the child of the InkWell widget the app will navigate to the PageDetails class at the specified index.
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