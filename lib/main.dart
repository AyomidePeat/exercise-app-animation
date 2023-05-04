import 'package:exercise_app_animation/screens/challenge_list_screen.dart';
import 'package:exercise_app_animation/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  // This widget is the root of your application
  @override
  Widget build(BuildContext context) {
   Animate.restartOnHotReload = true;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
