import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/theme_color.dart';

PreferredSizeWidget customAppBar({String? tittle, bool backButton = false}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(80),
    child: Container(
      height: 80,
      decoration: BoxDecoration(color: ThemeColor.primaryColor),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Image.asset(
              'assets/images/appbar_vector.png',
              width: 80,
              height: 75,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10),
          Positioned(
              top: 40,
              left: 20,
              child: Row(
                children: [
                  if (backButton)
                    InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Image(
                          image: AssetImage('assets/icon/back_icon.png'),
                          color: ThemeColor.textWhiteColor,
                          height: 22,
                        )),
                  SizedBox(width: backButton ? 20 : 50),
                  Text(
                    '$tittle',
                    style: TextStyle(
                        color: ThemeColor.textWhiteColor,
                        fontSize: 19,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ))
        ],
      ),
    ),
  );
}
