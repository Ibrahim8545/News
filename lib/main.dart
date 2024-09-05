import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/bloc/observer.dart';
import 'package:newsapp/home_screen.dart';
import 'package:newsapp/splash_screen.dart';
import 'package:newsapp/widget/categories_tab.dart';
import 'package:newsapp/widget/news_screen_details.dart';

void main() {
    Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    home:const  SplashScreen(),
      routes:{
      
        HomeScreen.routeName : (context) =>  HomeScreen(),
        NeswsScreenDetails.routeName : (context) =>  NeswsScreenDetails(),
        // CategorysTab.routeName : (context) =>  CategorysTab(),
      }

    );
}
}