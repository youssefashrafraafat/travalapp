import 'package:flutter/material.dart';
import 'package:travelapp/app_data.dart';
import 'package:travelapp/models/trip.dart';
import 'package:travelapp/widgets/travel_item.dart';

class CategoryTravels extends StatefulWidget {
  const CategoryTravels({super.key, required this.iditem, required this.title});
  static const String id = 'categorytravel';
  final dynamic iditem;
  final String title;

  @override
  State<CategoryTravels> createState() => _CategoryTravelsState();
}

class _CategoryTravelsState extends State<CategoryTravels> {
  
  List<Trip>?filter;
  @override
  void initState() {
       filter = tripsdata.where((element) {
      return element.categories.contains(widget.iditem);
    }).toList();
    super.initState();
  }
  void remove(String result){
    setState(() {
      filter!.removeWhere((element) => element.id==result);
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: ListView.builder(
        physics:const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return TravalItem(
            
              id: filter![index].id,
              title: filter![index].title,
              imageUrl: filter![index].imageUrl,
              duration: filter![index].duration,
              tripType: filter![index].tripType,
              season: filter![index].season);
        },
        itemCount: filter!.length,
      ),
    );
  }
}
