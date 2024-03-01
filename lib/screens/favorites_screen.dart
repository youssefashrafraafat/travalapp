import 'package:flutter/material.dart';
import 'package:travelapp/models/trip.dart';
import 'package:travelapp/widgets/travel_item.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key, required this.favorites});
final List<Trip>favorites;

  @override
  Widget build(BuildContext context) {
     if (favorites.isEmpty) {
      return const Center(
        child: Text('ليس لديك أي رحلة في قائمة المفضلة'),
      );
    } else {
      
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return TravalItem(
            id: favorites[index].id,
            title: favorites[index].title,
            imageUrl: favorites[index].imageUrl,
            duration: favorites[index].duration,
            tripType: favorites[index].tripType,
            season: favorites[index].season,
            // removeItem: _removeTrip,
          );
        },
        itemCount: favorites.length,
      );
    }
  }
}