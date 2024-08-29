import 'package:flutter/material.dart';
import 'package:newsapp/models/news_data_response_model.dart';

class NewsItem extends StatelessWidget {
  Articles articles;
 NewsItem({required this.articles ,  super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(articles.urlToImage??'')),
          Text(
            articles.source?.name??'',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          Text(
            articles.title??'',
            style: TextStyle(
              fontSize: 22,
            ),
            ),
          Text(
            articles.description??'',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey
            ),
          ),
          Text(articles.publishedAt?.substring(0,10)??'',textAlign: TextAlign.end,),
      
        ],
      ),
    );
  }
}