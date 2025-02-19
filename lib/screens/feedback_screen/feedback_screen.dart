import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_astro/screens/feedback_screen/controller.dart';
import 'package:new_astro/utils/theme_color.dart';
import 'package:new_astro/utils/custom_textfield.dart';
import 'package:new_astro/widgets/custom_appbar.dart';

class FeedbackScreen extends StatelessWidget {
  final controller = Get.put(FeedbackController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.backgroundColor,
      appBar: customAppBar(tittle: 'Feedback & Support', backButton: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text("Type", style: TextStyle(fontWeight: FontWeight.bold)),
              Obx(() => Row(
                    children: [
                      Radio(
                          value: "Contact Support",
                          groupValue: controller.selectedType.value,
                          onChanged: (value) =>
                              controller.selectedType.value = value.toString(),
                          activeColor: ThemeColor.redColor),
                      Text("Contact Support"),
                      SizedBox(width: 20),
                      Radio(
                          value: "Feedback",
                          groupValue: controller.selectedType.value,
                          onChanged: (value) =>
                              controller.selectedType.value = value.toString(),
                          activeColor: ThemeColor.redColor),
                      Text("Feedback"),
                    ],
                  )),
              SizedBox(height: 10),
              customTextField(
                  label: "Email",
                  hint: "Enter your email id",
                  txtController: controller.emailController),
              customTextField(
                  label: "Contact Number",
                  hint: "Enter your contact number",
                  txtController: controller.contactNumberController),
              if (controller.selectedType.value == 'Contact Support')
                Obx(() {
                  if (controller.selectedType.value == 'Contact Support') {
                    return customTextField(
                        label: "Subject",
                        hint: "Message subject",
                        txtController: controller.subjectController);
                  } else {
                    return SizedBox.shrink(); // Hide when not needed
                  }
                }),
              customTextField(
                  label: "Issue Type",
                  hint: "Select option",
                  isDropDown: true,
                  onSelect: (value) =>
                      controller.selectedIssueType.value = value),
              customTextField(
                  label: "Suggestion Box",
                  hint: "How can we help you today?",
                  maxLines: 6,
                  txtController: controller.suggestionBoxController),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  print(
                      "Feedback Submitted: ${controller.emailController.text}");
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 100),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                      color: ThemeColor.warningColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Text("Send Message",
                      style: TextStyle(color: ThemeColor.lightBlackColor.withOpacity(.4))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
