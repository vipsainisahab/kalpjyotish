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
                  color:
                      isOnline ? ThemeColor.astroGreen : ThemeColor.redColor),
              SizedBox(width: 5),
              Text(
                '$name',
                style: TextStyle(
                    fontSize: 12,
                    color:
                        isOnline ? ThemeColor.astroGreen : ThemeColor.redColor),
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

Widget verticalImageTextBTN(
    {bool isOnline = false,
    Function()? onOnline,
    Function()? onOffline,
    String? image,
    String? name}) {
  return InkWell(
    onTap: () {
      if (isOnline) {
        onOnline!();
      } else {
        onOffline!();
      }
    },
    child: Container(
      child: Column(
        children: [
          Image(
              image: AssetImage(image!),
              height: 18,
              color: ThemeColor.greyColor.shade400),
          SizedBox(height: 5),
          Text(
            '$name',
            style:
                TextStyle(fontSize: 12, color: ThemeColor.greyColor.shade400),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
      decoration: BoxDecoration(color: ThemeColor.homeScreenColor),
    ),
  );
}

Widget imageTextBTN2(
    {bool isOnline = false,
    Function()? onOnline,
    Function()? onOffline,
    String? image,
    String? name}) {
  return InkWell(
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
              height: 12,
              color: ThemeColor.greyColor.shade700),
          SizedBox(width: 8),
          Text(
            '$name',
            style:
                TextStyle(fontSize: 12, color: ThemeColor.greyColor.shade700),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 9),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: ThemeColor.amberColor.withOpacity(.5),
          border: Border.all(color: ThemeColor.amberColor)),
    ),
  );
}
