

import 'package:flutter/material.dart';
import 'package:meals_app/Models/meal.dart';
import 'package:meals_app/Widget/Meal_item.dart';

import 'package:meals_app/dummy_data.dart';

class CategoryScreen extends StatefulWidget {
  static const routeName = '/category';
  List<Meal> _availableMeal;
 CategoryScreen(this._availableMeal);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
  
}

class _CategoryScreenState extends State<CategoryScreen> {
 
     var categorytitle;
    var categoryMeals;
  @override
  void didChangeDependencies() {
  
         final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryid = args['id'];
     categorytitle = args['title'];
      categoryMeals = widget._availableMeal.where((meal) {
      return meal.categories.contains(categoryid);
    }).toList();
    super.didChangeDependencies();
  }
  void _removeitem(String mealID)
 {
  setState(() {
    
    categoryMeals.removeWhere((element) => element.id==mealID);
  });
 }
//  final String categoryid;
  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
        appBar: AppBar(
          title: Text(categorytitle.toString()),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: categoryMeals[index].id,
              duration: categoryMeals[index].duration,
              imageUrl: categoryMeals[index].imageUrl,
              title: categoryMeals[index].title,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability,
            
            );
          },
          itemCount: categoryMeals.length,
        ));
  }
}
