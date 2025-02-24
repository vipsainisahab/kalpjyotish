import 'package:flutter/material.dart';
import 'package:new_astro/utils/theme_color.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Image(image: AssetImage('assets/images/successVector.png')),
            SizedBox(height: 80),
            Icon(Icons.check_circle, color: ThemeColor.astroGreen, size: 60),
            SizedBox(height: 15),
            Text('Mobile verification has successfully done',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
