import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../pages/favorite_page.dart';
import '../pages/home_page.dart';
import '../pages/mirror_page.dart';
import '../pages/project_page.dart';
import '../providers/book_provider.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bookProvider = Provider.of<BookProvider>(context);

    // Mengisi _screens dengan data dari bookProvider
    if (_screens.isEmpty) {
      _screens.addAll([
        HomePage(
          onFavoriteToggle: bookProvider.toggleFavorite,
          favBooks: bookProvider.favBooks,
        ),
        ProjectPage(
          onFavoriteToggle: bookProvider.toggleFavorite,
          favBooks: bookProvider.favBooks,
        ),
        MirrorPage(
          onFavoriteToggle: bookProvider.toggleFavorite,
          favBooks: bookProvider.favBooks,
        ),
        FavoritePage(
          onFavoriteToggle: bookProvider.toggleFavorite,
          favBooks: bookProvider.favBooks,
        ),
      ]);
    }

    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Projects',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chrome_reader_mode),
            label: 'Mirror',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
