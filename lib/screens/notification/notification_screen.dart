import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/color_resource.dart';
import '../../widgets/custom_appbar.dart';
import 'controller.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  final controller = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(tittle: 'Notification'),
      body: Column(
        children: [
          SizedBox(height: 20),
          Expanded(
            child: Obx(() => ListView.builder(
                  itemCount: controller.categories.length,
                  itemBuilder: (context, index) {
                    var category = controller.categories[index];
                    return ExpansionTile(
                      leading: CircleAvatar(
                        backgroundColor:
                            ThemeColor.primaryColor.withOpacity(.2),
                        child: Icon(category['icon'],
                            color: ThemeColor.primaryColor),
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
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                            ),
                        ],
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child:
                              Text('${category['title']} details go here...'),
                        ),
                      ],
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }
}
