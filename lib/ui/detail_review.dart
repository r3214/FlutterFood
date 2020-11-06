
import 'package:flutter/material.dart';
import 'package:restaurant/data/model/restaurant_details.dart';

class DetailReviewer extends StatelessWidget {

  static const routeName = '/detail_reviewer';

  //final Menus menus;
  //final List<Drink> drink;

  final RestaurantDetail restaurantDetail;

  const DetailReviewer({@required this.restaurantDetail});

  @override
  Widget build(BuildContext context) {
    List<CustomerReview> review =restaurantDetail.customerReviews.reversed.toList();
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () => Navigator.pop(context),
          )
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: review.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildFoodItem(context, review[index]);
        },
      ),
    );
  }

  Widget _buildFoodItem(BuildContext context, CustomerReview review){
    return Padding(
      padding: EdgeInsets.only(top: 4.0, bottom: 4.0),
      child: Card(
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        elevation: 3.0,
        child: ListTile(
          leading: Icon(
            Icons.comment_outlined,
            size: 24,
            color: Colors.blueGrey,
          ),
          title: Text(
            review.name,
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 12),
          ),
          subtitle: Text(review.review+'\n'+review.date+'\n',
              style: TextStyle(fontSize: 12),
          ),
        ),
      ),
    );
  }
}
