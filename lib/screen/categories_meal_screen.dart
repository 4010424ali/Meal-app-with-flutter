import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
// import '../models/meal.dart';

class CategoriesMealScreen extends StatefulWidget {
  static const routeName = '/categories-meals';

  final List availableMeal;

  CategoriesMealScreen(this.availableMeal);

  @override
  _CategoriesMealScreenState createState() => _CategoriesMealScreenState();
}

class _CategoriesMealScreenState extends State<CategoriesMealScreen> {
  String categoryTitle;
  List displayMeals;
  var _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  void removeMeal(String id) {
    setState(() {
      displayMeals.removeWhere((item) {
        return item.id == id;
      });
    });
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;

      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];

      displayMeals = widget.availableMeal.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayMeals[index].id,
            title: displayMeals[index].title,
            imageUrl: displayMeals[index].imageUrl,
            duration: displayMeals[index].duration,
            // affordability: displayMeals[index].affordability,
            // complexity: displayMeals[index].complexity,
          );
        },
        itemCount: displayMeals.length,
      ),
    );
  }
}
