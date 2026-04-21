import 'package:flutter/material.dart';
import 'package:assignment4gobus/screens/homeScreen.dart';
import 'package:assignment4gobus/screens/favoritesScreen.dart';
import 'package:assignment4gobus/screens/profileScreen.dart';

void main() {
  runApp(const GoBusApp());
}

class GoBusApp extends StatefulWidget {
  const GoBusApp({super.key});

  @override
  State<GoBusApp> createState() => _GoBusAppState();
}

class _GoBusAppState extends State<GoBusApp> {
  // 1. Lifted State: This now controls the entire app's theme
  bool _isDarkMode = false;

  void _toggleTheme(bool value) {
    setState(() {
      _isDarkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      title: 'GoBus',
      // 2. Dynamic Theme: Switches between Light and Dark [cite: 166]
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: MainNavigation(
        isDarkMode: _isDarkMode,
        onThemeChanged: _toggleTheme,
      ),
    );
  }
}

class MainNavigation extends StatefulWidget {
  final bool isDarkMode;
  final Function(bool) onThemeChanged;

  const MainNavigation({
    super.key, 
    required this.isDarkMode, 
    required this.onThemeChanged
  });

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // 3. Passing the toggle down to the ProfileScreen
    final List<Widget> _screens = [
      const HomeScreen(),
      const FavoritesScreen(),
      ProfileScreen(
        isDarkMode: widget.isDarkMode,
        onThemeChanged: widget.onThemeChanged,
      ),
    ];

    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: const Color(0xFF1565C0),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}