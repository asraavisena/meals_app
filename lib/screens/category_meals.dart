import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMeals extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;
  // ! LEAVE FOR REFERENCE
  // final String categoryId;
  // final String categoryTitle;
  // const CategoryMeals(
  //     {Key? key, required this.categoryId, required this.categoryTitle})
  //     : super(key: key);
  const CategoryMeals({Key? key, required this.availableMeals})
      : super(key: key);

  @override
  State<CategoryMeals> createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {
  String? categoryTitle;
  List<Meal>? displayMeals;
  var _loadedInitDate = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_loadedInitDate == false) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitDate = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayMeals?.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle as String),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            title: displayMeals![index].title,
            imageUrl: displayMeals![index].imageUrl,
            affordability: displayMeals![index].affordability,
            complexity: displayMeals![index].complexity,
            duration: displayMeals![index].duration,
            id: displayMeals![index].id,
            removeItem: _removeMeal,
          );
        },
        itemCount: displayMeals?.length,
      ),
    );
  }
}
