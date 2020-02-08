import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List favoriteMeals;

  FavoriteScreen(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('Favorite Screen'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoriteMeals[index].id,
            title: favoriteMeals[index].title,
            imageUrl: favoriteMeals[index].imageUrl,
            duration: favoriteMeals[index].duration,
            // affordability: displayMeals[index].affordability,
            // complexity: displayMeals[index].complexity,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}