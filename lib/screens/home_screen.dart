import 'package:flutter/material.dart';
import 'package:agri_market_locator/screens/farmer_screen.dart' as farmer;
import 'package:agri_market_locator/screens/market_screen.dart' as market;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // List of pages for each tab
  static final List<Widget> _pages = <Widget>[
    const Center(child: Text('Welcome to Agriculture Market Locator')), // Home page
    const farmer.FarmerScreen(), // Farmer Screen using the 'farmer' prefix
    const market.MarketScreen(), // Market Screen using the 'market' prefix
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agriculture Market Locator'),
      ),
      body: _pages[_selectedIndex], // Switches between pages
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.agriculture), label: 'Farmers'),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Markets'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}
