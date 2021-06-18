import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final String imageurl;
  final String title;
  final String description;
  

  const NewsCard(
      {Key key,
      @required this.imageurl,
      @required this.title,
      @required this.description, })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            Container(
      height: MediaQuery.of(context).size.height * .35,
      decoration: BoxDecoration(
          color: Colors.black26,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  imageurl))),
            ),
            Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
            ),
            Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        description,
        style: TextStyle(fontSize: 16),
      ),
            ),
        
      
          ],
        );
    
  }
}
