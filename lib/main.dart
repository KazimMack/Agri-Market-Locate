import 'package:flutter/material.dart';
import 'package:agri_market_locator/screens/login_screen.dart';
import 'package:agri_market_locator/screens/register_screen.dart';
import 'package:agri_market_locator/screens/home_screen.dart';
import 'package:agri_market_locator/buy_products_screen.dart';

void main() {
  runApp(const AgriMarketLocatorApp());
}

class AgriMarketLocatorApp extends StatelessWidget {
  const AgriMarketLocatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agriculture Market Locator',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/login',  // Redirect to login on startup
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
