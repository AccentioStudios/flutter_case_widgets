import 'package:book_widgets/pages/favorites_page.dart';
import 'package:book_widgets/pages/home_page.dart';
import 'package:flutter/material.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  int _indexSelected = 0;
  final screens = [
    const HomePage(),
    const FavoritesScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_indexSelected],
      bottomNavigationBar: SizedBox(
        height: 100,
        child: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                _indexSelected = index;
              });
              debugPrint(index.toString());
            },
            selectedItemColor: Colors.blue,
            showSelectedLabels: true,
            currentIndex: _indexSelected,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.star), label: 'Favorites')
            ]),
      ),
    );
  }
}
