import 'package:flutter/material.dart';
import 'package:meals_app/Models/meal.dart';
import 'package:meals_app/Widget/Meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  List<Meal> favoratemeals;
  FavoritesScreen(this.favoratemeals);

  @override
  Widget build(BuildContext context) {
    if (favoratemeals.isEmpty) {
 return Center(
      child: Text('You have no favorites yet ',style: TextStyle(color: Colors.white,fontSize: 20),),
    );

    }
    else
    {
      return ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: favoratemeals[index].id,
              duration: favoratemeals[index].duration,
              imageUrl: favoratemeals[index].imageUrl,
              title: favoratemeals[index].title,
              complexity: favoratemeals[index].complexity,
              affordability: favoratemeals[index].affordability,
          
            );
          },
          itemCount: favoratemeals.length,
        );
    }
   
  }
  
}
