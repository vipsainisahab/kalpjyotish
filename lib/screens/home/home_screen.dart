import 'package:get/get.dart';
import 'package:new_astro/utils/color_resource.dart';
import 'package:new_astro/widgets/custom_btn.dart';
import 'package:flutter/material.dart';
import '../astro/astro_list_screen.dart';
import '../kundli/kundli_screen.dart';
import 'controller.dart';

class AstroHomeScreen extends StatelessWidget {
  final controller = Get.put(tag: 'HomeController', HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.homeScreenColor,
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
                                    backgroundColor: ThemeColor.primaryColor,
                                    child: CircleAvatar(
                                      radius: 33,
                                      backgroundImage: NetworkImage(controller
                                          .image), // Replace with real image
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
                  Container(
                    height: Get.size.height * .16,
                    width: Get.size.width * .95,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color(0xFFF2DAC4),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          spreadRadius: 2,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildServiceCard(
                            image: 'assets/images/call.png', name: 'Call'),
                        _buildServiceCard(
                            image: 'assets/images/chat.png', name: 'Chat'),
                        _buildServiceCard(
                            image: 'assets/images/video.png', name: 'Video'),
                        _buildServiceCard(
                            image: 'assets/images/stream.png',
                            name: 'Live Astro')
                      ],
                    ),
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
                          color: ThemeColor.backgroundColor,
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
                                      backgroundColor: ThemeColor.primaryColor,
                                      child: CircleAvatar(
                                        radius: 33,
                                        backgroundImage: NetworkImage(controller
                                            .image), // Replace with real image
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
                            ThemeColor.primaryColor,
                            ThemeColor.primaryColor,
                            ThemeColor.primaryColor,
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
                                  color:
                                      ThemeColor.primaryColor.withOpacity(0.5)),
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
      color: ThemeColor.backgroundColor,
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

  Widget _buildServiceCard({image, name}) {
    return InkWell(
      onTap: () {
        // Get.to(() => HomeScreen2());
      },
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  spreadRadius: 2,
                  blurRadius: 5,
                ),
              ],
            ),
            padding: EdgeInsets.all(15),
            child: Image(image: AssetImage(image)),
          ),
          SizedBox(height: 12),
          Text(
            name.toString(),
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
