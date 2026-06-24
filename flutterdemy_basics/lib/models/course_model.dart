// id, title, subtitle, imageUrl

class CourseModel {
  final int id;
  final String? title;
  final String? subtitle;
  final String? imageUrl;
  final int? likes;

  CourseModel(this.id, this.title, this.subtitle, this.imageUrl, this.likes);
}
