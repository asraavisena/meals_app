import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/main_drawer.dart';
import './favorites.dart';
import './categories.dart';

class Tabs extends StatefulWidget {
  final List<Meal> favouriteMeal;
  const Tabs({Key? key, required this.favouriteMeal}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _selectedIndex = 0;
  List<Map<String, Object>>? _pages;

  @override
  void initState() {
    _pages = [
      {'pages': const Categories(), 'title': 'Categories'},
      {
        'pages': Favourites(favouriteMeal: widget.favouriteMeal),
        'title': 'Favourites'
      }
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text((_pages![_selectedIndex]['title'] as String)),
        // bottom: TabBar(tabs: <Widget>[
        //   Tab(
        //     icon: Icon(Icons.category),
        //     text: 'Categories',
        //   ),
        //   Tab(
        //     icon: Icon(Icons.star),
        //     text: 'Categories',
        //   )
        // ]),
      ),
      drawer: const MainDrawer(),
      body: (_pages![_selectedIndex]['pages'] as Widget),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedIndex,
        // type: BottomNavigationBarType.shifting,
        items: const [
          BottomNavigationBarItem(
              // backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              label: 'Categories'),
          BottomNavigationBarItem(
              // backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              label: 'Favorites')
        ],
      ),
      // TabBarView(
      //   children: [Categories(), Favourites()],
      // ),
    );
  }
}
