class AudioBookModel {
  AudioBookModel({
    required this.audioBookId,
    required this.audioBookName,
    required this.description,
  });

  final String audioBookId;
  final String audioBookName;
  final String description;

  factory AudioBookModel.fromJson(Map<String, Object?> json){
    return AudioBookModel(
      audioBookId: json['audio_book_id'] as String? ?? "",
      audioBookName: json['audio_book_name'] as String? ?? "",
      description: json['description'] as String? ?? ""
    );
  }

  Map<String, Object?> toJson() => {
    'audio_book_id' : audioBookId,
    'audio_book_name': audioBookName,
    'description': description
  };
}
