import 'package:flutter/material.dart';
import 'package:meal_app/Models/mealitem.dart';

class MealDetail extends StatelessWidget {
  const MealDetail(
      {super.key, required this.meal, required this.FavoriteMeals});

  final Meal meal;
  final void Function(Meal meal) FavoriteMeals;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(meal.imageUrl,
                height: 300, width: double.infinity, fit: BoxFit.cover),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 210),
                    child: Text(
                      "Ingridents",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                  ),
                  SizedBox(
                    width: 120,
                  ),
                  IconButton(
                      onPressed: () {
                        FavoriteMeals(meal);
                      },
                      icon: const Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.black,
                        size: 30,
                      ))
                ],
              ),
            ),
            for (final ingrd in meal.ingredients)
              Text(
                ingrd,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            const SizedBox(
              height: 24,
            ),
            Text(
              "Steps",
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            for (final stp in meal.steps)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                child: Text(
                  stp,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
