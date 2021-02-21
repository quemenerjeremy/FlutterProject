import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_app/custom_widgets/article_card.dart';

class CategoriesPage extends StatefulWidget {

  @override
  _CategoriesPageState createState() => _CategoriesPageState();

}

class _CategoriesPageState extends State<CategoriesPage> {

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {



    return DefaultTabController(
        length: 6,
        child: Scaffold(
          appBar: TabBar(
            isScrollable: true,
            unselectedLabelColor: Colors.grey,
            //indicatorColor: Colors.white,
              tabs: [
                Tab(text: "Latest"),
                Tab(text: "France"),
                Tab(text: "World"),
                Tab(text: "Latest"),
                Tab(text: "Technology"),
                Tab(text: "Entertainement")
              ]
          ),
          body: TabBarView (
            children: [
              ArticlePage(),
              ArticlePage(),
              ArticlePage(),
              ArticlePage(),
              ArticlePage(),
              ArticlePage()
            ],
          ),
        )
    );
  }
}