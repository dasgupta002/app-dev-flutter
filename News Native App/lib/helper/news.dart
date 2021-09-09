import 'dart:convert';
import '../models/article.dart';
import 'package:http/http.dart' as http;

class News {
  List<Article> list = [];

  Future<void> getNews(String category) async {
    print(category);
    var url = Uri.parse('https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=a1efacbce70c42b0b0bb0dd1dc6386fc');
    var response = await http.get(url);
    var data = jsonDecode(response.body);

    if (data['status'] == "ok") {
      data['articles'].forEach((article) {
        if (article['urlToImage'] != null && article['description'] != null) {
          Article news = new Article(
              title: article['title'],
              gist: article['description'],
              content: article['url'],
              path: article['urlToImage']);
          list.add(news);
        }
      });
    }
  }
}