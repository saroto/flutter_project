import 'package:flutter/material.dart';
import 'package:meat_app/models/meal.dart';
import 'package:meat_app/screens/meal_details.dart';
import 'package:meat_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {super.key,
      this.title,
      required this.meals,
      required this.onToggleFavorite});
  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavorite;
  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) =>
            MealDetailsScreen(meal: meal, onToggleFavorite: onToggleFavorite)));
  }

  @override
  Widget build(BuildContext context) {
    Widget body = ListView.builder(
      itemBuilder: (context, index) {
        return MealItem(
            meal: meals[index],
            onSelectMeal: (meal) {
              selectMeal(context, meal);
            });
      },
      itemCount: meals.length,
    );
    if (meals.isEmpty) {
      body = Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "No meals found",
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            "Try selecting a different category",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ],
      ));
    }
    if (title == null) {
      return body;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: body,
    );
  }
}
