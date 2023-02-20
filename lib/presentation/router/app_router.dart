
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../screens/analyzing_screen.dart';
import '../screens/home_screen.dart';
// import '../screens/introduction.dart';
import '../screens/new_itme_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(
          ),
        );
      case '/newItem':
        return MaterialPageRoute(builder: (_)=>const NewItemScreen());
      case '/analyzing':
        return MaterialPageRoute(builder: (_)=> const AnalyzingScreen());
      // case '/introduction':
      //   return MaterialPageRoute(builder: (_)=>Introduction());
      default:
        return null;
    }
  }
}