import 'package:flutter/material.dart';
import 'package:komik_app/providers/book_provider.dart';
import 'package:komik_app/widget/bottom_navbar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => BookProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor:
            Colors.black, // Memastikan latar belakang scaffold hitam
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor:
              Colors.black, // Mengatur warna latar belakang bottom nav
        ),
      ),
      home: const BottomNavbar(),
    );
  }
}
