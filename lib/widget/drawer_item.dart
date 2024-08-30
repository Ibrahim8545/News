import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
   DrawerItem({required this.onClick ,super.key});
 Function onClick;
 static const int categories_id=1;
 static const int setting_id=2;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.7,
      color: Colors.white,
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            color: Colors.green,
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              'News App',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
              
            ),
           
          ),
           GestureDetector(
            onTap: () {
              onClick(categories_id);
            },
            child: Text('Category',style: TextStyle(fontSize: 30),)
            ),
             SizedBox(height: 20,),
             
             GestureDetector(
              onTap: () {
                onClick(setting_id);
              },
            child: Text('Settings',style: TextStyle(fontSize: 30),)),
      
        ],
      ),
    );
  }
}