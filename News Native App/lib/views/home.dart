import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../helper/data.dart';
import '../models/category.dart';
import '../models/article.dart';
import '../helper/news.dart';
import '../views/genre.dart';
import '../views/headline.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Category> list = [];
  List<Article> articles = [];
  late bool _loading;

  void fetchNews() async {
    News news = new News();
    await news.getNews('general');
    articles = news.list;

    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    _loading = true;
    
    list = fetch();
    fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0.0,
            title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Native'),
                  Text(
                    'News', 
                    style: TextStyle(
                      color: Colors.blue
                    )
                  )
                ]
              )
            ),
        body: _loading
            ? Center(
              child: Container(
                child: CircularProgressIndicator()
              )
            )
            : SingleChildScrollView(
                child: Container(
                    child: Column(children: <Widget>[
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    height: 68.0,
                    child: ListView.builder(
                        itemCount: list.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Tile(path: list[index].path, category: list[index].name);
                        }
                    )
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                    child: ListView.builder(
                        itemCount: articles.length,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Blog(title: articles[index].title, gist: articles[index].gist, content: articles[index].content, path: articles[index].path);
                        }
                      )
                    )
              ]
            )
          )
        )
    );
  }
}

class Tile extends StatelessWidget {
  final String path;
  final String category;
  Tile({ required this.path, required this.category });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Genre(literal: category.toLowerCase());
        }));
      },
      child: Container(
          margin: EdgeInsets.only(right: 16.0),
          child: Stack(children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(6.0),
                child: CachedNetworkImage(
                    imageUrl: path,
                    width: 120.0,
                    height: 60.0,
                    fit: BoxFit.cover
                )
            ),
            Container(
                alignment: Alignment.center,
                width: 120.0,
                height: 60.0,
                decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(6.0)),
                child: Text(
                  category,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500
                    )
                  )
                )
          ]
        )
      ),
    );
  }
}

class Blog extends StatelessWidget {
  final String title;
  final String gist;
  final String path;
  final String content;
  Blog({ required this.title, required this.gist, required this.content, required this.path});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Headline(content: content);
          }));
        },
        child: Container(
            margin: EdgeInsets.only(bottom: 16.0),
            width: MediaQuery.of(context).size.width,
            child: Column(children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.circular(6.0),
                  child: CachedNetworkImage(imageUrl: path)
              ),
              SizedBox(height: 10.0),
              Text(title,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500
                  )
              ),
              SizedBox(height: 10.0),
              Text(
                gist, 
                style: TextStyle(
                  color: Colors.black54
                )
              )
            ]
          )
        )
      );
  }
}