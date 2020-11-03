
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:restaurant/Model/restaurant.dart';
import 'package:restaurant/ui/detail_restaurant.dart';

class RestaurantListPage extends StatelessWidget {
  Widget _buildList(BuildContext context) {
    return new FutureBuilder<String>(
      future: DefaultAssetBundle.of(context).loadString('assets/local_restaurant.json'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Restaurant> restaurant = parseRestaurant(snapshot.data);
          return ListView.builder(
            itemCount: restaurant.length,
            itemBuilder: (context, index) {
              return _buildRestaurantItem(context, restaurant[index]);
            },
          );
        } else  {
          return new Text ('');
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
                        restaurant.pictureId,
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