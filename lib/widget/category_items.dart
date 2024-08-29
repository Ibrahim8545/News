import 'package:flutter/material.dart';
import 'package:newsapp/models/category_model.dart';

class CategoryItems extends StatelessWidget {
   CategoryItems({ required this.categoryModel,required this.isOdd ,super.key});
 CategoryModel categoryModel ;
 bool isOdd;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: categoryModel.color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular( 25),
          topRight: Radius.circular( 25),
          bottomLeft: Radius.circular(!isOdd ? 25 : 0),
          bottomRight: Radius.circular(isOdd ? 25 : 0),
        )
      ),
      child: Column(
        children: [
          Expanded(child: Image.asset(categoryModel.image)),
          Text(categoryModel.name,style: TextStyle(
            color: Colors.white,
            fontSize: 22
            )
            ,),
         
          
        ],
      ),
    );
  }
}