import 'package:flutter/material.dart';
import 'package:newsapp/api_manger.dart';

class NewsUi extends StatelessWidget {
  const NewsUi({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getSources(),
         builder: (context, snapshot) 
         {
           if (snapshot.connectionState == ConnectionState.waiting) 
           {
             return const Center(child: CircularProgressIndicator());
           } 
           else if (snapshot.hasError)
            {
             return const Center(child: Text('snapshot.error.toString()'));
           }
           var sources=snapshot.data?.sources??[];
          
          return DefaultTabController(
            
            length: sources.length,
            child: TabBar(
              isScrollable: true,
              indicatorColor: Colors.transparent,
              dividerColor: Colors.transparent,
              tabs: sources
                  .map((e) => Text(e.name??'')).toList(),),
             
            
          );
         }
          
    ); 
  }
}