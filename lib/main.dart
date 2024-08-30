import 'package:flutter/material.dart';
import 'package:newsapp/home_screen.dart';
import 'package:newsapp/splash_screen.dart';
import 'package:newsapp/widget/categories_tab.dart';

void main() {
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
        // CategorysTab.routeName : (context) =>  CategorysTab(),
      }

    );
}
}