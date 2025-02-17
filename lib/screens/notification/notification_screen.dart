// import 'package:new_astro/utils/color_resource.dart';
// import 'package:flutter/material.dart';
//
// class NotificationScreen extends StatelessWidget {
//   final List<Map<String, String>> notifications = [
//     {
//       'title': 'Astro',
//       'image': 'assets/icon/astro.png',
//       'details': 'Please update to the latest version for new features and bug fixes.',
//     },
//     {
//       'title': 'Event',
//       'image': 'assets/icon/ticket.png',
//       'details': 'Please update to the latest version for new features and bug fixes.',
//     },
//     {
//       'title': 'Roommate',
//       'image': 'assets/icon/room mates.png',
//       'details': 'Please update to the latest version for new features and bug fixes.',
//     },
//     {
//       'title': 'Rentals',
//       'image': 'assets/icon/rentals.png',
//       'details': 'Please update to the latest version for new features and bug fixes.',
//     },
//     {
//       'title': 'Care Services',
//       'image': 'assets/icon/care services.png',
//       'details': 'Please update to the latest version for new features and bug fixes.',
//     },
//     {
//       'title': 'IT training & Placement',
//       'image': 'assets/icon/it services.png',
//       'details': 'Please update to the latest version for new features and bug fixes.',
//     },
//     {
//       'title': 'Jobs',
//       'image': 'assets/icon/job services.png',
//       'details': 'Please update to the latest version for new features and bug fixes.',
//     },
//     {
//       'title': 'Local Biz & Services',
//       'image': 'assets/icon/care services (1).png',
//       'details': 'Please update to the latest version for new features and bug fixes.',
//     },
//
//     // Add more notifications here
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Notifications'),
//         backgroundColor: ColorResources.primaryColor,
//       ),
//       body: ListView.builder(
//         itemCount: notifications.length,
//         itemBuilder: (context, index) {
//           final notification = notifications[index];
//           return Column(
//             children: [
//               ExpansionTile(
//                 leading: CircleAvatar(
//                     backgroundColor:  ColorResources.primaryColor.withOpacity(0.5),
//                     backgroundImage: AssetImage(notification['image']!),),
//                 title: Text(notification['title']!),
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Text(notification['details']!),
//                   ),
//                 ],
//                 onExpansionChanged: (isExpanded) {
//                   // Optional: You can do something when the tile is expanded or collapsed
//                   if (isExpanded) {
//                     print('Tile expanded: ${notification['title']}');
//                   } else {
//                     print('Tile collapsed: ${notification['title']}');
//                   }
//                 },
//               ),
//               Divider(), // Divider between tiles
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: NotificationScreen(),
//   ));
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/custom_appbar.dart';

class NotificationController extends GetxController {
  var notifications = {
    'Astro': 1,
    'Events': 0,
    'Roommates': 2,
    'Rentals': 0,
    'Care Services': 0,
    'IT Training & Placement': 0,
    'Jobs': 0,
    'Local Biz & Services': 0,
  }.obs;
}

class NotificationScreen extends StatelessWidget {
  final NotificationController controller = Get.put(NotificationController());

  final List<Map<String, dynamic>> categories = [
    {'title': 'Astro', 'icon': Icons.star},
    {'title': 'Events', 'icon': Icons.event},
    {'title': 'Roommates', 'icon': Icons.chat},
    {'title': 'Rentals', 'icon': Icons.home},
    {'title': 'Care Services', 'icon': Icons.healing},
    {'title': 'IT Training & Placement', 'icon': Icons.computer},
    {'title': 'Jobs', 'icon': Icons.work},
    {'title': 'Local Biz & Services', 'icon': Icons.business},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: customAppBar(),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          var category = categories[index];
          return Obx(() => ExpansionTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  child: Icon(category['icon'], color: Colors.blueGrey),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(category['title']),
                    if (controller.notifications[category['title']]! > 0)
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.red,
                        child: Text(
                          controller.notifications[category['title']]
                              .toString(),
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ),
                  ],
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('${category['title']} details go here...'),
                  ),
                ],
              ));
        },
      ),
    );
  }
}
