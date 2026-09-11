import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MiniApp1());
}

class MiniApp1 extends StatelessWidget {
  const MiniApp1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutterskle',
      
      home: const HomeScreen(),
    );
  }
}
