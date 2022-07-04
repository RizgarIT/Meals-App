import 'package:flutter/material.dart';
import 'package:meals_app/Models/meal.dart';

import 'package:meals_app/Screen/Category_Meals_Screen.dart';
import 'package:meals_app/Screen/Filter_Screen.dart';
import 'package:meals_app/Screen/Meal_Detail_Screen.dart';
import 'package:meals_app/Screen/Tabs_screen.dart';
import 'package:meals_app/dummy_data.dart';

void main(List<String> args) {
  runApp(myapp());
}

class myapp extends StatefulWidget {
  @override
  State<myapp> createState() => _myappState();
}

class _myappState extends State<myapp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'Vegetarian': false,
  };
  Map<String, bool> favorate = {
    'favorate': false,
  };

  List<Meal> favorat = [];
  List<Meal> _AvailabelMeal = DUMMY_MEALS;

  void _togglefavorate(String mealId) {
    final existingIndex = favorat.indexWhere((meal) => meal.id == mealId);
    if(existingIndex>=0)
    {
      setState(() {
        favorat.removeAt(existingIndex);
      });
      
    } 
    else
    {
      setState(() {
        favorat.add(DUMMY_MEALS.firstWhere((meal) => mealId==meal.id));
      });
    }
  }
bool _isMealsFavorites(String id)
{
return  favorat.any((element) => element.id==id);
}
  void _setfilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _AvailabelMeal = DUMMY_MEALS.where((element) {
        if (_filters['gluten'] == true && !element.isGlutenFree) {
          return false;
        }
        if (_filters['vegan'] == true && !element.isVegan) {
          return false;
        }
        if (_filters['lactose'] == true && !element.isLactoseFree) {
          return false;
        }
        if (_filters['Vegetarian'] == true && !element.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.amber, //AppBar color
            accentColor: Colors.amberAccent, //button another widget
            canvasColor: Colors.grey[900], //body
            fontFamily: 'Ralewa',
            textTheme: ThemeData.light().textTheme.copyWith(
                  bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                  bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                  subtitle1: TextStyle(
                    color: Colors.white,
                    fontFamily: 'RobotoCondense',
                    fontSize: 20,
                  ),
                )),
        title: "DeliMeals",
        initialRoute: '/',
        routes: {
          '/': (ctx) => TabsScreen(favorat),
          CategoryScreen.routeName: (ctx) => CategoryScreen(_AvailabelMeal),
          MealDetailScreen.routeName: (ctx) => MealDetailScreen(_togglefavorate,_isMealsFavorites),
          FilterScreen.routeName: (ctx) => FilterScreen(_filters, _setfilters),
        });
  }
}
