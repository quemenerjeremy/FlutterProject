import 'package:flutter/material.dart';
import 'package:flutter_app/custom_widgets/article_card.dart';
import 'package:flutter_app/models/news.dart';
import 'package:flutter_app/controllers/news_api_controller.dart';
import 'package:flutter_app/models/sharedUserData.dart';
import 'package:flutter_app/models/user.dart';

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
  User _user;
  // _api is the instance of NewsApiController class. It will allows to the view to communicate with the controller,
  // and then perform api calls.
  NewsApiController _api = NewsApiController();

  @override
  void initState() {
    super.initState();
    // We fetch the data when the widget is mounted.
    _setupPageResults();
  }

  _setupPageResults() async {
    setState(() {
      _isLoading = true;
    });
    try {
      var isUserExist = User.fromJson(await SharedPrefUser().getUser());
      if (isUserExist != null) {
        setState(() {
          _user = isUserExist;
        });
      }
      await _fetchTopHeadlines();
    } catch(err) {
      print(err);
      setState(() {
        _user = User();
        _user.selectTopic = [true,true,true,true,true,true,true];
        _user.listTopics = ["business", "entertainement", "general", "health", "science", "sports", "technology"];
        _user.favArticles = [];
      });
      await SharedPrefUser().saveUser(_user);
      await _fetchTopHeadlines();
    }finally {
      setState(() {
        _isLoading = false;
      });
    }
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
      var news = await _api.getTopHeadlines(_user.country);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading ? Center(child: CircularProgressIndicator()) : Center(
        child: ListView.separated(
          itemCount: _news.articles.length,
          separatorBuilder: (BuildContext context, int index) => const Divider(),
          itemBuilder: (BuildContext context, int index) {
            return Container(
                height: 500,
                child: Center(child: ArticleCard(articles: _news.articles[index], index: index, user: _user))
            );
          },
        ),
      ),
    );
  }
}