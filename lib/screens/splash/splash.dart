import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_astro/screens/auth/login_screen.dart';

import '../../utils/color_resource.dart';
import '../dashboard/dashboard_screen.dart';
import '../login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // if (TokenManager.hasToken() == true) {
    Future.delayed(const Duration(seconds: 2), () {
      // Get.to(() => LoginScreen());
      Get.offAll(() => DashboardScreen());
    });
    // } else {
    //   Get.to(() => LoginScreen());
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.backgroundColor,
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 188,
              height: 154,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/splash_top.png'),
                      alignment: Alignment.center)),
            ),
          ),
          Spacer(),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/splash.png',
                  width: 280,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Kalpjyotish',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF8BD02),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              width: 188,
              height: 154,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/splash_butom.png'),
                      alignment: Alignment.center)),
            ),
          )
        ],
      ),
    );
  }
}
