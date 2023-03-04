import 'package:flutter/material.dart';
import 'package:training_app/responsive/mobile_screen_layout.dart';
import 'package:training_app/responsive/responsive_layout_screen.dart';
import 'package:training_app/responsive/web_screen_layout.dart';
import 'package:training_app/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Training App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      home: ResponsiveLayout(
        mobileScreenLayout: const MobileScreenLayout(),
        webScreenLayout: const WebScreenLayout(),
      ),
    );
  }
}
