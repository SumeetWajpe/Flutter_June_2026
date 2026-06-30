class CourseModel {
  final int id;
  final String name;
  final String subtitle;
  final int likes;
  final String imageUrl;
  final String description;
  final int? rating;
  final DateTime? lastUpdated;
  final String? language;
  final List<String>? subtitles;

  CourseModel(
    this.id,
    this.name,
    this.subtitle,
    this.likes,
    this.imageUrl,
    this.description,
    this.rating,
    this.lastUpdated,
    this.language,
    this.subtitles,
  );

  CourseModel copyWith({
    int? id,
    String? name,
    String? subtitle,
    int? likes,
    String? imageUrl,
    String? description,
    int? rating,
    DateTime? lastUpdated,
    String? language,
    List<String>? subtitles,
  }) {
    return CourseModel(
      id ?? this.id,
      name ?? this.name,
      subtitle ?? this.subtitle,
      likes ?? this.likes,
      imageUrl ?? this.imageUrl,
      description ?? this.description,
      rating ?? this.rating,
      lastUpdated ?? this.lastUpdated,
      language ?? this.language,
      subtitles ?? this.subtitles,
    );
  }
}
