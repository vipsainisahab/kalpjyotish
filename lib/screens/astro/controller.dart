import 'package:get/get.dart';

import '../../model/astrologer.dart';

class AstrologerController extends GetxController {
  final String image =
      'https://media.istockphoto.com/id/1437816897/photo/business-woman-manager-or-human-resources-portrait-for-career-success-company-we-are-hiring.jpg?s=612x612&w=0&k=20&c=tyLvtzutRh22j9GqSGI33Z4HpIwv9vL_MZw_xOE19NQ=';

  var astrologers = List.generate(
    10,
        (index) => Astrologer(
      name: 'Astrologer ${index + 1}',
      specialization: 'Vedic Astrology, Tarot Reading',
      languages: 'English, Hindi',
      experience: '5 Years',
      fee: '₹500/session',
      isOnline: index % 2 == 0,
      rating: 4.5,
    ),
  ).obs;

  var selectedFilters = <String>[].obs;

  void toggleFilter(String filter) {
    if (selectedFilters.contains(filter)) {
      selectedFilters.remove(filter);
    } else {
      selectedFilters.add(filter);
    }
  }

  void clearFilters() {
    selectedFilters.clear();
  }
}
