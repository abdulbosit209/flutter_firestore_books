class ReviewsModel {

  ReviewsModel({
    required this.reviewId,
    required this.userId,
    required this.reviewText,
    required this.reviewNumber,
    required this.bookId,
  });

  final String reviewId;
  final String userId;
  final int reviewText;
  final double reviewNumber;
  final String bookId;

  factory ReviewsModel.fromJson(Map<String, Object?> json) {
    return ReviewsModel(
      reviewId: json['review_id'] as String? ?? "",
      userId: json['user_id'] as String? ?? "",
      reviewText: json['review_text'] as int? ?? 0,
      reviewNumber: json['review_number'] as double? ?? 0.0,
      bookId: json['book_id'] as String? ?? "",
    );
  }

  Map<String, Object?> toJson() => {
    "review_id" : reviewId,
    "user_id" : userId,
    "review_text" : reviewText,
    "review_number": reviewNumber,
    "book_id": bookId
  };
}

