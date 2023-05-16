import 'package:flutter/material.dart';

import 'Helpers/AppNavigations/AppNavigations/NavigationConfig.dart';
import 'Helpers/AppNavigations/AppNavigations/NavigationHelpers.dart';

// Create a class named Myapp whihc extends the StatelessWidget
class MyApp extends StatelessWidget {
  // Create a constructor named Myapp
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute:
          AppRoute(initialPage: Pages.LandingScreenConfig, initialPageData: null)
              .onGenerateRoute,
    );
  }
}