class ChaptersModel {
  ChaptersModel({
    required this.audioBookId,
    required this.chaptersName,
    required this.chaptersNumber,
    required this.chaptersId,
    required this.chaptersUrl,
  });

  final String audioBookId;
  final String chaptersName;
  final int chaptersNumber;
  final String chaptersId;
  final String chaptersUrl;

  factory ChaptersModel.fromJson(Map<String, Object?> json) {
    return ChaptersModel(
      audioBookId: json['audio_book_id'] as String? ?? "",
      chaptersName: json['chapters_name'] as String? ?? "",
      chaptersNumber: json['chapters_number'] as int? ?? 0,
      chaptersId: json['chapters_id'] as String? ?? "",
      chaptersUrl: json['chapters_url'] as String? ?? "",
    );
  }

  Map<String, Object?> toJson() => {
    "audio_book_id" : audioBookId,
    "chapters_name" : chaptersName,
    "chapters_number" : chaptersNumber,
    "chapters_id": chaptersId
  };
}