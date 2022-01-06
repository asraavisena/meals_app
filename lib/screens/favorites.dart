import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class Favourites extends StatelessWidget {
  final List<Meal> favouriteMeal;

  const Favourites({Key? key, required this.favouriteMeal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favouriteMeal.isEmpty) {
      return const Center(
        child: Text('No Favourite'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            title: favouriteMeal[index].title,
            imageUrl: favouriteMeal[index].imageUrl,
            affordability: favouriteMeal[index].affordability,
            complexity: favouriteMeal[index].complexity,
            duration: favouriteMeal[index].duration,
            id: favouriteMeal[index].id,
            // removeItem: _removeMeal,
          );
        },
        itemCount: favouriteMeal.length,
      );
    }
  }
}
