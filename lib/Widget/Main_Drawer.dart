import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget BuildListTile(String title, IconData icon, var TapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.grey.shade500,
      ),
      title: Text(
        title,
        style: TextStyle(
            color: Colors.cyan.shade400,
            fontSize: 22,
            fontFamily: 'RobotoCondense'),
      ),
      onTap: TapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            child: Text(
              'Cooking Up ',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
            width: double.infinity,
            height: 80,
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.all(20),
            alignment: Alignment.bottomLeft,
          ),
          SizedBox(
            height: 20,
          ),
          BuildListTile(
            'Meals',
            Icons.restaurant,
            () {
              Navigator.of(context).pushNamed('/');
            },
          ),
          Divider(
            color: Colors.cyan.shade200,
          ),
          BuildListTile(
            'Filters',
            Icons.settings,
            () {
              Navigator.of(context).pushNamed('/filter');
            },
          ),
          Divider(
            color: Colors.cyan.shade200,
          )
        ],
      ),
    );
  }
}
