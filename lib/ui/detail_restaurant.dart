
import 'package:flutter/material.dart';
import 'package:restaurant/data/api/api_service.dart';
import 'package:restaurant/data/model/restaurant_details.dart';
import 'package:restaurant/data/model/restaurants_result.dart';
import 'package:restaurant/ui/detail_review.dart';
import 'package:restaurant/ui/details_drinks.dart';
import 'package:restaurant/ui/details_foods.dart';

class DetailRestaurant extends StatefulWidget {
  static const routeName = '/detail_restaurant';

  final Restaurant restaurant;
  const DetailRestaurant({@required this.restaurant});

  @override
  _DetailRestaurant createState() => new _DetailRestaurant(restaurant);
}

class _DetailRestaurant extends State<DetailRestaurant>{

  Restaurant restaurant;
  _DetailRestaurant(this.restaurant);
  Future<RestaurantDetails> restaurantDetailResult;

  @override
  void initState() {
    restaurantDetailResult = ApiService().restoDetails(restaurant.id);
    super.initState();
  }

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
        body: _buildList(context)
    );
  }

  Widget _buildList(BuildContext context) {
    return FutureBuilder(
      future: restaurantDetailResult,
      builder: (context, AsyncSnapshot<RestaurantDetails> snapshot) {
        var state = snapshot.connectionState;
        if (state != ConnectionState.done) {
          return Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.hasData) {
            var rest = snapshot.data.restaurantDetail;
            //return Text(rest.name);
            return _buildDetailItem(context, rest);
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return Text('Error');
          }
        }
      },
    );
  }

    Widget _buildDetailItem(BuildContext context, RestaurantDetail resto){
    Menus menus = resto.menus;
    List<CustomerReview> review =resto.customerReviews.reversed.toList();
    int reviewCount;
    if (review.length >= 4) {
      reviewCount = 4;
    } else {
      reviewCount = review.length;
    }
      return ListView(
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
                    "https://restaurant-api.dicoding.dev/images/medium/"+resto.pictureId,
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
                        resto.name,
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
                            resto.city,
                            style: TextStyle(
                              fontSize: 12.0,
                              //fontWeight: FontWeight.w300,
                            ),
                          ),
                          subtitle: Text(
                            resto.address,
                            style: TextStyle(
                                fontSize: 12.0,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          leading: const Icon(Icons.star, color: Colors.blueGrey,),
                          title: Text(
                            resto.rating.toString(),
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
                        resto.description,
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
                      Navigator.pushNamed(context, DetailFoods.routeName, arguments: menus)
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
                      Navigator.pushNamed(context, DetailDrinks.routeName, arguments: menus)
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
                        "Customer Review:",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w800,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      //reverse: true,
                      itemCount: reviewCount,
                      itemBuilder: (context, index){
                        var reviewer = review[index];
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          child: ListTile(
                            leading: Icon(
                              Icons.comment_outlined,
                              size: 24,
                              color: Colors.blueGrey,
                            ),
                            title: Text(reviewer.name),
                            subtitle: Text(reviewer.review+'\n'+reviewer.date+'\n'),
                          ),
                        );
                      }
                  ),
                  InkWell(
                    onTap: () => {
                      Navigator.pushNamed(context, DetailReviewer.routeName, arguments: resto)
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 15.0, bottom: 10.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "See All",
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w800,
                          ),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ]
      );
    }
}
