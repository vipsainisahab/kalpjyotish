import 'dart:convert';

import 'package:get/get.dart';
import 'package:new_astro/utils/helper.dart';

import '../../../model/astrologer.dart';

class AstroListController extends GetxController {

  var selectedFilters = <String>[].obs;

  var astrologers = <Astrologer>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadAstrologers();
  }

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



  void loadAstrologers() {
    String jsonData = '''
    [
      {
        "name": "Astrologer A",
        "image": "${Helper.image}",
        "specialization": "Vedic Astrology, Numerology",
        "languages": "English, Hindi",
        "experience": "10 Years",
        "about": "This astrologer specializes in Vedic Astrology and This astrologer specializes in Vedic Astrology and This astrologer specializes in Vedic Astrology and This astrologer specializes in Vedic Astrology and This astrologer specializes in Vedic Astrology and This astrologer specializes in Vedic Astrology and This astrologer specializes in Vedic Astrology and This astrologer specializes in Vedic Astrology and",
        "fee": "700/session",
        "isOnline": true,
        "rating": 4.8
      },
      {
        "name": "Astrologer B",
        "image": "${Helper.image}",
        "specialization": "Tarot Reading, Palmistry",
        "languages": "Hindi, Tamil",
        "experience": "8 Years",
        "about": "This astrologer specializes in Vedic Astrology and Tarot Reading. With over 5 years of experience, they provide detailed and accurate readings for various life aspects, including career, relationships, health, and personal growth. They also offer online consultations and have built a loyal following of clients who trust their insights.",
        "fee": "600/session",
        "isOnline": false,
        "rating": 4.6
      },
      {
        "name": "Astrologer C",
        "image": "${Helper.image}",
        "specialization": "Face Reading, Horoscope Matching",
        "languages": "English, Bengali",
        "experience": "12 Years",
        "about": "This astrologer specializes in Vedic Astrology and Tarot Reading. With over 5 years of experience, they provide detailed and accurate readings for various life aspects, including career, relationships, health, and personal growth. They also offer online consultations and have built a loyal following of clients who trust their insights.s",
        "fee": "900/session",
        "isOnline": true,
        "rating": 4.9
      },
      {
        "name": "Astrologer D",
        "image": "${Helper.image}",
        "specialization": "Vastu Shastra, Numerology",
        "languages": "English, Gujarati",
        "experience": "6 Years",
        "about": "This astrologer specializes in Vedic Astrology and Tarot Reading. With over 5 years of experience, they provide detailed and accurate readings for various life aspects, including career, relationships, health, and personal growth. They also offer online consultations and have built a loyal following of clients who trust their insights.",
        "fee": "550/session",
        "isOnline": false,
        "rating": 4.4
      },
      {
        "name": "Astrologer E",
        "image": "${Helper.image}",
        "specialization": "Psychic Reading, Tarot Reading",
        "languages": "English, Telugu",
        "experience": "9 Years",
        "about": "This astrologer specializes in Vedic Astrology and Tarot Reading. With over 5 years of experience, they provide detailed and accurate readings for various life aspects, including career, relationships, health, and personal growth. They also offer online consultations and have built a loyal following of clients who trust their insights.",
        "fee": "750/session",
        "isOnline": true,
        "rating": 4.7
      }
    ]
    ''';

    List<dynamic> decodedData = jsonDecode(jsonData);
    astrologers.value = decodedData.map((data) => Astrologer.fromMap(data)).toList();
  }

}

