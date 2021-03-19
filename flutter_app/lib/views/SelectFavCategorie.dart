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
    "Business",
    "Entertainement",
    "General",
    "Health",
    "Science",
    "Sports",
    "Technology"
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme
              .of(context)
              .accentColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Select topics", style: TextStyle(fontSize: 20, color: Theme
            .of(context)
            .accentColor)),
        actions: [
          FlatButton(
              onPressed: () {
                Navigator.pop(
                    context, {"boolTab": check, "stringTab": chooseTopic});
              },
              child: const Text("Submit")
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
                                if (check[index] == false)
                                  chooseTopic.add(categoryTitles[index]);
                                else
                                  chooseTopic.remove(categoryTitles[index]);
                                check[index] = value;
                              });
                            }
                        )
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