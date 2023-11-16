import 'package:calaton_third_project/app/screens/screen_factory/screen_factory.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScreenFactory.buildInitialScreen(),
    );
  }
}