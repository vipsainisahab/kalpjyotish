import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ProfileController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController zipcodeController = TextEditingController();

  RxString gender = 'Male'.obs;
  RxBool showPersonalDetails = false.obs;

}
