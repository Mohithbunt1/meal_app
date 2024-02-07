import 'package:flutter/material.dart';
import 'package:meal_app/Models/mealitem.dart';
import 'package:meal_app/Screens/mealdetails.dart';
import 'package:meal_app/widgets/meal_iteams.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    Key? key,
    this.title,
    required this.meals,
    required this.FavoriteMeals,
  }) : super(key: key);

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) FavoriteMeals;

  void selectmeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealDetail(
          meal: meal,
          FavoriteMeals: FavoriteMeals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var content = meals.isEmpty
        ? const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("No data"),
                SizedBox(
                  height: 20,
                ),
                Text("Try selecting a different category."),
              ],
            ),
          )
        : SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              itemCount: meals.length,
              itemBuilder: (context, index) => MealItem(
                meal: meals[index],
                onselectmeal: (Meal meal) {
                  selectmeal(context, meal);
                },
              ),
            ),
          );

    if (title == null) {
      return content;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
