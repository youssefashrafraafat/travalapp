import 'package:flutter/material.dart';
import 'package:travelapp/screens/favorites_screen.dart';
import 'package:travelapp/screens/home_view.dart';

class TapScreen extends StatelessWidget {
  const TapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 2,
      child:  Scaffold(
    appBar: AppBar(
      title:const Text('دليل سياحى'),
      bottom:const TabBar(tabs: [
        Tab(
          text: 'التصنيفات',
          icon: Icon(Icons.dashboard,
        
        ),),
           Tab(
          text: 'المفضله',
          icon: Icon(Icons.star,
        
        ),),
      ]),
    ),
    body:const TabBarView(children: [
HomeView(),

    ]),
      ),
    );
  }
}