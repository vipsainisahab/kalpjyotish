import 'package:flutter/material.dart';

import '../../utils/color_resource.dart';
import '../../widgets/custom_text.dart';

class AstroProfileScreen extends StatefulWidget {
  @override
  State<AstroProfileScreen> createState() => _AstroProfileScreenState();
}

class _AstroProfileScreenState extends State<AstroProfileScreen> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Astrologer Profile',
          color: ColorResources.buttonTextColor,
        ),
        backgroundColor: ColorResources.primaryColor,
      ),
      bottomNavigationBar: Container(
        height: 60,
        color: ColorResources.primaryColor,
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton.icon(
            onPressed:  () {} ,
            icon: Icon(Icons.chat, size: 16,color:   Colors.black ,),
            label: Text('Chat', style: TextStyle(fontSize: 12,color:   Colors.black ,)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              elevation: 4,
            ),
          ),
          SizedBox(width: 8),
          ElevatedButton.icon(
            onPressed:  () {} ,
            icon: Icon(Icons.call, size: 16,color:  Colors.black , ),
            label: Text('Call', style: TextStyle(fontSize: 12,color:   Colors.black ,)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              elevation: 4,
            ),
          ),
          SizedBox(width: 8),
          ElevatedButton.icon(
            onPressed:  () {} ,
            icon: Icon(Icons.videocam, size: 16,color:   Colors.black ),
            label: Text('Video', style: TextStyle(fontSize: 12,color:  Colors.black ,)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              elevation: 4,
            ),
          ),
        ],
      ),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AstroProfileScreen(),
                      ));
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
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {},
                              icon: Icon(
                                Icons.chat,
                                size: 16,
                                color: Colors.black,
                              ),
                              label: Text('Chat',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  )),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                elevation: 4,
                              ),
                            ),
                            SizedBox(width: 8),
                            ElevatedButton.icon(
                              onPressed: () {},
                              icon: Icon(
                                Icons.call,
                                size: 16,
                                color: Colors.black,
                              ),
                              label: Text('60k',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  )),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                elevation: 4,
                              ),
                            ),
                            SizedBox(width: 8),
                            ElevatedButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.videocam,
                                  size: 16, color: Colors.black),
                              label: Text('35k',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  )),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
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
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Heading
                      Text(
                        'About Us',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),

                      // Description text
                      Text(
                        _isExpanded
                            ? 'This astrologer specializes in Vedic Astrology and Tarot Reading. With over 5 years of experience, they provide detailed and accurate readings for various life aspects, including career, relationships, health, and personal growth. They also offer online consultations and have built a loyal following of clients who trust their insights.'
                            : 'This astrologer specializes in Vedic Astrology and Tarot Reading. With over 5 years of experience, they provide detailed and accurate readings...',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                        maxLines: _isExpanded
                            ? null
                            : 3, // Truncate text if not expanded
                        overflow: _isExpanded
                            ? TextOverflow.visible
                            : TextOverflow.ellipsis, // Handle overflow
                      ),
                      SizedBox(height: 8),

                      // "See More" button
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _isExpanded = !_isExpanded; // Toggle expanded state
                          });
                        },
                        child: Text(
                          _isExpanded ? 'See Less' : 'See More',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Average Rating
                      Row(
                        children: [
                          Text(
                            'Average Rating: ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '$averageRating/5',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),

                      // Rating Breakdown (5, 4, 3, 2, 1)
                      // Row(
                      //   children: ratingCounts.entries.map((entry) {
                      //     return Padding(
                      //       padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      //       child: Column(
                      //         children: [
                      //           Text(
                      //             '${entry.key}',
                      //             style: TextStyle(
                      //               fontSize: 14,
                      //               fontWeight: FontWeight.bold,
                      //             ),
                      //           ),
                      //           Text(
                      //             '${entry.value} reviews',
                      //             style: TextStyle(fontSize: 12, color: Colors.grey),
                      //           ),
                      //         ],
                      //       ),
                      //     );
                      //   }).toList(),
                      // ),
                      SizedBox(height: 8),

                      // Reviews List
                      Text(
                        'Reviews:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      ListView.builder(
                        shrinkWrap:
                            true, // Makes the ListView non-scrolling within a scrollable column
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: reviews.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              children: [
                                // Profile Image
                                CircleAvatar(
                                  radius: 20,
                                  backgroundImage: AssetImage(
                                      'assets/images/user_avatar.png'), // Replace with real image URL or asset
                                ),
                                SizedBox(width: 8),
                                // Review Details
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        reviews[index]['user']!,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.star,
                                              size: 14, color: Colors.orange),
                                          Text(
                                            ' ${reviews[index]['rating']} / 5',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        reviews[index]['review']!,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          // Action for "See More" (e.g., expand review)
                                        },
                                        child: Text(
                                          'See More',
                                          style: TextStyle(
                                              color: Colors.blue, fontSize: 12),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              CustomText(
                text: 'Similar Astrologer',
                color: Colors.black,
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
                                    height: 100, 'assets/images/horoscop.png'),
                              ],
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Astrologer ${index + 1}',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '₹500/min',
                              style: TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final double averageRating = 4.0; // Example average rating
  final Map<int, int> ratingCounts = {
    5: 50,
    4: 30,
    3: 10,
    2: 5,
    1: 2,
  };

  final List<Map<String, String>> reviews = [
    {
      'user': 'John Doe',
      'review': 'Excellent astrologer, highly recommended!',
      'rating': '5',
    },
    {
      'user': 'Jane Smith',
      'review': 'Very insightful and helpful, spot on predictions.',
      'rating': '4',
    },
    {
      'user': 'Mike Johnson',
      'review': 'Great session, gave me clarity on my career.',
      'rating': '5',
    },
    {
      'user': 'Emily Davis',
      'review': 'Good reading, but could be more specific.',
      'rating': '3',
    },
    // Add more reviews here
  ];
}
