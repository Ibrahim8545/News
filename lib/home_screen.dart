import 'package:flutter/material.dart';
import 'package:newsapp/models/category_model.dart';
import 'package:newsapp/utils/app_colors.dart';
import 'package:newsapp/widget/categories_tab.dart';
import 'package:newsapp/widget/drawer_item.dart';
import 'package:newsapp/widget/news_ui.dart';
import 'package:newsapp/widget/search_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home_screen';
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryModel? categoryModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('assets/images/pattern.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: DrawerItem(onClick:onDrawerClicked ),
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
          actions: [
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: SearchTab());

              },
              icon: Icon(Icons.search,size: 30,),
            ),
          ],
        ),
        body: categoryModel == null
            ? CategorysTab(onclick: onCategorySelected)
            : NewsUi(id: categoryModel!.id),
      ),
    );
  }
  onDrawerClicked(id) {
    if(id==DrawerItem.categories_id)
    {
      categoryModel=null;
      Navigator.pop(context);
    }
    else if(id==DrawerItem.setting_id)
    {


    }
    setState(() {
      
    });
    
  }
 onCategorySelected(cat) {
    categoryModel = cat;
    setState(() {
      
    });
  }
}
