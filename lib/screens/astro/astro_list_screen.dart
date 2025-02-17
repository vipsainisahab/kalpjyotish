import 'package:flutter/material.dart';

import '../../utils/color_resource.dart';
import '../../widgets/custom_text.dart';
import 'astro_profile.dart';

class AstrologerListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Astrologers',
          color: ColorResources.buttonTextColor,
        ),
        backgroundColor: ColorResources.primaryColor,
      ),
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
                  _buildFilterChip('Career'),
                  _buildFilterChip('English'),
                  _buildFilterChip('Online'),
                  _buildFilterChip('High to Low'),
                  _buildFilterChip('Low to High'),
                ],
              ),
            ),
          ),
          // Astrologer Cards
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                bool isOnline =
                    index % 2 == 0; // Alternate online/offline status
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AstroProfileScreen(),));
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
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),

                                        child: Image.asset(
                                          'assets/images/horoscop.png',
                                          width: double.infinity,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 4),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(Icons.star,
                                                color: Colors.white, size: 14),
                                            SizedBox(width: 4),
                                            Text('4.5',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12)),
                                          ],
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
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Astrologer Name',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Icon(Icons.more_vert, color: Colors.grey),
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                          'Specialized in: Vedic Astrology, Tarot Reading',
                                          style: TextStyle(
                                              fontSize: 12, color: Colors.grey)),
                                      SizedBox(height: 4),
                                      Text('Languages: English, Hindi',
                                          style: TextStyle(
                                              fontSize: 12, color: Colors.grey)),
                                      SizedBox(height: 4),
                                      Text('Experience: 5 Years',
                                          style: TextStyle(
                                              fontSize: 12, color: Colors.grey)),
                                      SizedBox(height: 4),
                                      Text('Fee: ₹500/session',
                                          style: TextStyle(
                                              fontSize: 12, color: Colors.grey)),
                                      SizedBox(height: 8),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.circle,
                                            color:
                                                isOnline ? Colors.green : Colors.red,
                                            size: 12,
                                          ),
                                          SizedBox(width: 4),
                                          Text(
                                            isOnline ? 'Online' : 'Offline',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: isOnline
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
                                  onPressed: isOnline ? () {} : null,
                                  icon: Icon(Icons.chat, size: 16,color: isOnline ? Colors.green : Colors.red),
                                  label: Text('Chat', style: TextStyle(fontSize: 12,color: isOnline ? Colors.green : Colors.red)),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                    elevation: 4,
                                  ),
                                ),
                                SizedBox(width: 8),
                                ElevatedButton.icon(
                                  onPressed: isOnline ? () {} : null,
                                  icon: Icon(Icons.call, size: 16,color: isOnline ? Colors.green : Colors.red),
                                  label: Text('Call', style: TextStyle(fontSize: 12,color: isOnline ? Colors.green : Colors.red)),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                    elevation: 4,
                                  ),
                                ),
                                SizedBox(width: 8),
                                ElevatedButton.icon(
                                  onPressed: isOnline ? () {} : null,
                                  icon: Icon(Icons.videocam, size: 16,color: isOnline ? Colors.green : Colors.red),
                                  label: Text('Video', style: TextStyle(fontSize: 12,color: isOnline ? Colors.green : Colors.red)),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Chip(
        label: Text(label),
        elevation: 4,
        labelStyle: TextStyle(color: Colors.black),
      ),
    );
  }
}
