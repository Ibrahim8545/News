import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:newsapp/api_manger.dart';
import 'package:newsapp/bloc/cubit.dart';
import 'package:newsapp/bloc/states.dart';
import 'package:newsapp/models/sources_response_model.dart';
import 'package:newsapp/widget/news_item.dart';
import 'package:newsapp/widget/tabs_item.dart';

class NewsUi extends StatelessWidget {
  String id;
  NewsUi({required this.id, super.key});

  List<Sources> sources = [];

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: BlocProvider(

        create: (context) => HomeCubit()..getSources(id),
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if(state is HomeGetNewsDataLoading ||state is HomeGetSourcesLoading)
            {
             context.loaderOverlay.show();

            }
            else{
              context.loaderOverlay.hide();
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                DefaultTabController(
                  length: HomeCubit.get(context).model?.sources?.length ?? 0,
                  child: TabBar(
                    onTap: (value) {
               
                    },
                    isScrollable: true,
                    indicatorColor: Colors.transparent,
                    dividerColor: Colors.transparent,
                    tabs: HomeCubit.get(context).
                    model?.
                    sources
                        ?.map(
                          (e) => TabsItem(
                            sources: e,
                            isSelected:  HomeCubit.get(context).model!.sources!.elementAt(0)==e,
                          ),
                        )
                        .toList()??[],
                  ),
                )
              ]),
            );
          },
        ),
      ),
    );
    // FutureBuilder(
    //     future: ApiManager.getSources(widget.id),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return const Center(child: CircularProgressIndicator());
    //       } else if (snapshot.hasError) {
    //         return const Center(child: Text('snapshot.error.toString()'));
    //       }
    //       sources = snapshot.data?.sources ?? [];

    // return Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: Column(
    //     children: [
    //       DefaultTabController(
    //         length: sources.length,
    //         child: TabBar(
    //           onTap: (value) {
    //             Selected = value;
    //             setState(() {});
    //           },
    //           isScrollable: true,
    //           indicatorColor: Colors.transparent,
    //           dividerColor: Colors.transparent,
    //           tabs: sources
    //               .map(
    //                 (e) => TabsItem(
    //                   sources: e,
    //                   isSelected: sources.elementAt(Selected) == e,
    //                 ),
    //               )
    //               .toList(),
    //         ),
    //       ),
    //             FutureBuilder(
    //                 future: ApiManager.getNewsData(
    //                     sources[Selected].id ?? ''),
    //                 builder: (context, snapshot) {
    //                   if (snapshot.connectionState ==
    //                       ConnectionState.waiting) {
    //                     return const Center(
    //                         child: CircularProgressIndicator());
    //                   } else if (snapshot.hasError) {
    //                     return const Center(
    //                         child: Text('snapshot.error.toString()'));
    //                   }
    //                   var articles = snapshot.data?.articles ?? [];

    //                   return Expanded(
    //                     child: ListView.separated(

    //                         separatorBuilder: (context, index) =>const  SizedBox(height: 8,),
    //                         itemCount: articles.length,
    //                         itemBuilder: (context, index) {
    //                           return (NewsItem(articles: articles[index]));
    //                         }),
    //                   );
    //                 }),
    //           ],
    //         ),
    //       );
    //     });
  }
}
