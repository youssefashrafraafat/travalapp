import 'package:flutter/material.dart';
import 'package:travelapp/models/trip.dart';
import 'package:travelapp/screens/favorites_screen.dart';
import 'package:travelapp/screens/home_view.dart';
import 'package:travelapp/widgets/app_drawer.dart';

class TapsScreen extends StatefulWidget {
  const TapsScreen({super.key, required this.favorite});
final List<Trip>favorite;
  @override
  State<TapsScreen> createState() => _TapsScreenState();
}

class _TapsScreenState extends State<TapsScreen> {
  int select=0;
 List<Map<String,dynamic>>?screens;
    @override
  void initState() {
     screens=[
    {
      'screen':const HomeView(),
      'title':'التصنيفات'
    }
    
    ,
     {
      'screen': FavoritesScreen(favorites:widget.favorite,),
      'title':'الرحلات المفضله'
    }
    ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
appBar: AppBar(title:Text(screens![select]['title'])),
drawer:const  AppDrawer(),
body: screens![select]['screen'],
bottomNavigationBar: BottomNavigationBar(
  selectedItemColor: Theme.of(context).hintColor,
  unselectedItemColor: Colors.white,
  currentIndex: select,
  onTap: (value) {
    setState(() {
      select=value;
    });
  },
  backgroundColor: Theme.of(context).primaryColor,
  items:const [
    BottomNavigationBarItem(
label: 'التصنيفات',
          icon: Icon(Icons.dashboard
        
        ),

    ),
        BottomNavigationBarItem(

label: 'المفضلة',
          icon: Icon(Icons.star
        
        ),

    ),

  ]),
    );
  }
}