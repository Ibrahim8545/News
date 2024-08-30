import 'package:flutter/material.dart';
import 'package:newsapp/api_manger.dart';
import 'package:newsapp/models/sources_response_model.dart';
import 'package:newsapp/widget/news_item.dart';
import 'package:newsapp/widget/tabs_item.dart';

class NewsUi extends StatefulWidget {
  String id;
  NewsUi({required this.id, super.key});

  @override
  State<NewsUi> createState() => _NewsUiState();
}

class _NewsUiState extends State<NewsUi> {
  int Selected = 0;
  List<Sources> sources = [];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getSources(widget.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('snapshot.error.toString()'));
          }
          sources = snapshot.data?.sources ?? [];
    
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                DefaultTabController(
                  length: sources.length,
                  child: TabBar(
                    onTap: (value) {
                      Selected = value;
                      setState(() {});
                    },
                    isScrollable: true,
                    indicatorColor: Colors.transparent,
                    dividerColor: Colors.transparent,
                    tabs: sources
                        .map(
                          (e) => TabsItem(
                            sources: e,
                            isSelected: sources.elementAt(Selected) == e,
                          ),
                        )
                        .toList(),
                  ),
                ),
                FutureBuilder(
                    future: ApiManager.getNewsData(
                        sources[Selected].id ?? ''),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(
                            child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return const Center(
                            child: Text('snapshot.error.toString()'));
                      }
                      var articles = snapshot.data?.articles ?? [];
                
                      return Expanded(
                        child: ListView.separated(
                         
                            separatorBuilder: (context, index) =>const  SizedBox(height: 8,),
                            itemCount: articles.length,
                            itemBuilder: (context, index) {
                              return (NewsItem(articles: articles[index]));
                            }),
                      );
                    }),
              ],
            ),
          );
        });
  }
}
