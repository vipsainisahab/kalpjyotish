import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_astro/widgets/custom_appbar.dart';
import '../../utils/color_resource.dart';
import 'astro_profile.dart';
import 'controller.dart';

class AstrologerListScreen extends StatelessWidget {
  final controller = Get.put(AstrologerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.homeScreenColor,
      appBar: customAppBar(tittle: 'Astrologers', backButton: true),
      body: Column(
        children: [
          // Filter List
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
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
          // Astrologer Cards
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: controller.astrologers.length,
                itemBuilder: (context, index) {
                  var astrologer = controller.astrologers[index];
                  return Padding(
                    padding: EdgeInsets.all(5),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => AstroProfileScreen());
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  // Image Section
                                  Expanded(
                                    flex: 3,
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Image.network(
                                            controller.image,
                                            width: double.infinity,
                                            height: Get.size.height * .18,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 0,
                                          // top: 50,
                                          left: Get.size.width * .05,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 4),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(Icons.star,
                                                    color: Colors.orange,
                                                    size: 14),
                                                SizedBox(width: 4),
                                                Text('${astrologer.rating}',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  // Details Section
                                  Expanded(
                                    flex: 7,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(astrologer.name,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Icon(Icons.verified,
                                                color: Colors.green),
                                          ],
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                            'Specialized in: ${astrologer.specialization}',
                                            style: TextStyle(
                                                fontSize: 11,
                                                color: Colors.grey)),
                                        SizedBox(height: 4),
                                        Text(
                                            'Languages: ${astrologer.languages}',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey)),
                                        SizedBox(height: 4),
                                        Text(
                                            'Experience: ${astrologer.experience}',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey)),
                                        SizedBox(height: 4),
                                        Text('Fee: ${astrologer.fee}',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey)),
                                        SizedBox(height: 8),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.circle,
                                              color: astrologer.isOnline
                                                  ? Colors.green
                                                  : Colors.red,
                                              size: 12,
                                            ),
                                            SizedBox(width: 4),
                                            Text(
                                              astrologer.isOnline
                                                  ? 'Online'
                                                  : 'Offline',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: astrologer.isOnline
                                                    ? Colors.green
                                                    : Colors.red,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 8),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  ElevatedButton.icon(
                                    onPressed:
                                        astrologer.isOnline ? () {} : null,
                                    icon: Icon(Icons.chat,
                                        size: 16,
                                        color: astrologer.isOnline
                                            ? ThemeColor.astroGreen
                                            : Colors.red),
                                    label: Text('Chat',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: astrologer.isOnline
                                                ? ThemeColor.astroGreen
                                                : Colors.red)),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      elevation: 4,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  ElevatedButton.icon(
                                    onPressed:
                                        astrologer.isOnline ? () {} : null,
                                    icon: Icon(Icons.call,
                                        size: 16,
                                        color: astrologer.isOnline
                                            ? ThemeColor.astroGreen
                                            : Colors.red),
                                    label: Text('Call',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: astrologer.isOnline
                                                ? ThemeColor.astroGreen
                                                : Colors.red)),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      elevation: 4,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  ElevatedButton.icon(
                                    onPressed:
                                        astrologer.isOnline ? () {} : null,
                                    icon: Icon(Icons.videocam,
                                        size: 16,
                                        color: astrologer.isOnline
                                            ? ThemeColor.astroGreen
                                            : Colors.red),
                                    label: Text('Video',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: astrologer.isOnline
                                                ? ThemeColor.astroGreen
                                                : Colors.red)),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      elevation: 4,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, AstrologerController controller) {
    return Obx(() {
      bool isSelected = controller.selectedFilters.contains(label);
      return GestureDetector(
        onTap: () => controller.toggleFilter(label),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          margin: EdgeInsets.only(left: 8, bottom: 10, top: 10),
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue : ThemeColor.backgroundColor,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: Colors.black12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 4,
                offset: Offset(3, 3),
              ),
            ],
          ),
          child: Text(
            label,
            style: TextStyle(color: isSelected ? Colors.white : Colors.black),
          ),
        ),
      );
    });
  }
}
