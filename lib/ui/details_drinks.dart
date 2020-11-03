import 'package:flutter/material.dart';
import 'package:restaurant/Model/menus.dart';

class DetailDrinks extends StatelessWidget {

  static const routeName = '/detail_drinks';

  final Menus menus;
  //final List<Drink> drink;

  const DetailDrinks({@required this.menus});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
              ),
              onPressed: () => Navigator.pop(context),
            )
        ),
        body: ListView.builder(
          itemCount: menus.drinks.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildFoodItem(context, menus.drinks[index]);
          },
        ),
    );
  }

  Widget _buildFoodItem(BuildContext context, Drink drink){
    return Padding(
      padding: EdgeInsets.only(top: 4.0, bottom: 4.0),
      child: Card(
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        elevation: 3.0,
        child: ListTile(
          leading: Icon(
            Icons.local_drink,
            size: 24,
            color: Colors.blueGrey,
          ),
          title: Text(
            drink.name,
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 12),
          ),
        ),
      ),
    );
  }
}