import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_astro/screens/test/test.dart';
import 'package:new_astro/utils/helper.dart';

import '../../utils/theme_color.dart';
import '../../widgets/custom_btn.dart';
import '../../widgets/custom_text_form_field.dart';
import '../feedback_screen/feedback_screen.dart';
import 'controller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final controller = Get.put(tag: 'ProfileController', ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE63946),
      body: Obx(
            () => SingleChildScrollView(
            child: Stack(
              children: [
                Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      width: 150,
                      height: 154,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/images/login_top.png'))),
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    SizedBox(height: Get.size.height * .24),
                    // Login Form
                    Container(
                      height: Get.size.height * .8,
                      width: Get.size.height * .9,
                      padding: const EdgeInsets.only(top: 12),
                      decoration: const BoxDecoration(
                        color: ThemeColor.textWhiteColor, // Red background
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Show content based on the boolean value
                          controller.showPersonalDetails.value
                              ? _buildPersonalDetailsForm()
                              : _buildSettingsSection(),

                          SizedBox(height: 12),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomButton(
                              text: "Logout",
                              onPressed: () {},
                              backgroundColor: ThemeColor.primaryColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                    top: Get.size.height * .16,
                    left: Get.size.width * .05,
                    child: Container(
                      width: 320,
                      height: 154,
                      decoration: BoxDecoration(
                        color: ThemeColor.textWhiteColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: ThemeColor.lightBlackColor.withOpacity(.4),
                            blurRadius: 10,
                            spreadRadius: 2,
                            offset: Offset(4, 4),
                          )
                        ],
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 25),
                                  Text(
                                    'User Name',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image(
                                        image: AssetImage(
                                            'assets/icon/cell_phone_icon.png'),
                                        width: 15,
                                        color: ThemeColor.primaryColor,
                                      ),
                                      Text(
                                        '1234567890',
                                        style: TextStyle(
                                            fontSize: 13, color: ThemeColor.lightBlackColor),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Positioned(
                              bottom: 0,
                              child: Row(
                                children: [
                                  Image(
                                      image: AssetImage(
                                          'assets/images/profile_user_vector.png')),
                                  SizedBox(width: 10),
                                  InkWell(
                                    onTap: () {
                                      controller.showPersonalDetails.toggle();
                                    },
                                    child: Text(
                                      'Personal Info',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(width: 90),
                                  Text(
                                    'Settings',
                                    style: TextStyle(color: Color(0xFF838383)),
                                  ),
                                ],
                              ))
                        ],
                      ),
                    )),
                Positioned(
                    top: Get.size.height * .1,
                    left: Get.size.width * .35,
                    child: Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                          color: ThemeColor.textWhiteColor,
                          border: Border.all(color: ThemeColor.textWhiteColor, width: 2),
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                              image: NetworkImage(Helper.image.toString()),
                              fit: BoxFit.cover)),
                    )),
              ],
            )),
      ),
    );
  }

  // Build Personal Details Form
  Widget _buildPersonalDetailsForm() {
    return Padding(
      padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
      child: Form(
        key: controller.formKey,
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 35),
              CustomTextFormField(
                labelText: 'Name',
                controller: controller.nameController,
                keyboardType: TextInputType.name,
                validator: (value) =>
                value!.isEmpty ? 'Name is required' : null,
              ),
              SizedBox(height: 8),
              CustomTextFormField(
                labelText: 'Phone Number',
                controller: controller.phoneController,
                keyboardType: TextInputType.phone,
                validator: (value) =>
                value!.isEmpty ? 'Phone number is required' : null,
              ),
              SizedBox(height: 8),
              CustomTextFormField(
                labelText: 'Email',
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) =>
                value!.isEmpty ? 'Email is required' : null,
              ),
              SizedBox(height: 8),
              CustomTextFormField(
                labelText: 'Date of Birth',
                controller: controller.dobController,
                keyboardType: TextInputType.datetime,
                validator: (value) =>
                value!.isEmpty ? 'Date of Birth is required' : null,
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Radio<String>(
                    value: 'Male',
                    groupValue: controller.gender.value,
                    onChanged: (value) {
                      controller.gender.value = value!;
                    },
                  ),
                  SizedBox(height: 8),
                  Text('Male'),
                  Radio<String>(
                    value: 'Female',
                    groupValue: controller.gender.value,
                    onChanged: (value) {
                      controller.gender.value = value!;
                    },
                  ),
                  Text('Female'),
                ],
              ),
              SizedBox(height: 8),
              CustomTextFormField(
                labelText: 'Location',
                controller: controller.locationController,
                keyboardType: TextInputType.text,
                validator: (value) =>
                value!.isEmpty ? 'Location is required' : null,
              ),
              SizedBox(height: 8),
              CustomTextFormField(
                labelText: 'Zip Code',
                controller: controller.zipcodeController,
                keyboardType: TextInputType.number,
                validator: (value) =>
                value!.isEmpty ? 'Zip code is required' : null,
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                  text: "Submit",
                  onPressed: () {
                    if (controller.formKey.currentState!.validate()) {
                      // Save and submit form data
                      Get.snackbar('Success', 'Details submitted!');
                    }
                  },
                  backgroundColor: ThemeColor.primaryColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Build Settings Section
  Widget _buildSettingsSection() {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        SizedBox(height: 25),
        ListTile(
          minTileHeight: 1,
          title: Text('FAQ'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            // Navigate to FAQ page
          },
        ),
        Divider(
          color: ThemeColor.greyColor.shade200,
        ),
        ListTile(
          minTileHeight: 1,
          trailing: Icon(Icons.keyboard_arrow_right),
          title: Text('Feedback'),
          onTap: () {
            Get.to(() => FeedbackScreen());
          },
        ),
        Divider(
          color: ThemeColor.greyColor.shade200,
        ),
        ListTile(
          minTileHeight: 1,
          trailing: Icon(Icons.keyboard_arrow_right),
          title: Text('Terms & Conditions'),
          onTap: () {
            // Get.to(() => KundliScreen2());
          },
        ),
        Divider(
          color: ThemeColor.greyColor.shade200,
        ),
        ListTile(
          minTileHeight: 1,
          trailing: Icon(Icons.keyboard_arrow_right),
          title: Text('Privacy'),
          onTap: () {
            // Navigate to Privacy page
          },
        ),
        Divider(
          color: ThemeColor.greyColor.shade200,
        ),
        ListTile(
          minTileHeight: 1,
          trailing: Icon(Icons.keyboard_arrow_right),
          title: Text('About Us'),
          onTap: () {
            // Navigate to About Us page
          },
        ),
        Divider(
          color: ThemeColor.greyColor.shade200,
        ),
        ListTile(
          minTileHeight: 1,
          trailing: Icon(Icons.keyboard_arrow_right),
          title: Text('Contact Us'),
          onTap: () {
            // Navigate to Contact Us page
          },
        ),
        Divider(
          color: ThemeColor.greyColor.shade200,
        ),
      ],
    );
  }
}
