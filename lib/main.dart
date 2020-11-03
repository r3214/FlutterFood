import 'package:flutter/material.dart';
import 'package:restaurant/ui/details_drinks.dart';
import 'package:restaurant/ui/details_foods.dart';
import 'package:restaurant/ui/splashscreen.dart';

import 'ui/home_page.dart';
import 'ui/detail_restaurant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: Splashscreen.routeName,
      routes: {
        Splashscreen.routeName: (context) => Splashscreen(),
        HomePage.routeName: (context) => HomePage(),
        DetailRestaurant.routeName: (context) => DetailRestaurant(restaurant: ModalRoute.of(context).settings.arguments,),
        DetailFoods.routeName: (context) => DetailFoods(menus: ModalRoute.of(context).settings.arguments,),
        DetailDrinks.routeName: (context) => DetailDrinks(menus: ModalRoute.of(context).settings.arguments),
      },
    );
  }
}

