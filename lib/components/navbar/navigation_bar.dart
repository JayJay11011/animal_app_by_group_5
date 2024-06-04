import 'dart:convert';

import 'package:flutter/material.dart';
import '../pages/favorite_page.dart';
import '../pages/home_page.dart';
import '../pages/history_page.dart';
import '../pages/second_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../pages/keyword_page.dart';

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(useMaterial3: true, primarySwatch: Colors.green),
        home: const NavigationExample(),
        routes: <String, WidgetBuilder>{
          '/second': (BuildContext context) => const SecondPage(),
          '/home': (BuildContext context) =>
              const MyHomePage(title: 'Animal Nature'),
        });
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: currentPageIndex,
        onTap: (i) => setState(() => currentPageIndex = i),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: const Icon(Icons.home_outlined),
            activeIcon: const Icon(Icons.home),
            title: const Text("ໜ້າຫຼັກ"),
            unselectedColor: Colors.black,
            selectedColor: const Color(0xFF0F401F),
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: const Icon(Icons.favorite_border),
            activeIcon: const Icon(Icons.favorite),
            title: const Text("ລາຍການໂປດ"),
            unselectedColor: Colors.black,
            selectedColor: const Color(0xFF0F401F),
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: const Icon(Icons.history_outlined),
            activeIcon: const Icon(Icons.history),
            title: const Text("ປະຫວັດ"),
            unselectedColor: Colors.black,
            selectedColor: const Color(0xFF0F401F),
          ),

          SalomonBottomBarItem(
            icon: const Icon(Icons.menu_book_outlined),
            activeIcon: const Icon(Icons.menu_book),
            title: const Text("ຄຳສັບ"),
            unselectedColor: Colors.black,
            selectedColor: const Color(0xFF0F401F),
          ),
        ],
      ),
      body: <Widget>[
        const MyHomePage(title: "ໜ້າຫຼັກ"),
        const ContentsPage(),
        const ProfilePage(),
        const SettingsPage(),
      ][currentPageIndex],
    );
  }
}
