import 'package:flutter/material.dart';


class BackgroundScreen extends StatelessWidget {
  const BackgroundScreen({super.key, required this.child});
 final Widget child;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            right: -70,
            top: -70,
            child: Container(
              width: 180, // Diameter (2 * radius)
              height: 180,
              decoration: const BoxDecoration(
                color: Colors.amber,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Container( child: child,)
        ],
      ),
    );
  }
}