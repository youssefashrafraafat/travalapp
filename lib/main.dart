import 'package:flutter/material.dart';



import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:travelapp/app_data.dart';
import 'package:travelapp/models/trip.dart';
import 'package:travelapp/screens/tap_screen.dart';

import 'package:travelapp/screens/traval_details.dart';
void main() {
  runApp(const TravelApp());
}

class TravelApp extends StatefulWidget {
  const TravelApp({super.key});

  @override
  State<TravelApp> createState() => _TravelAppState();
}

class _TravelAppState extends State<TravelApp> {

List<Trip>travelfavorite=[];
dynamic manageFavorite(dynamic id){
final index=travelfavorite.indexWhere((element) => element.id==id);
if(index>=0){
  travelfavorite.removeAt(index);
}else{
  travelfavorite.add(tripsdata.firstWhere((element) => element.id==id));
}
}
  bool isFovarite(String id) {
    return travelfavorite.any((trip) => trip.id == id);
  }
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
        localizationsDelegates:const [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: const[
    Locale('ar','AE'), // English
     
    ],
      debugShowCheckedModeBanner: false,
            theme: ThemeData(
          primarySwatch: Colors.blue,
          hintColor: Colors.amber,
          fontFamily: 'ElMessiri',
          textTheme: ThemeData.light().textTheme.copyWith(
                headlineSmall:const TextStyle(
                  color: Colors.blue,
                  fontSize: 24,
                  fontFamily: 'ElMessiri',
                  fontWeight: FontWeight.bold,
                ),
                titleLarge:const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: 'ElMessiri',
                  fontWeight: FontWeight.bold,
                ),
              )),
    initialRoute: '/',        
    
    routes: {
    '/':(context) => TapsScreen(favorite: travelfavorite,),
    TravalDetails.id:(context) => TravalDetails(favorite: manageFavorite,isFavorite: isFovarite,),
  
    },
    );
  }
}