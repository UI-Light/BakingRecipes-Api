class Step {
  final int id;
  final String description;
  final String? videoUrl;
  final String? thumbnailUrl;

  Step({
    required this.id,
    required this.description,
    this.videoUrl,
    this.thumbnailUrl,
  });

  factory Step.fromJson(Map<String, dynamic> json) {
    return Step(
      id: json['id'],
      description: json['description'],
      videoUrl: json['videoURL'] ?? "Unavailable",
      thumbnailUrl: json['thumbnailURL'] ?? "Unavailable",
    );
  }
}
