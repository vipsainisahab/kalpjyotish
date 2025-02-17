import 'package:dio/dio.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Dio dio = Dio();

  var astrologersList = <Astrologer>[].obs;

  var isLoading = false.obs;

  final String usermage =
      'https://media.istockphoto.com/id/1437816897/photo/business-woman-manager-or-human-resources-portrait-for-career-success-company-we-are-hiring.jpg?s=612x612&w=0&k=20&c=tyLvtzutRh22j9GqSGI33Z4HpIwv9vL_MZw_xOE19NQ=';


  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      final response = await dio
          .post('https://kalpjyotish.edenriversidecamp.com/api/getAstrologer');

      print(response.data);
      if (response.statusCode == 200 && response.data['status'] == 200) {
        final List<dynamic> dataList = response.data['recordList'] ?? [];

        astrologersList
            .assignAll(dataList.map((e) => Astrologer.fromJson(e)).toList());
        Get.snackbar('Success', 'Data fetched successfully');
      } else {
        Get.snackbar('Failed', 'Error: ${response.data['error']}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load data');
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }
}



class Astrologer {
  final int id;
  final int userId;
  final String name;
  final String email;
  final String contactNo;
  final String gender;
  final String birthDate;
  final String primarySkill;
  final String allSkill;
  final String languageKnown;
  final String? profileImage;
  final int charge;
  final int experienceInYears;
  final int dailyContribution;
  final String hearAboutAstroguru;
  final String? isWorkingOnAnotherPlatform;
  final String whyOnBoard;
  final String interviewSuitableTime;
  final String? currentCity;
  final String mainSourceOfBusiness;
  final String highestQualification;
  final String degree;
  final String? college;
  final String? learnAstrology;
  final String astrologerCategoryId;
  final String? instaProfileLink;
  final String? facebookProfileLink;
  final String? linkedInProfileLink;
  final String? youtubeChannelLink;
  final String? websiteProfileLink;
  final String? isAnyBodyRefer;
  final int minimumEarning;
  final int maximumEarning;
  final String? loginBio;
  final String noOfForeignCountriesTravel;
  final String currentlyWorkingFullTimeJob;
  final String goodQuality;
  final String biggestChallenge;
  final String whatWillDo;
  final bool isVerified;
  final int? totalOrder;
  final String? country;
  final bool isActive;
  final bool isDelete;
  final String createdAt;
  final String updatedAt;
  final String? createdBy;
  final String? modifiedBy;
  final String? nameOfPlatform;
  final int? monthlyEarning;
  final String? referredPerson;
  final String? chatStatus;
  final String? chatWaitTime;
  final String? callStatus;
  final String? callWaitTime;
  final int videoCallRate;
  final int reportRate;
  final String? deletedAt;
  final bool isFreeAvailable;
  final int rating;
  final int reviews;
  final String astrologerCategory;

  Astrologer({
    required this.id,
    required this.userId,
    required this.name,
    required this.email,
    required this.contactNo,
    required this.gender,
    required this.birthDate,
    required this.primarySkill,
    required this.allSkill,
    required this.languageKnown,
    this.profileImage,
    required this.charge,
    required this.experienceInYears,
    required this.dailyContribution,
    required this.hearAboutAstroguru,
    this.isWorkingOnAnotherPlatform,
    required this.whyOnBoard,
    required this.interviewSuitableTime,
    this.currentCity,
    required this.mainSourceOfBusiness,
    required this.highestQualification,
    required this.degree,
    this.college,
    this.learnAstrology,
    required this.astrologerCategoryId,
    this.instaProfileLink,
    this.facebookProfileLink,
    this.linkedInProfileLink,
    this.youtubeChannelLink,
    this.websiteProfileLink,
    this.isAnyBodyRefer,
    required this.minimumEarning,
    required this.maximumEarning,
    this.loginBio,
    required this.noOfForeignCountriesTravel,
    required this.currentlyWorkingFullTimeJob,
    required this.goodQuality,
    required this.biggestChallenge,
    required this.whatWillDo,
    required this.isVerified,
    this.totalOrder,
    this.country,
    required this.isActive,
    required this.isDelete,
    required this.createdAt,
    required this.updatedAt,
    this.createdBy,
    this.modifiedBy,
    this.nameOfPlatform,
    this.monthlyEarning,
    this.referredPerson,
    this.chatStatus,
    this.chatWaitTime,
    this.callStatus,
    this.callWaitTime,
    required this.videoCallRate,
    required this.reportRate,
    this.deletedAt,
    required this.isFreeAvailable,
    required this.rating,
    required this.reviews,
    required this.astrologerCategory,
  });

  factory Astrologer.fromJson(Map<String, dynamic> json) {
    return Astrologer(
      id: json['id'] ?? 0,
      userId: json['userId'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      contactNo: json['contactNo'] ?? '',
      gender: json['gender'] ?? '',
      birthDate: json['birthDate'] ?? '',
      primarySkill: json['primarySkill'] ?? '',
      allSkill: json['allSkill'] ?? '',
      languageKnown: json['languageKnown'] ?? '',
      profileImage: json['profileImage'],
      charge: json['charge'] ?? 0,
      experienceInYears: json['experienceInYears'] ?? 0,
      dailyContribution: json['dailyContribution'] ?? 0,
      hearAboutAstroguru: json['hearAboutAstroguru'] ?? '',
      isWorkingOnAnotherPlatform: json['isWorkingOnAnotherPlatform'],
      whyOnBoard: json['whyOnBoard'] ?? '',
      interviewSuitableTime: json['interviewSuitableTime'] ?? '',
      currentCity: json['currentCity'],
      mainSourceOfBusiness: json['mainSourceOfBusiness'] ?? '',
      highestQualification: json['highestQualification'] ?? '',
      degree: json['degree'] ?? '',
      college: json['college'],
      learnAstrology: json['learnAstrology'],
      astrologerCategoryId: json['astrologerCategoryId'] ?? '',
      instaProfileLink: json['instaProfileLink'],
      facebookProfileLink: json['facebookProfileLink'],
      linkedInProfileLink: json['linkedInProfileLink'],
      youtubeChannelLink: json['youtubeChannelLink'],
      websiteProfileLink: json['websiteProfileLink'],
      isAnyBodyRefer: json['isAnyBodyRefer'],
      minimumEarning: json['minimumEarning'] ?? 0,
      maximumEarning: json['maximumEarning'] ?? 0,
      loginBio: json['loginBio'],
      noOfForeignCountriesTravel: json['NoofforeignCountriesTravel'] ?? '0',
      currentlyWorkingFullTimeJob: json['currentlyworkingfulltimejob'] ?? '',
      goodQuality: json['goodQuality'] ?? '',
      biggestChallenge: json['biggestChallenge'] ?? '',
      whatWillDo: json['whatwillDo'] ?? '',
      isVerified: json['isVerified'] == 1,
      totalOrder: json['totalOrder'],
      country: json['country'],
      isActive: json['isActive'] == 1,
      isDelete: json['isDelete'] == 1,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      videoCallRate: json['videoCallRate'] ?? 0,
      reportRate: json['reportRate'] ?? 0,
      isFreeAvailable: json['isFreeAvailable'] ?? false,
      rating: json['rating'] ?? 0,
      reviews: json['reviews'] ?? 0,
      astrologerCategory: json['astrologerCategory'] ?? '',
    );
  }
}
