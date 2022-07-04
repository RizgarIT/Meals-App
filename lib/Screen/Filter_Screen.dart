import 'package:flutter/material.dart';
import 'package:meals_app/Widget/Main_Drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filter';
  final Function savefilter;
final  Map<String,bool> cureentValue;
  FilterScreen(this.cureentValue,this.savefilter);
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {


  Widget _BuildListSwitch(
      String title, String Description, bool current, var NewUpdate) {
    return SwitchListTile(
      value: current,
      onChanged: NewUpdate,
      title: Text(title),
      subtitle: Text(
        Description,
        style: TextStyle(color: Colors.amber),
      ),
    );
  }

  bool _GlutenFree = false;
  bool _Vegan = false;
  bool _Vegetarian = false;
  bool _LactoseFree = false;

@override
  void initState() {
   _GlutenFree=widget.cureentValue['gluten']!;
   _Vegan=widget.cureentValue['vegan']!;
   _LactoseFree=widget.cureentValue['lactose']!;
   _Vegetarian=widget.cureentValue['Vegetarian']!;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                final selectfilters = {
                  'gluten': _GlutenFree,
                  'lactose': _LactoseFree,
                  'vegan': _Vegan,
                  'Vegetarian': _Vegetarian,
                };

                widget.savefilter(selectfilters);
              },
              icon: Icon(Icons.save))
        ],
        title: Text('Your Filters'),
      ),
      drawer: MainDrawer(),
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            'Adjust Your Meal Selection',
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        Divider(
          color: Colors.cyan.shade200,
        ),
        Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: ListView(
              children: [
                _BuildListSwitch(
                  '_Gluten-Free',
                  'Only include gluten free meals .',
                  _GlutenFree,
                  (NewValue) {
                    setState(() {
                      _GlutenFree = NewValue;
                    });
                  },
                ),
                Divider(
                  color: Colors.cyan.shade200,
                ),
                _BuildListSwitch(
                  '_Vegan-Free',
                  'Only include _Vegan free meals .',
                  _Vegan,
                  (NewValue) {
                    setState(() {
                      _Vegan = NewValue;
                    });
                  },
                ),
                Divider(
                  color: Colors.cyan.shade200,
                ),
                _BuildListSwitch(
                  '_Vegetarian-Free',
                  'Only include Vegetarian free meals .',
                  _Vegetarian,
                  (NewValue) {
                    setState(() {
                      _Vegetarian = NewValue;
                    });
                  },
                ),
                Divider(
                  color: Colors.cyan.shade200,
                ),
                _BuildListSwitch(
                  '_Gluten-Free',
                  'Only include LactoseFree free meals .',
                  _LactoseFree,
                  (NewValue) {
                    setState(() {
                      _LactoseFree = NewValue;
                    });
                  },
                ),
                Divider(
                  color: Colors.cyan.shade200,
                ),
              ],
            ))
      ]),
    );
  }
}
