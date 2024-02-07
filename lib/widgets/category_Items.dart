import 'package:flutter/material.dart';
import 'package:meal_app/Models/CategoryModel.dart';

class CategoryItems extends StatelessWidget {
  const CategoryItems(
      {Key? key, required this.onselectCategory, required this.category})
      : super(key: key);

  final Category category;
  final void Function() onselectCategory;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onselectCategory,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Text(
            category.title,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ),
      ),
    );
  }
}
