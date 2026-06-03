import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const EchoLinkApp());
}

class EchoLinkApp extends StatelessWidget {
  const EchoLinkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EchoLink',
      home: SplashScreen(),
    );
  }
}
