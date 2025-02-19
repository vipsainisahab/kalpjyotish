import 'package:get/get.dart';
import 'package:flutter/material.dart';

class FeedbackController extends GetxController {
  var selectedType = "Contact Support".obs;
  var selectedIssueType = "".obs;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController contactNumberController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController suggestionBoxController = TextEditingController();
}
