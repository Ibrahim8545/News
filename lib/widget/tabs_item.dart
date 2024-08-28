import 'package:flutter/material.dart';
import 'package:newsapp/models/sources_response_model.dart';

class TabsItem extends StatelessWidget {
   TabsItem({ required this.sources ,required this.isSelected ,super.key});
Sources sources;
bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14,vertical: 4),
      decoration: BoxDecoration(
        color: isSelected ? Colors.green : Colors.transparent,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.green),
      ),
      child: Text(sources.name??'',
        style: TextStyle(
          fontSize: 18,
        color: isSelected ? Colors.white : Colors.green),
      )


    );
  }
}