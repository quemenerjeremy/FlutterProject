import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:flutter_app/views/page_details.dart';
import 'package:flutter_app/models/articles.dart';

// Un customWidget qui va nous permettre d'afficher des cartes contenant la preview de nos articles dans la HomePage pour avoir un code plus lisible.

class ArticleCard extends StatefulWidget {
  final Articles articles;
  final int index;

  ArticleCard({Key key, this.articles, this.index}) : super(key: key);

  @override
  _ArticleCardState createState() => _ArticleCardState();

}

class _ArticleCardState extends State<ArticleCard> {

  IconData _isFavorite;
  MaterialColor _isFilled;

  @override
  void initState() {
    super.initState();
    _isFavorite = Icons.favorite_border;
    _isFilled = Colors.grey;
    if (widget.articles.urlToImage == null) {
      widget.articles.urlToImage = "https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled.png";
    }
    print(widget.articles.urlToImage);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                InkWell(
                    onTap: () {
                      print("Tap at index : ${widget.index}");
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PageDetails(articles: widget.articles, isFavorite: _isFavorite, isFilled: _isFilled,)));
                    },
                    child: Container(
                      width: 300,
                      height: 400,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text("${widget.articles.title}", textAlign: TextAlign.center,style: TextStyle(fontSize: 17, color: Theme.of(context).accentColor)),
                          ClipRRect(borderRadius: BorderRadius.circular(8.0), child: Image(image: NetworkImage(widget.articles.urlToImage), height: 200)),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: Text("${widget.articles.description}", maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left,style: TextStyle(fontSize: 13)),
                          )
                        ],
                      ),
                    )
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Container(
                        height: 40,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                icon: Icon(_isFavorite),
                                iconSize: 30,
                                color: _isFilled,
                                onPressed: () {
                                  setState(() {
                                    if (_isFavorite != Icons.favorite) {
                                      _isFavorite = Icons.favorite;
                                      _isFilled = Colors.red;
                                    } else {
                                      _isFavorite = Icons.favorite_border;
                                      _isFilled = Colors.grey;
                                    }
                                  });
                                }
                            ),
                            Text("${Jiffy(widget.articles.date).fromNow()}")
                          ],
                        )
                    )
                )
              ],
            ),
          ),
        )
    );
  }

}