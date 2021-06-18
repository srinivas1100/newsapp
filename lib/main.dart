import 'package:flutter/material.dart';
import 'package:newsapp/services/api_service.dart';
//import 'package:tiktoklikescroller/tiktoklikescroller.dart';
import 'package:newsapp/models/articles.dart';
import 'package:newsapp/widgets/news_card.dart';
import 'package:tiktoklikescroller/tiktoklikescroller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    APIService service = APIService();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        elevation: 0.0,
        title: Text(
          "NewsFeed",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<Object>(
          future: service.getArticles(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List<Article> articles = snapshot.data;
              return TikTokStyleFullPageScroller(
                contentSize: articles.length,
                swipeVelocityThreshold: 2000,
                animationDuration: const Duration(milliseconds: 300),
                builder: (BuildContext context, int index) {
                  return NewsCard(
                    imageurl: articles[index].urlToImage,
                    title: articles[index].title,
                    description: articles[index].description,
                  );
                  //Text(articles[index].description);
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
