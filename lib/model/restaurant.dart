import 'dart:convert';

import 'package:restaurant/Model/menus.dart';

class Restaurant {
  String id;
  String name;
  String description;
  String pictureId;
  String city;
  num rating;
  Menus menus;

  Restaurant({
    this.id,
    this.name,
    this.description,
    this.pictureId,
    this.city,
    this.rating,
    this.menus,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    pictureId: json["pictureId"],
    city: json["city"],
    rating: json["rating"].toDouble(),
    menus: Menus.fromJson(json["menus"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "pictureId": pictureId,
    "city": city,
    "rating": rating,
    "menus": menus.toJson(),
  };
}

List<Restaurant> parseRestaurant(String jsonData) {
  if (jsonData == null) {
    return [];
  }

  var restaurantObj = jsonDecode(jsonData)['restaurants'] as List;
  List <Restaurant> restaurant = restaurantObj.map((i) =>
      Restaurant.fromJson(i)).toList();
  return restaurant;
}

class Foods{
  String foodName;

  Foods({
    this.foodName

  });

  factory Foods.fromJson(Map<String, dynamic> parsedJson){
    return Foods(
      foodName : parsedJson['name'],
    );
  }
}

class Drinks {
  String drinkName;

  Drinks({
    this.drinkName

  });

  factory Drinks.fromJson(Map<String, dynamic> parsedJson){
    return Drinks(
      drinkName: parsedJson['name'],
    );
  }
}