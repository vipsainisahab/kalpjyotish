import 'package:flutter/material.dart';
import 'package:new_astro/utils/theme_color.dart';

Widget imageTextBTN(
    {bool isOnline = false,
    Function()? onOnline,
    Function()? onOffline,
    String? image,
    String? name}) {
  return Row(
    children: [
      InkWell(
        onTap: () {
          if (isOnline) {
            onOnline!();
          } else {
            onOffline!();
          }
        },
        child: Container(
          child: Row(
            children: [
              Image(
                  image: AssetImage(image!),
                  height: 15,
                  color: isOnline ? ThemeColor.astroGreen : ThemeColor.redColor),
              SizedBox(width: 5),
              Text(
                '$name',
                style: TextStyle(
                    fontSize: 12,
                    color: isOnline ? ThemeColor.astroGreen : ThemeColor.redColor),
              ),
            ],
          ),
          margin: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
          decoration: BoxDecoration(
            color: ThemeColor.homeScreenColor,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: ThemeColor.textHintColor.withOpacity(.2)),
            boxShadow: [
              BoxShadow(
                color: ThemeColor.greyColor.shade400,
                blurRadius: 4,
                offset: Offset(2, 2.5),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
