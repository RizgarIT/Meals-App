import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
//   final String title;
final Function _togglefavorate;
final Function _isMealsFavorites;
 MealDetailScreen( this._togglefavorate,this._isMealsFavorites);



Widget BuildTextWidget(BuildContext context,String text)
{
  return Container(
              margin: EdgeInsets.symmetric(vertical: 7),
              child: Text(
                text,
                style: Theme.of(context).textTheme.subtitle1,
                
              ),
            );
}

Widget BuildContainer(Widget child)
{
  return Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.pink.shade900,
                  ),
                  borderRadius: BorderRadius.circular(5)
                  ),
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
              width:  double.infinity,
              height: 220,
              child: child,
  );
}
  @override
  Widget build(BuildContext context) {


    final mealid = ModalRoute.of(context)!.settings.arguments as String;

    final selectMeal = DUMMY_MEALS.firstWhere((meals) => mealid == meals.id);
    return Scaffold(
        appBar: AppBar(
          title: Text('${selectMeal.title}'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 300,
                child: Image.network(selectMeal.imageUrl),
              ),
             BuildTextWidget(context, "ingredients") ,
              BuildContainer(
                 ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Card(
                      color: Colors.amber,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(selectMeal.ingredients[index],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                      ),
                    );
                  },
                  itemCount: selectMeal.ingredients.length,
                ),
              ),
              BuildTextWidget(context, "Steps"),
              BuildContainer(ListView.builder(itemBuilder: (ctx,index)
              {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.cyan[200],
                        child: Text('# ${(index +1)}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.black),),),
                      
                      title:Text(selectMeal.steps[index],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.black)),
                    ),
                    Divider(
                      color: Colors.pink[900]
                      ,
                      height: 15,
                    )
                  ],

                );
              },
              itemCount: selectMeal.steps.length,
              )
                
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(_isMealsFavorites(mealid)?Icons.favorite:Icons.favorite_border
          ,),
          onPressed:(){ _togglefavorate(mealid);}
        ),
      
        );
  }
}
