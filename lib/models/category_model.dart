import 'package:flutter/material.dart';

class CategoryModel
{
  String id;
  String name;
  String image;
  Color color;
  CategoryModel({required this.id,required this.color ,required this.name,required this.image});

 static List<CategoryModel> getCategoryModel()
  {
     return [


       CategoryModel(id: 'sports', name: 'Sports', image:'assets/images/sports.png', color: Colors.red),

       CategoryModel(id: 'entertainment', name: 'Entertainment', image: 'assets/images/entertainment.jpg', color: Color(0xff4882CF)),

       CategoryModel(id: 'health', name: 'Health', image: 'assets/images/health.png', color: Color(0xffED1E79)),

       CategoryModel(id: 'general', name: 'General', image: 'assets/images/environment.png', color: Colors.green),

       CategoryModel(id: 'science', name: 'Science', image: 'assets/images/science.png', color: Colors.amber),
        CategoryModel(id: 'technology', name: 'Technology', image: 'assets/images/tech.png', color: Colors.blue),
        
       CategoryModel(id: 'business', name:'Business' , image: 'assets/images/bussines.png', color: Color(0xffCF7E48)),
       
     ];

  }
}