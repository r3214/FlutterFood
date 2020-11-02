import 'dart:convert';

import 'package:flutter/material.dart';

class Menus {
  Menus({
    this.foods,
    this.drinks,
  });

  List<Drink> foods;
  List<Drink> drinks;

  factory Menus.fromJson(Map<String, dynamic> json) =>
      Menus(
        foods: List<Drink>.from(json["foods"].map((x) => Drink.fromJson(x))),
        drinks: List<Drink>.from(json["drinks"].map((x) => Drink.fromJson(x))),
      );

  Map<String, dynamic> toJson() =>
      {
        "foods": List<dynamic>.from(foods.map((x) => x.toJson())),
        "drinks": List<dynamic>.from(drinks.map((x) => x.toJson())),
      };
}

class Drink {
  Drink({
    this.name,
  });

  String name;

  factory Drink.fromJson(Map<String, dynamic> json) => Drink(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}

class Food {
  Food({
    this.name,
  });

  String name;

  factory Food.fromJson(Map<String, dynamic> json) => Food(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}