import 'package:flutter/material.dart';
import 'package:meals_app/Widget/category_item.dart';
import 'package:meals_app/dummy_data.dart';

class CatigoriesScreen extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return  GridView(
        padding: EdgeInsets.all(15),
          children: DUMMY_CATEGORY.map((catData) 
          {
            return CategoryItem(catData.id,catData.title, catData.color);
          }
          
          ).toList() ,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2)
              
    );
  }
}
