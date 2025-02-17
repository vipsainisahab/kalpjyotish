import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../dashboard/dashboard_screen.dart';


class LoginController extends GetxController {
  Dio dio = Dio();
  final TextEditingController number = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void fetchData() {
    dio.post('path');
  }

  Future<void> login() async {

    try {
      final response = await dio.post(
        'https://kalpjyotish.edenriversidecamp.com/api/validateOtp',
        data: {'phone': '9639000761', 'otp': '1234'},
      );

      print('Response: ${response.data}');

      if (response.data['success'] == true && response.statusCode == 200) {
        Get.snackbar('Success', '${response.data['message']}');
        final token = response.data['message'];
        // await TokenManager.saveToken(token);
        Get.to(() => DashboardScreen());
        // String? getToken = await TokenManager.getToken();
        // print('Retrieved Token: $getToken');
      } else {
        Get.snackbar('Failed', '${response.data['error']}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}



// // Save token
// await TokenManager.saveToken('your_jwt_token_here');
//
// // Get token
// String? token = await TokenManager.getToken();
// print('Retrieved Token: $token');
//
// // Check if token exists
// bool hasToken = await TokenManager.hasToken();
// print('Token Exists: $hasToken');
//
// // Remove token
// await TokenManager.removeToken();