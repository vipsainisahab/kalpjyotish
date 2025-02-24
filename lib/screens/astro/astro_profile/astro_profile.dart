import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:new_astro/model/astrologer.dart';
import 'package:new_astro/screens/astro/astro_profile/controller.dart';
import 'package:new_astro/screens/test/test.dart';
import 'package:new_astro/utils/theme_color.dart';
import 'package:new_astro/widgets/custom_appbar.dart';
import 'package:new_astro/widgets/image_text_icon.dart';

class AstroProfileScreen extends StatelessWidget {
  final Astrologer astrologer;

  AstroProfileScreen({required this.astrologer});

  final controller = Get.put(AstroProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.homeScreenColor,
      appBar: customAppBar(tittle: 'Astrologer Profile', backButton: true),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            _userCard(astrologer),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              child: DottedBorder(
                color: ThemeColor.aboutTextBorder,
                strokeWidth: 2,
                dashPattern: [5, 5],
                borderType: BorderType.RRect,
                radius: Radius.circular(10),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                    color: ThemeColor.aboutTextColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                          alignment: Alignment.center,
                          child: Text('About me',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold))),
                      SizedBox(height: 6),
                      Obx(() => Text(
                            astrologer.about,
                            style: TextStyle(
                                fontSize: 12.5,
                                color: ThemeColor.textSecondaryColor),
                            maxLines: controller.isExpanded.value ? null : 5,
                            overflow: controller.isExpanded.value
                                ? TextOverflow.visible
                                : TextOverflow.ellipsis,
                          )),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: InkWell(
                            onTap: controller.toggleExpanded,
                            child: Obx(() => Text(
                                controller.isExpanded.value
                                    ? 'See Less'
                                    : 'See More',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: ThemeColor.blackColor,
                                ))),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Card(
              color: ThemeColor.whiteColor,
              margin: EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  _buildRatingOverview(),
                  Obx(
                    () => SizedBox(
                      height: controller.isOpenAllReview.value
                          ? Get.size.height * .52
                          : Get.size.height * .31,
                      child: ListView.builder(
                        itemCount: controller.isOpenAllReview.value
                            ? controller.reviews.length
                            : 3,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final review = controller.reviews[index];
                          return _buildReviewTile(review);
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        controller.isOpenAllReview.value =
                            !controller.isOpenAllReview.value;
                      },
                      overlayColor: WidgetStateColor.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("See all reviews",
                              style: TextStyle(color: ThemeColor.astroGreen)),
                          SizedBox(width: 5),
                          Icon(Icons.arrow_forward,
                              color: ThemeColor.astroGreen),
                          SizedBox(width: 8),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            _buildReportBox(),
            SizedBox(height: 10),
            _similarAstro(),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _userCard(Astrologer astrologer) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: Get.size.height * .28,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
                child: Stack(
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
                              height: Get.size.height * .15,
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
                              _userTextDetails(text: astrologer.specialization),
                              _userTextDetails(text: astrologer.languages),
                              _userTextDetails(text: astrologer.experience),
                              _userTextDetails(
                                  text: astrologer.fee,
                                  isOnline: astrologer.isOnline),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 12,
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
              ),
              SizedBox(height: 6),
              Divider(color: ThemeColor.greyColor, height: 0),
              _buildBTN(astrologer),
            ],
          ),
          margin: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: ThemeColor.backgroundColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: ThemeColor.greyColor.shade500,
                blurRadius: 4,
                spreadRadius: 2,
                offset: Offset(1, 0),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _userTextDetails({String? text, bool? isOnline}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(children: [
        SizedBox(width: 5),
        Expanded(
            child: Text("$text",
                style: TextStyle(fontSize: 11, color: ThemeColor.greyColor))),
        if (isOnline != null)
          Container(
            margin: const EdgeInsets.only(right: 40),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: isOnline
                    ? ThemeColor.astroGreen.withOpacity(.3)
                    : ThemeColor.redColor.withOpacity(.3)),
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

  Widget _buildBTN(Astrologer astrologer) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          verticalImageTextBTN(
              image: 'assets/icon/chat.png',
              name: '60k mins',
              isOnline: astrologer.isOnline),
          Spacer(),
          SizedBox(
              height: 35,
              child: VerticalDivider(
                  color: ThemeColor.greyColor.shade400,
                  thickness: 1.5,
                  width: 10)),
          Spacer(),
          verticalImageTextBTN(
              image: 'assets/icon/call.png',
              name: '30k mins',
              isOnline: astrologer.isOnline),
          Spacer(),
          imageTextBTN2(
            image: 'assets/icon/video_call.png',
            name: 'Watch Intro',
            isOnline: astrologer.isOnline,
            onOnline: () {
              // Get.to(() => SuccessScreen());
            },
          ),
        ],
      ),
    );
  }

