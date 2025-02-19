import 'package:flutter/material.dart';
import 'package:new_astro/utils/theme_color.dart';

class BackgroundScreen extends StatelessWidget {
  const BackgroundScreen({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.textWhiteColor,
      body: Stack(
        children: [
          Positioned(
            right: -70,
            top: -70,
            child: Container(
              width: 180, // Diameter (2 * radius)
              height: 180,
              decoration: BoxDecoration(
                color: ThemeColor.amberColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Container(
            child: child,
          )
        ],
      ),
    );
  }
}
