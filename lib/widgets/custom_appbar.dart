import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget customAppBar() {
  return Container(
    padding: EdgeInsets.only(
        top: MediaQuery.of(Get.context!).padding.top, left: 10, right: 10),
    height: 80,
  decoration: BoxDecoration(
      color: Color(0xFFE1353C),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Back Button
        IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Get.back();
          },
        ),

        // Title with Image
        Row(
          children: [
            ClipOval(
              child: Image.asset(
                'assets/images/appbar_vector.png',
                width: 35,
                height: 35,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10),
            Text(
              'Notification',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),

        // Placeholder for balance layout (can be replaced with an action button)
        Icon(Icons.notifications, color: Colors.transparent),
      ],
    ),
  );
}
