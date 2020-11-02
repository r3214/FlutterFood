import 'dart:async' show Future;
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import 'package:restaurant/Model/restaurant.dart';

Future<String> _loadAsset() async {
  return await rootBundle.loadString('assets/local_restaurant.json');
}

Future loadAssets() async {
  String jsonRestaurant = await _loadAsset();
  final jsonResponse = jsonDecode(jsonRestaurant);
  return jsonResponse;
}