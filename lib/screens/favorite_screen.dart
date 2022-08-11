import 'package:flutter/material.dart';

//model
import '../models/meals_model.dart';

//component
import '../components/meals/meals_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoritedMeals;
  const FavoriteScreen({
    Key key,
    this.favoritedMeals,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favoritedMeals.isEmpty) {
      return const Center(
        child: Text("You have no favorites yet - start adding some!"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealsItem(
            mealsId: favoritedMeals[index].id,
            title: favoritedMeals[index].title,
            imageUrl: favoritedMeals[index].imageUrl,
            duration: favoritedMeals[index].duration,
            affordability: favoritedMeals[index].affordability,
            complexity: favoritedMeals[index].complexity,
          );
        },
        itemCount: favoritedMeals.length,
      );
    }
  }
}
