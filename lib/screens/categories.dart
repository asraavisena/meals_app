import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/categories_item.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ! SLIVER IS SCROLLABLE FOR GRID
    // ! GRID DELEGATE -> VIEW DELEGATE AS GRID
    // ! MAXCROSSAXISEXTENT -> CREATE AS MANY COLUMN AS WE CAN FIT ON THE SCREEN
    return Scaffold(
        appBar: AppBar(
          title: Text('App Meals Flutter'),
        ),
        body: GridView(
          padding: const EdgeInsets.all(25),
          children: DUMMY_CATEGORIES
              .map((el) => CategoryItem(
                  title: el.title,
                  color: el.color,
                  id: el.id)) // ! KALAU ADA KAYA OBJECT JANGAN LUPA KEY:PROP
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio:
                  3 / 2, // ! FOR 200 WIDTH I WANT TO HAVE 300 HEIGHT IN THE END
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
        ));
  }
}
