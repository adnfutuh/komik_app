import 'package:flutter/material.dart';
import 'package:komik_app/pages/favorite_page.dart';
import 'package:komik_app/pages/home_page.dart';
import 'package:komik_app/pages/mirror_page.dart';
import 'package:komik_app/pages/project_page.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0; // Menyimpan indeks halaman yang dipilih

  // Daftar halaman yang akan ditampilkan
  final List<Widget> _screens = [
    const HomePage(),
    const ProjectPage(),
    const MirrorPage(),
    const FavoritePage(),
  ];

  // Fungsi untuk menangani perubahan halaman
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Mengubah indeks halaman yang dipilih
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
