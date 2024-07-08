
class RatingModel {
  final String serviceProviderId;
  final double ratingValue;
  final String clientId;
  final String? review;
  
  RatingModel({
    required this.serviceProviderId,
    required this.ratingValue,
    required this.clientId,
    this.review = '',
  });

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      serviceProviderId: json['serviceProviderId'],
      ratingValue: json['ratingValue'].toDouble(),
      clientId: json['clientId'],
      review: json['review'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'serviceProviderId': serviceProviderId,
      'ratingValue': ratingValue,
      'clientId': clientId,
      'review': review,
    };
  }

}