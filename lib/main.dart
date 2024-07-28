import 'package:biu_merch/consts/consts.dart';
import 'package:biu_merch/views/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BIU Merch',
      theme: ThemeData(
       scaffoldBackgroundColor: Colors.transparent,
       appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(
          color: warnaText,
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent
       ),
       fontFamily: regular,
      ),
      home: const SplashScreen(),
    );
  }
}
