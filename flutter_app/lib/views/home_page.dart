import 'package:flutter/material.dart';
import 'package:flutter_app/views/page_details.dart';
import 'package:flutter_app/models/news.dart';
import 'package:flutter_app/controllers/news_api_controller.dart';

// HomePage StatefulWidget that will display byr default the Top headlines of the moment.

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  // _isLoading a boolean that will notify if the app has recieve the news from the API.
  bool _isLoading = false;

  // _news will be the class instance of News and it will store the data of the Api to be displayed.
  News _news;

  // _api is the instance of NewsApiController class. It will allows to the view to communicate with the controller,
  // and then perform api calls.
  NewsApiController _api = NewsApiController();

  @override
  void initState() {
    super.initState();
    // We fetch the data when the widget is mounted.
    //_fetchTopHeadlines();
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

  // A simple request function, that will get the TopHeadlines articles from the NewsApi.
  _fetchTopHeadlines() async {

    // We setup the loading during the request.
    setState(() {
      _isLoading = true;
    });

    // Then we try to get the Api datas
    try {
      // Making the request and save it in a temporary variable
      var news = await _api.getTopHeadlines();

      // Then we set the state of our News class instance with the api datas.
      setState(() {
        _news = news;
      });
    } catch(err) {
      // Error managing here.
      setState(() {
        _news = null;
      });
    } finally {
      // Finally we stop the loading icon.
      setState(() {
        _isLoading = false;
      });
    }

  }
}