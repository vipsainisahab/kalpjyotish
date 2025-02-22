import 'package:get/get.dart';

class AstroProfileController extends GetxController {
  var isExpanded = false.obs;
  var isOpenAllReview = false.obs;
  final RxInt totalRatings = 348.obs;
  final RxDouble averageRating = 4.0.obs;
  final RxMap<int, int> ratingCounts =
      <int, int>{5: 50, 4: 30, 3: 10, 2: 5, 1: 2}.obs;

  final RxList<Map<String, String>> reviews = <Map<String, String>>[
    {
      'user': 'Anonymous',
      'review': 'Amazing astrologer mostly all doubts are clear.',
      'rating': '5',
      'image': 'https://randomuser.me/api/portraits/men/3.jpg',
    },
    {
      'user': 'Farnaz',
      'review':
          'Astrologer gently answered to my questions and shared remedial advice which would create good vibes for marital prosperity with my husband.',
      'rating': '5',
      'image': 'https://randomuser.me/api/portraits/women/1.jpg',
    },
    {
      'user': 'Ravi',
      'review':
          'He has revealed the problems and gave solutions to come out of it.',
      'rating': '4',
      'image': 'https://randomuser.me/api/portraits/men/2.jpg',
    },
    {
      'user': 'Ravi',
      'review':
          'He has revealed the problems and gave solutions to come out of it.',
      'rating': '4',
      'image': 'https://randomuser.me/api/portraits/men/4.jpg',
    },
    {
      'user': 'Ravi',
      'review':
          'He has revealed the problems and gave solutions to come out of it.',
      'rating': '4',
      'image': 'https://randomuser.me/api/portraits/women/4.jpg',
    },
  ].obs;

  void addReview(String user, String review, int rating) {
    reviews.add({'user': user, 'review': review, 'rating': rating.toString()});

    // Update rating counts
    if (ratingCounts.containsKey(rating)) {
      ratingCounts[rating] = ratingCounts[rating]! + 1;
    } else {
      ratingCounts[rating] = 1;
    }

    // Recalculate average rating
    _updateAverageRating();
  }

  void _updateAverageRating() {
    int totalRatings = 0;
    int totalReviews = 0;

    ratingCounts.forEach((rating, count) {
      totalRatings += rating * count;
      totalReviews += count;
    });

    averageRating.value = totalReviews > 0 ? totalRatings / totalReviews : 0.0;
  }

  void toggleExpanded() {
    isExpanded.value = !isExpanded.value;
  }
}
