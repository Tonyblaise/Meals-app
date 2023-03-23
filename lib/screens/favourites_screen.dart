import 'package:flutter/material.dart';
import 'package:navigation/models/meal.dart';
import 'package:navigation/widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  const FavouritesScreen({super.key, required this.favoriteMeals});

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text("You have no favourites yet. Start to add some"),
      );
    } else {
    return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoriteMeals[index].id,
            title: favoriteMeals[index].title,
            affordability: favoriteMeals[index].affordability,
            imageUrl: favoriteMeals[index].imageUrl,
            complexity: favoriteMeals[index].complexity,
            duration: favoriteMeals[index].duration, removeItem: null,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
