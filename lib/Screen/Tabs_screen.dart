import 'package:flutter/material.dart';
import 'package:meals_app/Models/meal.dart';
import 'package:meals_app/Screen/Categories_Screen.dart';
import 'package:meals_app/Screen/Category_Meals_Screen.dart';
import 'package:meals_app/Screen/Favorites_screen.dart';
import 'package:meals_app/Widget/Main_Drawer.dart';
import 'package:meals_app/main.dart';

class TabsScreen extends StatefulWidget {

  List<Meal> favorat;
 TabsScreen(this.favorat);
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
 var pages;
   

  var title=[
    'categories'
    ,
    'Your Favorites',
  ];
  int _selectedPageIndex = 0;
 
@override
  void initState() {
   pages =[
    CatigoriesScreen(),
    FavoritesScreen(widget.favorat)
  ];
    super.initState();
  }
  void _selectedpage(int index ) {
    setState(() {
      _selectedPageIndex = index;
     
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( title[_selectedPageIndex]),
      ),
      body: pages[_selectedPageIndex],

      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.black,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        onTap: _selectedpage,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.favorite),
            title: Text('Favorites'),
          )
        ],
      ),
    );
  }
}
