
class RestaurantDetails {
  RestaurantDetails({
    this.error,
    this.message,
    this.restaurantDetail,
  });

  bool error;
  String message;
  RestaurantDetail restaurantDetail;

  factory RestaurantDetails.fromJson(Map<String, dynamic> json) => RestaurantDetails(
    error: json["error"],
    message: json["message"],
    restaurantDetail: RestaurantDetail.fromJson(json["restaurant"]),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "restaurant": restaurantDetail.toJson(),
  };
}

class RestaurantDetail {
  RestaurantDetail({
    this.id,
    this.name,
    this.description,
    this.city,
    this.address,
    this.pictureId,
    this.menus,
    this.rating,
    this.customerReviews,
  });

  String id;
  String name;
  String description;
  String city;
  String address;
  String pictureId;
  Menus menus;
  double rating;
  List<CustomerReview> customerReviews;

  factory RestaurantDetail.fromJson(Map<String, dynamic> json) => RestaurantDetail(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    city: json["city"],
    address: json["address"],
    pictureId: json["pictureId"],
    menus: Menus.fromJson(json["menus"]),
    rating: json["rating"].toDouble(),
    customerReviews: List<CustomerReview>.from(json["customerReviews"].map((x) => CustomerReview.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "city": city,
    "address": address,
    "pictureId": pictureId,
    "menus": menus.toJson(),
    "rating": rating,
    "customerReviews": List<dynamic>.from(customerReviews.map((x) => x.toJson())),
  };
}

class Menu {
  Menu({
    this.name,
  });

  String name;

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}

class CustomerReview {
  CustomerReview({
    this.name,
    this.review,
    this.date,
  });

  String name;
  String review;
  String date;

  factory CustomerReview.fromJson(Map<String, dynamic> json) => CustomerReview(
    name: json["name"],
    review: json["review"],
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "review": review,
    "date": date,
  };
}

class Menus {
  Menus({
    this.foods,
    this.drinks,
  });

  List<Menu> foods;
  List<Menu> drinks;

  factory Menus.fromJson(Map<String, dynamic> json) => Menus(
    foods: List<Menu>.from(json["foods"].map((x) => Menu.fromJson(x))),
    drinks: List<Menu>.from(json["drinks"].map((x) => Menu.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "foods": List<dynamic>.from(foods.map((x) => x.toJson())),
    "drinks": List<dynamic>.from(drinks.map((x) => x.toJson())),
  };
}

