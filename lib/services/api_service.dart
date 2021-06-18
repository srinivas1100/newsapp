import 'dart:convert';

import 'package:http/http.dart';
import 'package:newsapp/models/articles.dart';

class APIService {

  final String endPointUrl = "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=34c9e9c2867b4bf9bca0f78cbc7dc7aa";
  
  Future<List<Article>> getArticles() async {
    Response res = await get(Uri.parse(endPointUrl));
    if(res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      List<dynamic> body = json['articles'];
      List<Article> articles = body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;

    }else{
      throw('Cant\'t get the Articles');
    }
    
  }
}