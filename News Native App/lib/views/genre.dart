import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../helper/news.dart';
import '../models/article.dart';
import '../views/headline.dart';

class Genre extends StatefulWidget {
  final String literal;
  Genre({required this.literal});

  @override
  _GenreState createState() => _GenreState();
}

class _GenreState extends State<Genre> {
  List<Article> articles = [];
  bool _loading = true;

  void fetchNews() async {
    News news = new News();
    await news.getNews(widget.literal);
    articles = news.list;

    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();

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
              ),
              actions: <Widget>[
                Opacity(
                  opacity: 0.0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Icon(Icons.save)
                  )
                )
              ]
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

class Blog extends StatelessWidget {
  final String title;
  final String gist;
  final String path;
  final String content;
  Blog({ required this.title, required this.gist, required this.content, required this.path });

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