import 'package:flutter/material.dart';

import './screen/categories_screen.dart';
import './screen/categories_meal_screen.dart';
import './screen/meal_detail_screen.dart';
import './screen/tabs_screen.dart';
import './screen/filter_screen.dart';

import './_data/dummy_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegen': false,
    'vegetarian': false,
  };

  List _availableMeals = DUMMY_MEALS;

  List _favoriteMeals = [];

  void _setFilter(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((item) {
        if (_filters['gluten'] && !item.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !item.isLactoseFree) {
          return false;
        }
        if (_filters['vegen'] && !item.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !item.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final exsitingIndex = _favoriteMeals.indexWhere((meal) {
      return meal.id == mealId;
    });
    if (exsitingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(exsitingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Roboto',
        textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            body2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            title: TextStyle(
                fontSize: 20,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold)),
      ),
      // home: CategoriesScreen(),
      routes: {
        '/': (ctx) => TabsScreen(_favoriteMeals),
        CategoriesMealScreen.routeName: (ctx) => CategoriesMealScreen(
              _availableMeals,
            ),
        MealDetailScreen.routeNAme: (ctx) => MealDetailScreen(
              _toggleFavorite,
              _isMealFavorite,
            ),
        FilterScreen.routName: (ctx) => FilterScreen(
              _filters,
              _setFilter,
            ),
      },
      // This Route is use dynamic route
      // onGenerateRoute: (settinngs){
      //   print(settinngs.arguments);
      // },
      onUnknownRoute: (settings) {
        /**
         * This route hit when the flutter not found any route.
         */

        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(),
        );
      },
    );
  }
}
