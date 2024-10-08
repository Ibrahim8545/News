import 'package:flutter/material.dart';
import 'package:newsapp/models/category_model.dart';
import 'package:newsapp/widget/category_items.dart';

class CategorysTab extends StatelessWidget {
  static const String routeName = '/categorys_tab';
   CategorysTab({required this.onclick  ,super.key});
    Function onclick;
var  categoryModel=CategoryModel.getCategoryModel();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
         const Text('Pick your category of interest',style: TextStyle(fontSize: 30),),
          Expanded(
            child: GridView.builder(
              gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12
              ) , 
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap:()
                  {
                     onclick(categoryModel[index]);
                  },
                  child: CategoryItems(
                    categoryModel: categoryModel[index],
                    isOdd: index.isOdd,
                    ),
                );
              },
              itemCount: categoryModel.length,
              ),
          )
        ],
      ),
    );
  }
}