import 'package:flutter/material.dart';
import 'package:komik_app/pages/favorite_page.dart';
import 'package:komik_app/pages/home_page.dart';
import 'package:komik_app/pages/mirror_page.dart';
import 'package:komik_app/pages/project_page.dart';

import '../data_provider/dummy.dart';
import '../models/book_model.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  List<BookModel> books = Dummy.books;
  List<String> favBooks = [];
  int _selectedIndex = 0;

  void toggleFav(String bookId) {
    setState(() {
      if (favBooks.contains(bookId)) {
        favBooks.remove(bookId);
      } else {
        favBooks.add(bookId);
      }
      // Debug log
      print('Fav Books: $favBooks');
    });
  }

  final List<Widget> _screens = [];

  @override
  void initState() {
    super.initState();
    // Menginisialisasi halaman dengan akses ke daftar favorit dan fungsi toggle
    _screens.addAll([
      HomePage(onFavoriteToggle: toggleFav, favBooks: favBooks),
      ProjectPage(onFavoriteToggle: toggleFav, favBooks: favBooks),
      MirrorPage(onFavoriteToggle: toggleFav, favBooks: favBooks),
      FavoritePage(onFavoriteToggle: toggleFav, favBooks: favBooks),
    ]);
  }

  // Fungsi untuk menangani perubahan halaman
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Menampilkan halaman sesuai indeks yang dipilih
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
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex, // Indeks saat ini
        backgroundColor: Colors.black,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped, // Mengatur fungsi saat item ditekan
      ),
    );
  }
}
