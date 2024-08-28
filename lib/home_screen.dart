import 'package:flutter/material.dart';
import 'package:newsapp/utils/app_colors.dart';
import 'package:newsapp/widget/news_ui.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          
          image: AssetImage('assets/images/pattern.png'), 
          fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
         drawer:Drawer(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: const Text(
            'News',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold
              ),

            ),
          centerTitle: true,
          backgroundColor: AppColors.green,
          shape:const  RoundedRectangleBorder(
            borderRadius:BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            )
             ),
             actions: [
              IconButton(onPressed: (){}, icon: Icon(Icons.search)),
             ],
            
        ),
        body: NewsUi()
      ),
    );
  }
}