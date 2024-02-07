import 'package:flutter/material.dart';

enum Filter {
  glutenfree,
  lacotosefree,
  vegie,
  vegan,
}

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.currentfilters});
  final Map<Filter, bool> currentfilters;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenfree = false;
  var _lactosefree = false;
  var vegan = false;
  var vegie = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _glutenfree = widget.currentfilters[Filter.glutenfree]!;
    _lactosefree = widget.currentfilters[Filter.lacotosefree]!;
    vegie = widget.currentfilters[Filter.vegie]!;
    vegan = widget.currentfilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Filters",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
        ),
        // drawer: Drawer1(onSelectScreen: (identifier) {
        //   Navigator.of(context).pop();
        //   if (identifier == 'Meals') {
        //     Navigator.of(context).push(
        //       MaterialPageRoute(
        //         builder: (context) => TabScreen(),
        //       ),
        //     );
        //   }
        // }),
        body: WillPopScope(
          onWillPop: () async {
            Navigator.of(context).pop({
              Filter.glutenfree: _glutenfree,
              Filter.lacotosefree: _lactosefree,
              Filter.vegie: vegie,
              Filter.vegan: vegan,
            });
            return false;
          },
          child: Column(
            children: [
              SwitchListTile(
                value: _glutenfree,
                onChanged: (isChecked) {
                  setState(() {
                    _glutenfree = isChecked;
                  });
                },
                title: Text(
                  "Gluten-Free",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: EdgeInsets.only(left: 34, right: 22),
              ),
              SwitchListTile(
                value: _lactosefree,
                onChanged: (isChecked) {
                  setState(() {
                    _lactosefree = isChecked;
                  });
                },
                title: Text(
                  "Lactose-Free",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: EdgeInsets.only(left: 34, right: 22),
              ),
              SwitchListTile(
                value: vegan,
                onChanged: (isChecked) {
                  setState(() {
                    vegan = isChecked;
                  });
                },
                title: Text(
                  "Vegan",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: EdgeInsets.only(left: 34, right: 22),
              ),
              SwitchListTile(
                value: vegie,
                onChanged: (isChecked) {
                  setState(() {
                    vegie = isChecked;
                  });
                },
                title: Text(
                  "Pure-Veg",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: EdgeInsets.only(left: 34, right: 22),
              ),
            ],
          ),
        ));
  }
}
