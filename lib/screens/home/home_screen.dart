import 'package:get/get.dart';
import 'package:new_astro/utils/color_resource.dart';
import 'package:new_astro/widgets/custom_btn.dart';
import 'package:new_astro/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import '../astro/astro_list_screen.dart';
import '../kundli/kundli_screen.dart';
import '../notification/notification_screen.dart';
import '../test/HomeScreen.dart';

class AstroHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(100),
      //   child: Stack(
      //     clipBehavior: Clip.none, // Allows positioning outside the AppBar bounds
      //     children: [
      //       AppBar(
      //         automaticallyImplyLeading: false,
      //         flexibleSpace: Container(
      //         ),
      //         actions: [
      //           IconButton(
      //             icon: Icon(
      //               Icons.language,
      //               color: ColorResources.primaryColor,
      //             ),
      //             onPressed: () {
      //               Get.to(()=>HomeScreen2());
      //             },
      //           ),
      //           IconButton(
      //             icon: Icon(
      //               Icons.wallet,
      //               color: ColorResources.primaryColor,
      //             ),
      //             onPressed: () {},
      //           ),
      //           IconButton(
      //             icon: Icon(
      //               Icons.notifications_none,
      //               color: ColorResources.primaryColor,
      //             ),
      //             onPressed: () {
      //               Navigator.push(
      //                 context,
      //                 MaterialPageRoute(builder: (context) => NotificationScreen()),
      //               );
      //             },
      //           ),
      //         ],
      //       ),
      //
      //       // Positioned circle
      //       Positioned(
      //         top: -50,
      //         left: -50,
      //         child: Container(
      //           width: 200,
      //           height: 200,
      //           padding: EdgeInsets.only(left: 20),
      //           decoration: BoxDecoration(
      //             shape: BoxShape.circle,
      //             gradient: LinearGradient(
      //               colors: [
      //                 Color(0xFFEC868A),
      //               Color(0xFFF8BD02),
      //
      //               ],
      //               begin: Alignment.topLeft,
      //               end: Alignment.bottomRight,
      //             ),
      //           ),
      //         ),
      //       ),
      //       Positioned(
      //         top:70,
      //           left: 10,
      //           child:
      //           Column(
      //             mainAxisAlignment: MainAxisAlignment.end,
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               Text(
      //                 'Kalpjyotish',
      //                 style: TextStyle(
      //                     color: ColorResources.buttonTextColor,
      //                     fontSize: 24,
      //                     fontWeight: FontWeight.bold),
      //               ),
      //               Text(
      //                 'Connect with the best astrologers',
      //                 style: TextStyle(color: Colors.black, fontSize: 16),
      //               ),
      //             ],
      //           ),
      //
      //       ),
      //     ],
      //   ),
      // ),

      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Row(
                children: [
                  Container(
                    width: Get.size.width * .6,
                    height: 200,
                    decoration: const BoxDecoration(
                      // color: Colors.red,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/home_vector.png'),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 50),
                          Text(
                            'Hello User,',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Welcome to\nAstro',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Image(
                      image: AssetImage('assets/icon/translater_icon.png'),
                      width: 30,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: InkWell(
                      onTap: () {},
                      child: Image(
                        image: AssetImage('assets/icon/wallate.png'),
                        width: 30,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Image(
                      image: AssetImage('assets/icon/notification_icon.png'),
                      width: 30,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 160),
                  // Astro Profile with Border and "Live" Indicator
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(5, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  CircleAvatar(
                                    radius: 35,
                                    backgroundColor:
                                        ColorResources.primaryColor,
                                    child: CircleAvatar(
                                      radius: 33,
                                      backgroundImage: AssetImage(
                                          'assets/astro$index.jpg'), // Replace with real image
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 15,
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 2),
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Text(
                                            'Live',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'Name',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),

                  // Kundli, Match, Horoscope Cards
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => KundliScreen(),
                                ));
                          },
                          child:
                              _buildCard('Kundli', 'assets/images/kundli.png')),
                      _buildCard('Match', 'assets/images/match.png'),
                      _buildCard('Horoscope', 'assets/images/horoscop.png'),
                    ],
                  ),

                  // Astro Services
                  SizedBox(height: 20),
                  Text(
                    'Astro Services',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildServiceCard("assets/images/call.png", 'Call'),
                      _buildServiceCard("assets/images/chat.png", 'Chat'),
                      _buildServiceCard("assets/images/video.png", 'Video'),
                      _buildServiceCard(
                          "assets/images/stream.png", 'Live Astro'),
                    ],
                  ),

                  // Recommended Astrologers with Horizontal Scroll
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recommended Astrologers',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AstrologerListScreen(),
                                ));
                          },
                          child: Text(
                            'View All',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.normal),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: EdgeInsets.only(right: 10, bottom: 4),
                          elevation: 4,
                          child: Container(
                            width: 120,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Stack(
                                  children: [
                                    CircleAvatar(
                                      radius: 35,
                                      backgroundColor:
                                          ColorResources.primaryColor,
                                      child: CircleAvatar(
                                        radius: 33,
                                        backgroundImage: AssetImage(
                                            'assets/astro$index.jpg'), // Replace with real image
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 15,
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 2),
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.star_border,
                                                  size: 12,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                                Text(
                                                  '5',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Astrologer ${index + 1}',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  '₹500/min',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                                SizedBox(height: 10),
                                CustomButton(
                                    height: 38,
                                    width: 100,
                                    text: 'Connect',
                                    onPressed: () {}),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  // Advertisement Container
                  SizedBox(height: 20),
                  Container(
                    height: 200,
                    width: double.infinity,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: LinearGradient(
                          colors: [
                            ColorResources.primaryColor,
                            ColorResources.primaryColor,
                            ColorResources.primaryColor,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        image: DecorationImage(
                            image: AssetImage("assets/images/Frame 2.png"),
                            fit: BoxFit.fill)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // CustomText(text: "Kundli",fontSize: 16,fontWeight: FontWeight.bold,),
                        // Center(
                        //   child: Text(
                        //     'Kundli is the term used for Birth Chart in Vedic Astrology. Twelve houses of Kundli show ascendant and planet position in various zodiac signs at the time of birth as seen from the place of birth.',
                        //     style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                        //   ),
                        // ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),
                  Text(
                    'Are you worried about your business ?',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Our astrolgers are there to Guide/ help you',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: EdgeInsets.only(right: 10, bottom: 4),
                          elevation: 4,
                          child: Container(
                            width: 120,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Stack(
                                  children: [
                                    Image.asset(
                                        height: 100,
                                        'assets/images/horoscop.png'),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Astrologer ${index + 1}',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  '₹500/min',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  // Planetary Transit with Row Layout
                  SizedBox(height: 20),
                  Text(
                    'Planetary Transit',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Column(
                    children: List.generate(3, (index) {
                      return Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(vertical: 20),
                        // Add margin between cards
                        child: Stack(
                          clipBehavior: Clip.none,
                          // Allows the image to overflow the card boundaries
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: ColorResources.primaryColor
                                      .withOpacity(0.5)),
                              padding: EdgeInsets.all(16),
                              // Adjust padding inside the card
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: 20),
                                  // Space for the image above the card
                                  Text(
                                    'Transit Event ${index + 1}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Details about the transit event.',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white.withOpacity(0.8),
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text('View All',
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: -20,
                              // Adjust to move image partially outside the card
                              left: 16,
                              // Align image to the left edge of the card
                              child: ClipOval(
                                child: Container(
                                  color: Colors.white,
                                  // Optional background color for the image
                                  child: Image.asset(
                                    'assets/images/Planet.png',
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String title, String imagePath) {
    return Card(
      elevation: 5,
      child: Container(
        width: 100,
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, height: 60, fit: BoxFit.cover),
            SizedBox(height: 8),
            Text(title,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCard(String icon, String title) {
    return Column(
      children: [
        Card(
          elevation: 3,
          child: Container(
            width: 60,
            height: 60,
            child: Center(
              child: Image.asset(icon),
            ),
          ),
        ),
        Text(title, style: TextStyle(fontSize: 14)),
      ],
    );
  }
}
