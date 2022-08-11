import 'package:flutter/material.dart';

//model
import '../models/meals_model.dart';

//screens
import '../screens/categories_screen.dart';
import '../screens/favorite_screen.dart';
import '../screens/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoritedMeals;
  const TabsScreen({
    @required this.favoritedMeals,
    Key key,
  }) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;

  @override
  void initState() {
    super.initState();

    _pages = [
      {
        'page': const CategoriesScreen(),
        'title': 'Categroies',
        'icon': Icons.category,
        'label': 'Categories',
        'backgroundColor': Colors.purple,
      },
      {
        'page': FavoriteScreen(favoritedMeals: widget.favoritedMeals),
        'title': 'Your Favorite',
        'icon': Icons.star,
        'label': '',
        'backgroundColor': Colors.purple,
      },
    ];
  }

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  BottomNavigationBarItem _bottomTabNavBuilder({
    BuildContext context,
    MaterialColor backgroundColor,
    @required String label,
    @required Icon icon,
  }) {
    return BottomNavigationBarItem(
      backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.primary,
      icon: icon,
      label: label.isEmpty ? "[Unknown label]" : label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_selectedPageIndex]['title'],
        ),
      ),
      drawer: const MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: _pages.map((element) {
          return _bottomTabNavBuilder(
            context: context,
            backgroundColor: element['backgroundColor'],
            icon: Icon(element['icon']),
            label: element['label'],
          );
        }).toList(),
      ),
    );
  }
}
