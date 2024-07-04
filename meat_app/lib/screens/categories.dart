import 'package:flutter/material.dart';
import 'package:meat_app/models/category.dart';
import 'package:meat_app/models/meal.dart';
import 'package:meat_app/screens/meals.dart';
import 'package:meat_app/widgets/categories_grid_item.dart';
import 'package:meat_app/data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen(
      {super.key,
      required this.onToggleFavorite,
      required this.availableMeals});
  final List<Meal> availableMeals;
  final void Function(Meal meal) onToggleFavorite;

  void _selectCategory(BuildContext context, Category category) {
    final fileterMeal = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (cxt) => MealsScreen(
            title: category.title,
            meals: fileterMeal,
            onToggleFavorite: onToggleFavorite),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCatagory: () {
              _selectCategory(context, category);
            },
          ),
      ],
    );
  }
}
