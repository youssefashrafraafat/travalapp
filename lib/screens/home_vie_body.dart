
import 'package:flutter/material.dart';
import 'package:travelapp/app_data.dart';
import 'package:travelapp/widgets/cat_screen.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      physics:const BouncingScrollPhysics(),
      padding:const EdgeInsets.all(10),
      gridDelegate:const  SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 250,
      childAspectRatio: 7/8,
      
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      ),
      children:catdata.map((e) => CategoryItem(title: e.title, imageUrl: e.imageUrl,id: e.id,)).toList(),
    );
  }
}