class BookModel {
  BookModel({
    required this.bookId,
    required this.bookName,
    required this.bookUrl,
    required this.description,
  });

  final String bookId;
  final String bookName;
  final String bookUrl;
  final String description;

  factory BookModel.fromJson(Map<String, Object?> json) {
    return BookModel(
      bookId: json['book_id'] as String? ?? "",
      bookName: json['book_name'] as String? ?? "",
      bookUrl: json['book_url'] as String? ?? "",
      description: json['description'] as String? ?? "",
    );
  }

  Map<String, Object?> toJson() => {
    "book_id" : bookId,
    "book_name" : bookName,
    "book_url" : bookUrl,
    "description": description
  };
}