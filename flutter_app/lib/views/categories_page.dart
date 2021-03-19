import 'package:flutter/material.dart';
import 'package:flutter_app/controllers/news_api_controller.dart';
import 'package:flutter_app/custom_widgets/article_card.dart';
import 'package:flutter_app/models/news.dart';

class CategoriesPage extends StatefulWidget {

  @override
  _CategoriesPageState createState() => _CategoriesPageState();

}

class _CategoriesPageState extends State<CategoriesPage> {

  bool _isLoading = false;
  List<String> strArr = ["Latest", "France", "World", "Latest", "Technology", "Entertainement"];
  News _news;

  NewsApiController _apiController = NewsApiController();

  @override
  void initState() {
    super.initState();
    _fetchFavContent();
  }

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
        length: strArr.length,
        child: Scaffold(
          appBar: TabBar(
            isScrollable: true,
            unselectedLabelColor: Colors.grey,
            tabs: [
                for (var tabText in strArr)
                  Tab(text: tabText)
              ]
          ),

          body: _isLoading ? Center(child: CircularProgressIndicator()) : ListView.separated(
              itemCount: _news.articles.length,
              separatorBuilder: (BuildContext context, int index) => const Divider(),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 500,
                  child: Center(
                    child: ArticleCard(articles: _news.articles[index], index: index)
                  ),
                );
              },
          )
        )
    );
  }

  _fetchFavContent() async {
    // We setup the loading during the request.
    setState(() {
      _isLoading = true;
    });

    // Then we try to get the Api datas
    try {
      // Making the request and save it in a temporary variable
      var news = await _apiController.getTopHeadlines();

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