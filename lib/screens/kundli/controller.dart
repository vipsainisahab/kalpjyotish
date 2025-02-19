import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KundliController extends GetxController {
  var selectedType = "Male".obs;
  var selectedIssueType = "".obs;

  final TextEditingController NameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController dateOfMonthController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController addressBoxController = TextEditingController();
  final TextEditingController hrsController = TextEditingController();
}
