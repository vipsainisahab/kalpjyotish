import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_astro/screens/splash/splash.dart';
import 'package:new_astro/utils/theme_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Astra App',
      // theme: ThemeData(
      //   // colorScheme: ColorScheme.fromSeed(seedColor: ThemeColor.deepPurple),
      //   // useMaterial3: true,
      // ),
      // theme: ThemeData(fontFamily: 'Roboto'),
      home: const SplashScreen(),
    );
  }
}
