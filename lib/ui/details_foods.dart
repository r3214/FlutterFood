
import 'package:flutter/material.dart';
import 'package:restaurant/data/model/restaurant_details.dart';

class DetailFoods extends StatelessWidget {

  static const routeName = '/detail_foods';

  final Menus menus;
  //final List<Food> food;

  const DetailFoods({@required this.menus});

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
          itemCount: menus.foods.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildFoodItem(context, menus.foods[index]);
          },
        ),
    );
  }

  Widget _buildFoodItem(BuildContext context, Menu food){
    return Padding(
      padding: EdgeInsets.only(top: 4.0, bottom: 4.0),
      child: Card(
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        elevation: 3.0,
        child: ListTile(
          leading: Icon(
            Icons.food_bank,
            size: 24,
            color: Colors.blueGrey,
          ),
          title: Text(
            food.name,
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 12),
          ),
        ),
      ),
    );
  }
}
