import 'package:flutter/material.dart';
import './screens/filters.dart';
import './screens/tabs.dart';
import './screens/meal_details.dart';
import './screens/category_meals.dart';
import './screens/categories.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        CategoryMeals.routeName: (ctx) => CategoryMeals(),
        MealDetails.routeName: (ctx) => const MealDetails(),
        Filters.routeName: (ctx) => const Filters()
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
