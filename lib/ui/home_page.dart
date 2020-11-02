import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/ui/restaurant_list_page.dart';
import 'package:restaurant/widget/platform_widget.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  int _bottomNavIndex = 0;

  List<Widget> _listWidget = [
    RestaurantListPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RestaurantListPage(),
//      bottomNavigationBar: BottomNavigationBar(
//        currentIndex: _bottomNavIndex,
//        items: _bottomNavBarItems,
//        onTap: _onBottomNavTapped,
//      ),
    );
  }

/*  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      body: _listWidget[_bottomNavIndex],
//      bottomNavigationBar: BottomNavigationBar(
//        currentIndex: _bottomNavIndex,
//        items: _bottomNavBarItems,
//        onTap: _onBottomNavTapped,
//      ),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoTabScaffold(
//      tabBar: CupertinoTabBar(items: _bottomNavBarItems),
      tabBuilder: (context, index) {
        return _listWidget[index];
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }*/
}

