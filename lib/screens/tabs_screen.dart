import 'package:flutter/material.dart';
import 'package:navigation/screens/categories_screen.dart';
import 'package:navigation/screens/favourites_screen.dart';
import "package:navigation/widgets/main_drawer.dart";
import 'package:navigation/models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  const TabsScreen({required this.favoriteMeals});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  //top bar
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//         length: 2,
//         initialIndex: 0,
//         child: Scaffold(
//           appBar: AppBar(
//             title: Text("Meals"),
//             bottom: const TabBar(tabs: [
//               Tab(
//                 icon: Icon(Icons.category),
//                 text: "categories",
//               ),
//               Tab(
//                 icon: Icon(Icons.star),
//                 text: "Favourtes",
//               ),
//             ]),
//           ),
//           body: TabBarView(children: [
//             CategoriesScreen(),
//             FavouritesScreen()

//           ],),
//         ));
//   }
  late List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
     _pages =[
    {"page": CategoriesScreen(), "title": "Categories"},
    {"page": FavouritesScreen( favoriteMeals: widget.favoriteMeals,), "title": "Your Favourites"}
  ];
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]["title"] as String),
      ),
      body: _pages[_selectedPageIndex]["page"] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favourites",
          )
        ],
      ),
    );
  }
}
