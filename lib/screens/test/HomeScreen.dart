import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';

class HomeScreen2 extends StatelessWidget {
  HomeScreen2({super.key});

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                      image: AssetImage('assets/icons/translater_icon.png'),
                      width: 30,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: InkWell(
                      onTap: () {},
                      child: Image(
                        image: AssetImage('assets/icons/wallate.png'),
                        width: 30,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Image(
                      image: AssetImage('assets/icons/notification_icon.png'),
                      width: 30,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 160),
                Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (controller.astrologersList.isEmpty) {
                    return const Center(child: Text("No astrologers found"));
                  }
                  return SizedBox(
                    height: 120,
                    child: StoryGridScreen(user: controller.astrologersList),
                  );
                }),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      cart(image: 'assets/images/Kundil.png', name: 'Kundil'),
                      cart(image: 'assets/images/match.png', name: 'Match'),
                      cart(
                          image: 'assets/images/Horoscope.png',
                          name: 'Horoscope'),
                    ],
                  ),
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        'Astro Services',
                        style: TextStyle(
                            fontSize: 16.5, fontWeight: FontWeight.bold),
                      ),
                    )),
                Container(
                  height: Get.size.height * .16,
                  width: Get.size.width * .95,
                  margin: EdgeInsets.all(15),
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
                      icons(image: 'assets/icons/call_icon.png', name: 'Call'),
                      icons(image: 'assets/icons/chat_icon.png', name: 'Chat'),
                      icons(
                          image: 'assets/icons/person-call-16-filled.png',
                          name: 'Video'),
                      icons(
                          image: 'assets/icons/live_icon.png',
                          name: 'Live Astro'),
                    ],
                  ),
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        'Recommended Astrologers',
                        style: TextStyle(
                            fontSize: 16.5, fontWeight: FontWeight.bold),
                      ),
                    )),
                SizedBox(
                  height: Get.size.height * .28,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.astrologersList.length,
                    itemBuilder: (context, index) {
                      final astrologer = controller.astrologersList[index];
                      return userCard(
                          image: controller.usermage,
                          name: astrologer.name,
                          cost: astrologer.videoCallRate,
                          rating: astrologer.rating);
                    },
                  ),
                ),
                Container(
                  height: Get.size.height * .29,
                  width: Get.size.width,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Color(0xFFF2DAC4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          spreadRadius: 2,
                          blurRadius: 5,
                        ),
                      ],
                      gradient: LinearGradient(colors: [
                        Color(0xFFC12C32),
                        Color(0xFF350103),
                      ])),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Kundli',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: Text(
                            'Kundli is the term used for Birth Chart in Vedic Astrology. Twelve houses of Kundli show ascendant and planet position in various zodiac signs at the time of birth as seen from the place of birth.',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                          )),
                          Container(
                            width: Get.size.width * .4,
                            height: Get.size.height * .16,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/sawstik.png'))),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 30,
                          width: 90,
                          margin: EdgeInsets.only(top: 12),
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text(
                              'Check',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 50)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget icons({image, name}) {
  return InkWell(
    onTap: () {
      // Get.to(() => HomeScreen22());
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

Widget userCard({image, name, rating, cost}) {
  return InkWell(
    onTap: () {
      // Get.to(() => HomeScreen22());
    },
    child: Container(
      height: Get.size.height * .25,
      width: Get.size.width * .35,
      margin: EdgeInsets.all(15),
      padding: const EdgeInsets.all(10),
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
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(image),
                maxRadius: 40,
              ),
              Positioned(
                  bottom: 0,
                  left: Get.size.width * .05,
                  child: Container(
                    padding: EdgeInsets.only(right: 8, left: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          spreadRadius: 2,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Text('⭐ $rating'),
                  ))
            ],
          ),
          Spacer(),
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  cost.toString().isNotEmpty ? '₹ $cost/min' : '₹ 00.00/min',
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
          Spacer(),
          ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.blueAccent)),
              child: Text(
                'Connect',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    ),
  );
}

Widget cart({image, name}) {
  return InkWell(
    onTap: () {
      // Get.to(() => HomeScreen22());
    },
    child: Container(
      height: Get.size.height * .22,
      width: Get.size.width * .42,
      margin: EdgeInsets.all(15),
      padding: const EdgeInsets.all(20),
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
      child: Column(
        children: [
          Container(
            height: 110,
            width: 140,
            decoration: BoxDecoration(
                // color: Colors.green,
                image: DecorationImage(
                    fit: BoxFit.contain, image: AssetImage(image))),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          )
        ],
      ),
    ),
  );
}





class StoryGridScreen extends StatelessWidget {
  final List<Astrologer> user;

  const StoryGridScreen({super.key, required this.user});

  final String defaultImage =
      'https://media.istockphoto.com/id/1437816897/photo/business-woman-manager-or-human-resources-portrait-for-career-success-company-we-are-hiring.jpg?s=612x612&w=0&k=20&c=tyLvtzutRh22j9GqSGI33Z4HpIwv9vL_MZw_xOE19NQ=';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: user.length,
        itemBuilder: (context, index) {
          final astrologer = user[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.pink,
                  child: CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(
                        astrologer.profileImage?.isNotEmpty == true
                            ? astrologer.profileImage!
                            : defaultImage),
                  ),
                ),
                SizedBox(height: 5),
                Text(astrologer.name.toString(), style: TextStyle(fontSize: 12)),
              ],
            ),
          );
        },
      ),
    );
  }
}
