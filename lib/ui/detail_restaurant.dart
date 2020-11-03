

import 'package:flutter/material.dart';
import 'package:restaurant/Model/menus.dart';
import 'package:restaurant/Model/restaurant.dart';
import 'package:restaurant/ui/details_drinks.dart';
import 'package:restaurant/ui/details_foods.dart';

class DetailRestaurant extends StatelessWidget {
  static const routeName = '/detail_restaurant';

  final Restaurant restaurant;

  const DetailRestaurant({@required this.restaurant});

  @override
  Widget build(BuildContext context) {
    Menus menu = restaurant.menus;

    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                ),
              onPressed: () => Navigator.pop(context),
            )
        ),
      body: ListView(
        padding: EdgeInsets.only(top: 4.0, bottom: 4.0),
          children: <Widget>[
            Card(
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              elevation: 3.0,
              child: Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  child: Image.network(
                    restaurant.pictureId,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 7.0),
            Card(
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              elevation: 3.0,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 15.0, top: 10.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        restaurant.name,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w800,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: ListTile(
                          leading: const Icon(Icons.place, color: Colors.blueGrey),
                          title: Text(
                            restaurant.city,
                            style: TextStyle(
                              fontSize: 12.0,
                              //fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          leading: const Icon(Icons.star, color: Colors.blueGrey,),
                          title: Text(
                            restaurant.rating.toString(),
                            style: TextStyle(
                              fontSize: 12.0,
                              //fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 7.0),
            Card(
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              elevation: 3.0,
              child: Container(
                padding: EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      restaurant.description,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(height: 10)
                  ],
                )
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: InkWell(
                    onTap: () => {
                      Navigator.pushNamed(context, DetailFoods.routeName, arguments: menu)
                    },
                    child: Card(
                      shape:
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                      elevation: 1.0,
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 100,
                            width: 100,
                            child: Icon(
                              Icons.food_bank,
                              size: 60,
                              color: Colors.blueGrey,
                            ),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.blueGrey, width: 3),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              'Menu\nFoods',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w800,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () => {
                      Navigator.pushNamed(context, DetailDrinks.routeName, arguments: menu)
                    },
                    child: Card(
                      shape:
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                      elevation: 1.0,
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 100,
                            width: 100,
                            child: Icon(
                              Icons.emoji_food_beverage,
                              color: Colors.blueGrey,
                              size: 50,
                            ),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.blueGrey, width: 3)
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              'Menu\nDrinks',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w800,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ]
      ),
    );
  }
}