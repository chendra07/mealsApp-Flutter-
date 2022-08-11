import 'package:flutter/material.dart';

//dummyData
import './data/dummy_data.dart';

//model
import './models/meals_model.dart';

//routes
import 'routes/routes_config.dart';

//screens
import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import './screens/filter_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoritedMeals = [];

  void _setFilter(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoritedMeals.indexWhere((meal) => meal.id == mealId);

    if (existingIndex >= 0) {
      setState(() {
        _favoritedMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoritedMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoritedMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.pink,
          secondary: Colors.amber,
        ),
        canvasColor: const Color.fromARGB(255, 253, 238, 216),
        fontFamily: 'Raleway',
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          bodyText2: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          headline6: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            // fontFamily: 'RobotoCondensed',
          ),
          headline5: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      // home: const CategoriesScreen(),
      initialRoute: RoutesConfig.tabHomeScreen,
      routes: {
        RoutesConfig.tabHomeScreen: (ctx) => TabsScreen(
              favoritedMeals: _favoritedMeals,
            ),
        RoutesConfig.categoryMealsScreen: (ctx) => CategoryMealsScreen(
              avaliableMeals: _availableMeals,
            ),
        RoutesConfig.mealDetailScreen: (ctx) => MealDetailScreen(
              toggleFavorite: _toggleFavorite,
              isMealFavorite: _isMealFavorite,
            ),
        RoutesConfig.filterScreen: (ctx) => FilterScreen(
              saveFilters: _setFilter,
              currentFilter: _filters,
            ),
      },
      //good for highly dynamic route
      // onGenerateRoute: ((settings) {
      //   return MaterialPageRoute(
      //     builder: (ctx) => const CategoriesScreen(),
      //   );
      // }),
      // Last resort, last thing to render if there is something wrong with the app routing
      onUnknownRoute: ((settings) {
        return MaterialPageRoute(
          builder: (ctx) => const CategoriesScreen(),
        );
      }),
    );
  }
}
