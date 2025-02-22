import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_astro/model/astrologer.dart';
import 'package:new_astro/widgets/custom_appbar.dart';
import 'package:new_astro/widgets/image_text_icon.dart';
import '../../../utils/theme_color.dart';
import '../astro_profile/astro_profile.dart';
import 'controller.dart';

class AstrologerListScreen extends StatelessWidget {
  final controller = Get.put(AstroListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.homeScreenColor,
      appBar: customAppBar(tittle: 'Astrologers', backButton: true),
      body: Column(
        children: [
          // Filter List
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterChip('Career', controller),
                  _buildFilterChip('English', controller),
                  _buildFilterChip('Online', controller),
                  _buildFilterChip('High to Low', controller),
                  _buildFilterChip('Low to High', controller),
                ],
              ),
            ),
          ),

          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: controller.astrologers.length,
                itemBuilder: (context, index) {
                  var astrologer = controller.astrologers[index];
                  return Column(
                    children: [
                      _userCard(astrologer),
                      DottedBorder(
                        dashPattern: [4,4],
                        customPath: (size) {
                          return Path()
                            ..moveTo(0, 0)
                            ..lineTo(size.width, 0);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 0),
                          child: Container(),
                        ),
                      )
                    ],
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, AstroListController controller) {
    return Obx(() {
      bool isSelected = controller.selectedFilters.contains(label);
      return GestureDetector(
        onTap: () => controller.toggleFilter(label),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          margin: EdgeInsets.only(left: 8, bottom: 10, top: 10),
          decoration: BoxDecoration(
            color:
                isSelected ? ThemeColor.blueColor : ThemeColor.backgroundColor,
            borderRadius: BorderRadius.circular(50),
            // border: Border.all(color: ThemeColor.blackColor.withOpacity(.6)),
            boxShadow: [
              BoxShadow(
                color: ThemeColor.greyColor.withOpacity(.5),
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Text(
            label,
            style: TextStyle(
              fontFamily: 'Roboto_thin',
                fontWeight: FontWeight.w600,
                color: isSelected
                    ? ThemeColor.textWhiteColor
                    : ThemeColor.blackColor.withOpacity(.6)),
          ),
        ),
      );
    });
  }

  Widget _buildBTN(Astrologer astrologer) {
    return Row(
      children: [
        imageTextBTN(
            image: 'assets/icon/chat.png',
            name: 'Chat',
            isOnline: astrologer.isOnline),
        Spacer(),
        imageTextBTN(
            image: 'assets/icon/call.png',
            name: 'Call',
            isOnline: astrologer.isOnline),
        Spacer(),
        imageTextBTN(
            image: 'assets/icon/video_call.png',
            name: 'Video Call',
            isOnline: astrologer.isOnline),
      ],
    );
  }

  Widget _userCard(Astrologer astrologer) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: GestureDetector(
        onTap: () {
          Get.to(() => AstroProfileScreen(astrologer: astrologer));
        },
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 3,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.network(
                              astrologer.image,
                              height: Get.size.height * .18,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        // Details Section
                        Expanded(
                          flex: 7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(astrologer.name,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                  Icon(Icons.verified,
                                      size: 20, color: Color(0xFF156411)),
                                ],
                              ),
                              SizedBox(height: 8),
                              _userTextDetails(
                                  text: astrologer.specialization,
                                  image: 'assets/icon/reading_icon.png'),
                              _userTextDetails(
                                  text: astrologer.languages,
                                  image: 'assets/icon/language.png'),
                              _userTextDetails(
                                  text: astrologer.experience,
                                  image: 'assets/icon/expert.png'),
                              _userTextDetails(
                                  text: astrologer.fee,
                                  image: 'assets/icon/rupy_icon.png',
                                  isOnline: astrologer.isOnline),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 0,
                      // top: 50,
                      left: Get.size.width * .05,
                      child: Container(
                        decoration: BoxDecoration(
                          color: ThemeColor.textWhiteColor,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: ThemeColor.greyColor.shade300,
                              blurRadius: 2,
                              spreadRadius: 2,
                              offset: Offset(1, 2),
                            )
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.star,
                                color: ThemeColor.amberColor, size: 14),
                            SizedBox(width: 4),
                            Text('${astrologer.rating}',
                                style: TextStyle(
                                    color: ThemeColor.greyColor.shade700,
                                    fontSize: 12)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                _buildBTN(astrologer),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _userTextDetails({String? text, String? image, bool? isOnline}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(children: [
        Container(
          height: 18,
          width: 18,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('$image'))),
        ),
        SizedBox(width: 5),
        Expanded(
            child: Text("$text",
                style: TextStyle(fontSize: 11, color: ThemeColor.greyColor))),
        if (isOnline != null)
          Padding(
            padding: const EdgeInsets.only(right: 65),
            child: Text(isOnline ? 'Online' : 'Offline',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: isOnline ? ThemeColor.astroGreen : ThemeColor.redColor,
                )),
          ),
      ]),
    );
  }
}
