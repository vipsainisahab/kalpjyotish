class Astrologer {
  final String name;
  final String specialization;
  final String languages;
  final String experience;
  final String fee;
  final bool isOnline;
  final double rating;

  Astrologer({
    required this.name,
    required this.specialization,
    required this.languages,
    required this.experience,
    required this.fee,
    required this.isOnline,
    required this.rating,
  });

  // Factory method to create an astrologer from a map (for deserialization)
  factory Astrologer.fromMap(Map<String, dynamic> map) {
    return Astrologer(
      name: map['name'],
      specialization: map['specialization'],
      languages: map['languages'],
      experience: map['experience'],
      fee: map['fee'],
      isOnline: map['isOnline'],
      rating: map['rating'],
    );
  }

  // Method to convert the astrologer to a map (for serialization, if needed)
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'specialization': specialization,
      'languages': languages,
      'experience': experience,
      'fee': fee,
      'isOnline': isOnline,
      'rating': rating,
    };
  }
}
