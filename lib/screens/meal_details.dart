import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetails extends StatelessWidget {
  static const routeName = '/meal-details';
  final Function toggleFavourite;
  final Function isFavourite;
  const MealDetails(
      {Key? key, required this.toggleFavourite, required this.isFavourite})
      : super(key: key);

  Widget _buildSectionTitle(String text, BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget _buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((el) => el.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(2),
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _buildSectionTitle('Ingredients', context),
            // ! LATER ADD MEDIAQUERY
            _buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Theme.of(context).colorScheme.secondary,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(selectedMeal.ingredients[index])),
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            _buildSectionTitle('Steps', context),
            _buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('#${index + 1}'),
                        ),
                        title: Text(selectedMeal.steps[index]),
                      ),
                      const Divider()
                    ],
                  );
                },
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child:
            Icon(isFavourite(mealId) ? Icons.favorite_border : Icons.favorite),
        onPressed: () => toggleFavourite(mealId),
      ),
    );
  }
}
