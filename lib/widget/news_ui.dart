import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:newsapp/bloc/cubit.dart';
import 'package:newsapp/bloc/states.dart';
import 'package:newsapp/widget/news_item.dart';
import 'package:newsapp/widget/tabs_item.dart';

class NewsUi extends StatelessWidget {
  String id;
  NewsUi({required this.id, super.key});



  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: BlocProvider(

        create: (context) => HomeCubit()..getSources(id),
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
          if (state is HomeGetSourcesLoading ||
                state is HomeGetNewsDataLoading) {
              context.loaderOverlay.show();
            } else {
              context.loaderOverlay.hide();
            }

            if (state is HomeGetNewsDataError) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Error"),
                  content: Text("Something went wrong"),
                ),
              );
            }

            if (state is HomeGetSourcesError) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Something went wrong")));
            }

            if (state is HomeChangeSource) {
              HomeCubit.get(context).getNewsData(HomeCubit.get(context)
                      .model
                      ?.sources?[HomeCubit.get(context).Selected]
                      .id ??
                  "");
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
                       HomeCubit.get(context).changeSource(value);
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
                            isSelected:  HomeCubit.get(context).model?.
                            sources?.
                            elementAt(HomeCubit.get(context).Selected)==e,
                          ),
                        )
                        .toList()??[],
                  ),
                ),
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        height: 8,
                      ),
                      itemBuilder: (context, index) {
                        return NewsItem(
                            articles: HomeCubit.get(context)
                                .newsdata!
                                .articles![index]);
                      },
                      itemCount: HomeCubit.get(context)
                              .newsdata
                              ?.articles
                              ?.length ??
                          0,
                    ),
                  )

                // Expanded(
                //         child: ListView.separated(

                //             separatorBuilder: (context, index) =>const  SizedBox(height: 8,),
                //             itemCount: HomeCubit.get(context).newsdata!.articles?.length??0,
                //             itemBuilder: (context, index) {
                //               return (NewsItem(articles: HomeCubit.get(context).newsdata!.articles![index]));
                //             }),
                //       )


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

                      // return Expanded(
                      //   child: ListView.separated(

                      //       separatorBuilder: (context, index) =>const  SizedBox(height: 8,),
                      //       itemCount: articles.length,
                      //       itemBuilder: (context, index) {
                      //         return (NewsItem(articles: articles[index]));
                      //       }),
                      // );
    //                 }),
    //           ],
    //         ),
    //       );
    //     });
  }
}
