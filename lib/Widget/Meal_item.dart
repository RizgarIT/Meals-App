


import 'package:flutter/material.dart';
import 'package:meals_app/Models/meal.dart';
import 'package:meals_app/Screen/Meal_Detail_Screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  
  MealItem(
      {required this.id,
        required this.duration,
      required this.imageUrl,
      required this.title,
      required this.complexity,
      required this.affordability,
      
      });
      
  void selectitem(BuildContext ctx) {
   Navigator.of(ctx).pushNamed(MealDetailScreen.routeName,arguments: id).then((value) {

    if(value!=null)
    {
//removeitem(value);
    }
   });
  }

String? get Complexitytext
{
  switch(complexity)
  {
    case Complexity.Simple:
  return 'Simple';
  break;
  case Complexity.Challenging:
   return 'Challenging';
   break;

   case Complexity.Hard:
   return 'Hard';
   break;
   default:
   return 'Unknown';
   
  }
  
  
  
}
String? get affordabilityText
{
switch(affordability)
  {
    case Affordability.Affordable:
  return 'Affordable';
  break;
  case Affordability.Luxurious:
   return 'Luxurious';
   break;

   case Affordability.Pricey:
   return 'Pricey';
   break;
   default:
   return 'Unknown';
   
  }
  

  
}
 
 
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>selectitem(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                    width: 300,
                    color: Colors.black45,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
             
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Row(
                    children: [
                      Row(
                        children: [
                           SizedBox(width:6),
                          TextButton.icon(
                            onPressed: () {},
                            icon: Icon(
                              // <-- Icon
                              Icons.timer,
                              size: 26.0,
                            ),
                            label: Text(
                              '${duration}min',
                              style: TextStyle(
                                  color: Colors.black, fontWeight: FontWeight.bold),
                            ), // <-- Text
                          ),
                        ],
                      ),
                      Row(
                        children: [
                           SizedBox(width:30),
                          TextButton.icon(
                            onPressed: () {},
                            icon: Icon(
                              // <-- Icon
                              Icons.work,
                              size: 26.0,
                            ),
                            label: Text(
                              '${Complexitytext}',
                              style: TextStyle(
                                  color: Colors.black, fontWeight: FontWeight.bold),
                            ), // <-- Text
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width:30),
                          TextButton.icon(
                            onPressed: () {},
                            icon: Icon(
                              // <-- Icon
                              Icons.attach_money,
                              size: 26.0,
                            ),
                            label: Text(
                              '${affordabilityText}',
                              style: TextStyle(
                                  color: Colors.black, fontWeight: FontWeight.bold),
                            ), // <-- Text
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            
          ],
        ),
      ),
    );
  }
}
