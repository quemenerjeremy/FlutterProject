import 'package:flutter/material.dart';

class FavCategories extends StatefulWidget {

  List<bool> check;
  List<String> listTopics;

  FavCategories({Key key, this.check, this.listTopics}) : super(key: key);

  @override
  _FavCategoriesState createState() => _FavCategoriesState();

}

class _FavCategoriesState extends State<FavCategories> {
  List<String> categoryTitles = [
    "business",
    "entertainement",
    "general",
    "health",
    "science",
    "sports",
    "technology"
  ];
  var check = List<bool>.filled(7, false);
  List<String> chooseTopic = [];

  @override
  void initState() {
    super.initState();
    favChange();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Favorite Category", style: TextStyle(fontSize: 20, color: Theme
            .of(context)
            .accentColor)),
        actions: [
          FlatButton(
              onPressed: () {
                Navigator.pop(
                    context, {"boolTab": check, "stringTab": chooseTopic});
              },
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.done, color: Theme.of(context).accentColor),
                    ),
                    Text("Submit", style: TextStyle(color:Theme.of(context).accentColor))
                  ]
              )
          ),
        ],
      ),
      body: Padding(
          padding: EdgeInsets.only(top: 30),
          child: ListView.builder(
              itemCount: categoryTitles.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        CheckboxListTile(
                            title: Text("${categoryTitles[index]}"),
                            value: check[index],
                            onChanged: (bool value) {
                              setState(() {
                                if (check[index] == false) {
                                  chooseTopic.add(categoryTitles[index]);
                                }
                                else
                                  chooseTopic.remove(categoryTitles[index]);
                                check[index] = value;
                              });
                            })
                      ],
                    ),
                  ),
                );
              }
          )
      ),
    );
  }

  void favChange() {
    if (widget.check != null && widget.check.length > 0) {
      setState(() {
        check = widget.check;
      });
    }
    else {
      check = List<bool>.filled(7, false);
    }
    if (widget.listTopics != null && widget.check.length > 0) {
      setState(() {
        chooseTopic = widget.listTopics;
      });
    }
    else {
      chooseTopic = [];
    }
  }
}