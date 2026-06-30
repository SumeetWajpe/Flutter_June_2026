class CourseModel {
  final int id;
  final String name;
  final int likes;

  CourseModel({required this.id, required this.name, required this.likes});

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'],
      name: json['name'],
      likes: json['likes'],
    );
  }

  CourseModel copyWith({int? id, String? name, int? likes}) {
    return CourseModel(
      id: id ?? this.id,
      name: name ?? this.name,
      likes: likes ?? this.likes,
    );
  }
}
