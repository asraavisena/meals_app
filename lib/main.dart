import 'package:flutter/material.dart';
import './dummy_data.dart';
import './models/meal.dart';
import './screens/filters.dart';
import './screens/tabs.dart';
import './screens/meal_details.dart';
import './screens/category_meals.dart';
import './screens/categories.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  List<Meal> _availableMeal = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filteredData) {
    setState(() {
      _filters = filteredData;
      _availableMeal = DUMMY_MEALS.where((el) {
        if (_filters['gluten']! && !el.isGlutenFree) {
          return false;
        }
        if (_filters['lactose']! && !el.isLactoseFree) {
          return false;
        }

        if (_filters['vegan']! && !el.isVegan) {
          return false;
        }

        if (_filters['vegetarian']! && !el.isVegetarian) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_filters);

    return MaterialApp(
      title: 'Flutter Meals',
      theme: ThemeData(
          primarySwatch: Colors.teal,
          //! ACCENT COLOR DEPECRATED USING COLOR SCHEME
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal)
              .copyWith(secondary: Colors.yellow[400]),
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyText2: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              headline6: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold))),
      // home: const Categories(),
      // ! ROUTES IS SCREEN
      initialRoute: '/',
      routes: {
        '/': (ctx) => const Tabs(),
        CategoryMeals.routeName: (ctx) =>
            CategoryMeals(availableMeals: _availableMeal),
        MealDetails.routeName: (ctx) => const MealDetails(),
        Filters.routeName: (ctx) =>
            Filters(currentFilters: _filters, saveFilters: _setFilters)
      },
      // ! GO TO THE DEFINED ROUTES IN ONGENERATEROUTE WHEN ROUTES IS NOT DEFINED IN ROUTES
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => const Categories());
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => const Categories());
      },
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: const Center(
//           child: Text(
//         'You have pushed the button this many times:',
//       )), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
