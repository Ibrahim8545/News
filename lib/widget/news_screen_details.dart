import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newsapp/models/news_data_response_model.dart';
import 'package:newsapp/utils/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class NeswsScreenDetails extends StatelessWidget {
  static const routeName = '/details';
   NeswsScreenDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var articles = ModalRoute.of(context)!.settings.arguments as Articles;
    return Scaffold(
     appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: const Text(
            'News',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: AppColors.green,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
         
        
        ),
      body:  Container(
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
            child: Image.network(
              articles.urlToImage??'',
              height: 240,
              )
            ),
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
          SizedBox(height: 20,),
          Text(articles.content??'',textAlign: TextAlign.justify,),
          SizedBox(height: 30,),
          InkWell(
            onTap: () {
              _launchUrl(articles.url??'');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              Text('view full aricle',style: TextStyle(fontSize: 24),),
            
              Icon(Icons.arrow_forward_ios)
            ],),
          )
        ],
      ),
    ),
    );
  }
  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}
}