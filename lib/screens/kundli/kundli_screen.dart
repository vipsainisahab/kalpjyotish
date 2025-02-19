import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_astro/screens/kundli/controller.dart';
import 'package:new_astro/utils/theme_color.dart';
import 'package:new_astro/utils/custom_textfield.dart';
import 'package:new_astro/widgets/custom_appbar.dart';

class KundliScreen extends StatelessWidget {
  final controller = Get.put(KundliController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.backgroundColor,
      appBar: customAppBar(tittle: 'Kundli', backButton: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              customTextField(
                  label: "Name",
                  hint: "Ajay Rawat",
                  txtController: controller.NameController),
              customTextField(
                  label: "Phone Number",
                  hint: "+91 1234567890",
                  isNumber: true,
                  txtController: controller.numberController),
              customTextField(
                  label: "Date of Month",
                  hint: "Month",
                  txtController: controller.dateOfMonthController),
              customTextField(label: "Date of Birth", hint: "10-02-2004"),
              Obx(() => Row(
                    children: [
                      Text("Gender:",
                          style: TextStyle(color: ThemeColor.textHintColor)),
                      Radio(
                          value: "Male",
                          groupValue: controller.selectedType.value,
                          onChanged: (value) =>
                              controller.selectedType.value = value.toString(),
                          activeColor: ThemeColor.redColor),
                      Text(
                        "Male",
                        style: TextStyle(
                            color: controller.selectedType.value != 'Male'
                                ? ThemeColor.textHintColor
                                : ThemeColor.blackColor),
                      ),
                      SizedBox(width: 20),
                      Radio(
                          value: "Female",
                          groupValue: controller.selectedType.value,
                          onChanged: (value) =>
                              controller.selectedType.value = value.toString(),
                          activeColor: ThemeColor.redColor),
                      Text(
                        "Female",
                        style: TextStyle(
                            color: controller.selectedType.value != 'Female'
                                ? ThemeColor.textHintColor
                                : ThemeColor.blackColor),
                      ),
                    ],
                  )),
              customTextField(
                  label: "Location",
                  hint: "City, State, Country",
                  txtController: controller.addressBoxController),
              customTextField(
                  label: "Hrs",
                  hint: "",
                  isNumber: true,
                  txtController: controller.hrsController),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  Get.snackbar('Failed', 'Disable for now',
                      backgroundColor: ThemeColor.warningColor,
                      colorText: ThemeColor.buttonTextColor);
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 100),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                      color: ThemeColor.warningColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Text("Check",
                      style: TextStyle(
                          color: ThemeColor.blackColor, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
