import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restaurant/data/model/restaurant_details.dart';
import 'package:restaurant/data/model/restaurants_result.dart';

class ApiService {
  static final String _baseUrl = 'https://restaurant-api.dicoding.dev/';
  static final String _apiKey = '12345';

  Future<RestaurantsResult> list() async {
    final response = await http.get(_baseUrl +
        "list");
    if (response.statusCode == 200) {
      return RestaurantsResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load restaurant list');
    }
  }

  Future<RestaurantDetails> restoDetails(String id) async {
    final response = await http.get(_baseUrl +
        "detail/"+id);
    if (response.statusCode == 200) {
      return RestaurantDetails.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load restaurant list');
    }
  }
}