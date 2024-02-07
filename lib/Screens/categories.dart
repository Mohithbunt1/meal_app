import 'package:flutter/material.dart';
import 'package:meal_app/Models/CategoryModel.dart';
import 'package:meal_app/Models/datas.dart';
import 'package:meal_app/Models/mealitem.dart';
import 'package:meal_app/Screens/meals.dart';
import 'package:meal_app/widgets/category_Items.dart';

class Categories extends StatelessWidget {
  const Categories(
      {super.key, required this.FavoriteMeals, required this.avaiablemeal});

  final void Function(Meal meal) FavoriteMeals;
  final List<Meal> avaiablemeal;

  void _selectcategory(BuildContext context, Category category) {
    final filtermeals = avaiablemeal
        .where(
          (meal) => meal.categories.contains(category.id),
        )
        .toList();
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MealsScreen(
            title: category.title,
            meals: filtermeals,
            FavoriteMeals: FavoriteMeals,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        children: [
          for (final category in availableCategories)
            CategoryItems(
              category: category,
              onselectCategory: () {
                _selectcategory(context, category);
              },
            )
        ],
      ),
    );
  }
}
