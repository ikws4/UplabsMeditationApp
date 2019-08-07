import 'package:flutter/material.dart';

import 'feature/feature_screen.dart';
import 'home/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UplabsMeditationApp',
      theme: ThemeData(
          toggleableActiveColor: Color(0xFF6674FE),
          brightness: Brightness.dark,
          fontFamily: 'GoogleSans',
          chipTheme: Theme.of(context).chipTheme.copyWith(backgroundColor: Color(0xFF6674FE)),
          scaffoldBackgroundColor: Color(0xFF1C1F31),
          iconTheme: IconThemeData(color: Colors.white)),
      routes: {
        '/home': (context) => HomeScreen(),
        '/feature': (context) => FeatureScreen(),
      },
      home: HomeScreen(),
    );
  }
}
