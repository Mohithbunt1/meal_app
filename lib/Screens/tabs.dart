import 'package:flutter/material.dart';
import 'package:meal_app/Models/datas.dart';
import 'package:meal_app/Models/mealitem.dart';
import 'package:meal_app/Screens/categories.dart';
import 'package:meal_app/Screens/filters.dart';
import 'package:meal_app/Screens/meals.dart';
import 'package:meal_app/widgets/Drawer.dart';

const intialfilter = {
  Filter.glutenfree: false,
  Filter.lacotosefree: false,
  Filter.vegie: false,
  Filter.vegan: false,
};

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  var selectedindex = 0;
  final List<Meal> _favoritemeal = [];
  Map<Filter, bool> _selectedfilter = intialfilter;

  void showinfo(String msg) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          msg,
        ),
      ),
    );
  }

  void FavoriteMeals(Meal meal) {
    final isexist = _favoritemeal.contains(meal);

    if (isexist) {
      setState(() {
        _favoritemeal.remove(meal);
      });
      showinfo("meal unfavorited");
    } else {
      setState(() {
        _favoritemeal.add(meal);
      });
      showinfo("Meal added as a favorites");
    }
  }

  void _selectpage(int index) {
    setState(() {
      selectedindex = index; // Assign the value of index to selectedindex
    });
  }

  void setScreen(String identifier) async {
    Navigator.pop(context);
    if (identifier == 'Filters') {
      final result = await Navigator.push<Map<Filter, bool>>(
        context,
        MaterialPageRoute(
          builder: (context) => FilterScreen(
            currentfilters: _selectedfilter,
          ),
        ),
      );
      if (result != null) {
        setState(() {
          _selectedfilter = result;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final avaiablemeals = dummyMeals.where(
      (meal) {
        if (_selectedfilter[Filter.glutenfree]! && !meal.isGlutenFree) {
          return false;
        }
        if (_selectedfilter[Filter.lacotosefree]! && !meal.isLactoseFree) {
          return false;
        }
        if (_selectedfilter[Filter.vegie]! && !meal.isVegetarian) {
          return false;
        }
        if (_selectedfilter[Filter.vegan]! && !meal.isVegan) {
          return false;
        }
        return true;
      },
    ).toList();
    Widget currentpage = Categories(
      FavoriteMeals: FavoriteMeals,
      avaiablemeal: avaiablemeals,
    );
    var activetitle = 'Category';

    if (selectedindex == 1) {
      currentpage = MealsScreen(
        title: "fav",
        meals: _favoritemeal,
        FavoriteMeals: FavoriteMeals,
      );
      activetitle = 'Your Favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activetitle),
      ),
      drawer: Drawer1(
        onSelectScreen: setScreen,
      ),
      body: currentpage,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedindex,
          onTap: _selectpage,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.set_meal,
                ),
                label: "Category"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                ),
                label: "favorite"),
          ]),
    );
  }
}
