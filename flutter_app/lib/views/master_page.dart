import 'package:flutter/material.dart';
import 'package:flutter_app/views/home_page.dart';
import 'favorite_articles.dart';
import 'package:flutter_app/views/categories_page.dart';
import 'package:flutter_app/views/profile.dart';

// MasterPage manages the header, the content displayed and the bottomBar for navigation.

// StatefulWidget to be able to apply state changes to class variables during runtime.
class MasterPage extends StatefulWidget {

  @override
  _MasterPageState createState() => _MasterPageState();

}

class _MasterPageState extends State<MasterPage> {

  String _currentTitle = 'Top Headlines';
  int _index = 0;

  // List of our content widgets to be able to display the content according to the user's choice on the bottomBar.
  List<Widget> _widgets = <Widget>[
    HomePage(),
    CategoriesPage(),
    FavoriteArtciles(),
    ProfilPage()
  ];

  // onPressItem makes changes (here the title of the page) according to the user's selection on the bottomBar.
  void onPressItem(int index) {
    _index = index;
    switch (index) {
      case 0:
        _currentTitle = "Top Headlines";
        break;
      case 1:
        _currentTitle = "Favorite Categories";
        break;
      case 2:
        _currentTitle = "Favorite Articles";
        break;
      case 3:
        _currentTitle = "Profile";
        break;
    }
    // We apply the changes of state of our variables at the end.
    setState(() {});
  }

  // Small function to display and remove the return arrow of our leader in the header.
  IconButton _leadingButton() {
    if (_index != 0)
      return  IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          onPressItem(0);
        },
      );
    else
      return null;
  }

  // Building widget
  @override
  Widget build(BuildContext context) {
    // Scaffold type page to be able to assign a header (AppBar), a body (our list of widgets) and our bottomBar (BottomNavigationBar).
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: _leadingButton(),
        title: Text(
          _currentTitle,
          style: TextStyle(fontSize: 25, color: Theme.of(context).accentColor),
        ),
      ),
      body: Row(
        children: [
          // Expanded so that the selected widget fills all the remaining space.
          Expanded(child: _widgets.elementAt(_index))
        ],
      ),
      // BottomNavigationBar for our bottomBar which will manage our navigations.
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.public,
                color: Colors.grey,
              ),
              label: 'Headlines'
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.apps_rounded,
                color: Colors.grey,
              ),
              label: 'Topics'
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.star_border,
                color: Colors.grey,
              ),
              label: 'Favorites'
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                color: Colors.grey,
              ),
              label: 'Profile'
          ),
        ],
        currentIndex: _index,
        selectedItemColor: Colors.cyan,
        onTap: onPressItem,
      ),
    );
  }

}