  // Rating Overview Widget
  Widget _buildRatingOverview() {
    final double width = Get.size.width;
    final double height = Get.size.height;
    return Obx(() => Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 12),
          child: Row(
            children: [
              Container(
                width: width * .35,
                height: height * .18,
                child: Column(
                  children: [
                    Text("Rating overview", style: TextStyle(fontSize: 15)),
                    SizedBox(height: 8),
                    Text(
                      "${controller.averageRating.value.toStringAsFixed(1)}",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        return Icon(Icons.star, color: Colors.amber, size: 18);
                      }),
                    ),
                    SizedBox(height: 4),
                    Text("${controller.totalRatings.value} Ratings",
                        style: TextStyle(color: Colors.grey, fontSize: 11)),
                  ],
                ),
              ),
              Spacer(),
              Container(
                width: width * .5,
                height: height * .18,
                child: Column(
                  children: controller.ratingCounts.entries.map((entry) {
                    return _buildRatingBar(entry.key, entry.value);
                  }).toList(),
                ),
              )
            ],
          ),
        ));
  }

  // Single Rating Bar
  Widget _buildRatingBar(int stars, int count) {
    int total = controller.totalRatings.value;
    double percentage = total > 0 ? (count / total) : 0.0;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1),
      child: Row(
        children: [
          Text("$stars"),
          SizedBox(width: 10),
          Expanded(
            child: LinearProgressIndicator(
              value: percentage,
              minHeight: 8,
              borderRadius: BorderRadius.circular(50),
              backgroundColor: Colors.grey[300],
              color: Colors.amber,
            ),
          ),
          // SizedBox(width: 8),
          // Text("$count"),
        ],
      ),
    );
  }

  // Single Review Tile
  Widget _buildReviewTile(Map<String, String> review) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Image
              CircleAvatar(
                  radius: 18, backgroundImage: NetworkImage(review['image']!)),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(review['user']!,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Row(
                      children:
                          List.generate(int.parse(review['rating']!), (index) {
                        return Icon(Icons.star, color: Colors.amber, size: 12);
                      }),
                    ),
                    SizedBox(height: 4),
                    Text(
                      review['review']!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider()
      ],
    );
  }

  Widget _buildReportBox() {
    return Container(
      height: Get.size.height * .28,
      margin: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
          color: ThemeColor.whiteColor,
          boxShadow: [
            BoxShadow(
              color: ThemeColor.greyColor.withOpacity(.5),
              blurRadius: 4,
              offset: Offset(0, 0),
            ),
          ],
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Container(
            height: 40,
            decoration: BoxDecoration(
              color: ThemeColor.deepPurple.withOpacity(.1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              border: Border(bottom: BorderSide(color: ThemeColor.deepPurple)),
            ),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ThemeColor.deepPurple.withOpacity(.2)),
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child:
                      Icon(Icons.paste, size: 20, color: ThemeColor.blue2Color),
                ),
                Text(
                  'Report',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                ),
                Spacer(),
                Text(
                  '₹2923 - ',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                ),
                Text(
                  '₹5547',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                ),
                SizedBox(width: 12)
              ],
            ),
          ),
          SizedBox(height: 8),
          _reportBoxText(text: 'Saturn Transit Report', price: '3566'),
          _reportBoxText(text: '1 Year Education Report', price: '3566'),
          _reportBoxText(
              text: '1 Year Professional (career) Report', price: '3566'),
          Spacer(),
          InkWell(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ThemeColor.deepPurple.withOpacity(.8)),
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 7),
              child: Text('View all',
                  style: TextStyle(color: ThemeColor.textWhiteColor)),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }

  Widget _reportBoxText({text, price}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      child: Row(
        children: [
          Text(
            '$text',
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
            decoration: BoxDecoration(
                border: Border.all(color: ThemeColor.primaryColor),
                borderRadius: BorderRadius.circular(8)),
            child: Text('₹$price', style: TextStyle(fontSize: 16)),
          )
        ],
      ),
    );
  }

  Widget _similarAstro() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      child: Container(
        height: Get.size.height * .35,
        width: Get.size.width * .95,
        padding: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
        decoration: BoxDecoration(
          color: Color(0xFFFFF2F0),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: ThemeColor.greyColor.withOpacity(.5),
              blurRadius: 4,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Check Similar Consultants',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xFFF6BCBC)),
                  padding: EdgeInsets.all(10),
                  child: Text('i',
                      style: TextStyle(
                          fontSize: 16, color: ThemeColor.blackColor)),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _similarAstroProfile(
                      image:
                          'https://images.unsplash.com/photo-1494790108377-be9c29b29330',
                      name: 'Acharya',
                      price: '40/min'),
                  _similarAstroProfile(
                      image:
                          'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e',
                      name: 'Dharmik',
                      price: '50/min'),
                  _similarAstroProfile(
                      image:
                          'https://images.unsplash.com/photo-1541823709867-1b206113eafd',
                      name: 'Sujoy sen',
                      price: '90/min'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _similarAstroProfile({image, name, price}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      child: Column(
        children: [
          Container(
            height: Get.size.height * .2,
            width: Get.size.width * .3,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(image: NetworkImage('$image'))),
            // child: ,
          ),
          SizedBox(height: 12),
          Text('$name',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),
          Text('₹$price'),
        ],
      ),
    );
  }
}
