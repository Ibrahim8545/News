import 'package:flutter/material.dart';
import 'package:newsapp/api_manger.dart';
import 'package:newsapp/models/sources_response_model.dart';
import 'package:newsapp/widget/tabs_item.dart';

class NewsUi extends StatefulWidget {
  NewsUi({super.key});

  @override
  State<NewsUi> createState() => _NewsUiState();
}

class _NewsUiState extends State<NewsUi> {
  int Selected = 0;
  List<Sources> sources = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
            future: ApiManager.getSources(),
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
                    
                          return ListView.separated(
                              shrinkWrap: true,
                              separatorBuilder: (context, index) => Divider(),
                              itemCount: articles.length,
                              itemBuilder: (context, index) {
                                return (Text(
                                    articles.elementAt(index).title ?? ''));
                              });
                        }),
                  ],
                ),
              );
            }),
      ],
    );
  }
}
