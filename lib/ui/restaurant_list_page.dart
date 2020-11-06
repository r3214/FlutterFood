
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:restaurant/data/api/api_service.dart';
import 'package:restaurant/data/model/restaurants_result.dart';
import 'package:restaurant/ui/detail_restaurant.dart';

class RestaurantListPage extends StatefulWidget {

  @override
  _RestaurantListPage createState() => _RestaurantListPage();
}

class _RestaurantListPage extends State<RestaurantListPage> {

  Future<RestaurantsResult> restaurantResult;

  @override
  void initState() {
    restaurantResult = ApiService().list();
    super.initState();
  }

  Widget _buildList(BuildContext context) {
    return FutureBuilder(
      future: restaurantResult,
      builder: (context, AsyncSnapshot<RestaurantsResult> snapshot) {
        var state = snapshot.connectionState;
        if (state != ConnectionState.done){
          return Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.restaurants.length,
              itemBuilder: (context, index) {
                var rest = snapshot.data.restaurants[index];
                //return new Text(rest.name);
                return _buildRestaurantItem(context, rest);
              },
            );
          } else if(snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else{
            return Text ('Error');
          }
        }
      },
    );
  }


  Widget _buildRestaurantItem(BuildContext context, Restaurant restaurant) {
    return Padding(
      padding: EdgeInsets.only(top: 4.0, bottom: 4.0),
      child: InkWell(
          onTap: () => {
            Navigator.pushNamed(context, DetailRestaurant.routeName, arguments: restaurant)
          },
          child: Container(
            height: MediaQuery.of(context).size.height / 2.5,
            width: MediaQuery.of(context).size.width,
            child: Card(
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              elevation: 3.0,
              child: Column(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height / 3.5,
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      child: Image.network(
                        'https://restaurant-api.dicoding.dev/images/medium/'+restaurant.pictureId,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 7.0),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
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
                  Expanded(
                    child: Row(
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
                            leading: const Icon(Icons.star, color: Colors.blueGrey),
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
                  ),
                  SizedBox(height: 10.0),
                ],
              ),
            ),
          )
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant App'),
      ),
      body: _buildList(context),
    );
  }
}