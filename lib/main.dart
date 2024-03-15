import 'package:flutter/material.dart';
import 'package:todo/root_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: RootScreen(),
      initialRoute: RootScreen.routeName,
      routes: {
        RootScreen.routeName: (context) => RootScreen(),
      },
    );
  }
}
