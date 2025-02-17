import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  var notifications = <String, int>{
    'Astro': 1,
    'Events': 0,
    'Roommates': 2,
    'Rentals': 0,
    'Care Services': 0,
    'IT Training & Placement': 0,
    'Jobs': 0,
    'Local Biz & Services': 0,
  }.obs;

  final List<Map<String, dynamic>> categories = [
    {'title': 'Astro', 'icon': Icons.star},
    {'title': 'Events', 'icon': Icons.event},
    {'title': 'Roommates', 'icon': Icons.chat},
    {'title': 'Rentals', 'icon': Icons.home},
    {'title': 'Care Services', 'icon': Icons.healing},
    {'title': 'IT Training & Placement', 'icon': Icons.computer},
    {'title': 'Jobs', 'icon': Icons.work},
    {'title': 'Local Biz & Services', 'icon': Icons.business},
  ].obs;
}
