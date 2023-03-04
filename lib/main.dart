import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:training_app/responsive/mobile_screen_layout.dart';
import 'package:training_app/responsive/responsive_layout_screen.dart';
import 'package:training_app/responsive/web_screen_layout.dart';
import 'package:training_app/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyCTkfZ9YEGebqtQLYkfyYAywmlxWxJgIek',
        appId: "1:645974518800:web:e871888435e92e3a96ae95",
        messagingSenderId: "645974518800",
        projectId: "training-app-13487",
        storageBucket: "training-app-13487.appspot.com",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

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
