abstract class CourseEvent {}

class LoadCoursesEvent extends CourseEvent {}

class AddCourseEvent extends CourseEvent {
  final String name;

  AddCourseEvent(this.name);
}

class DeleteCourseEvent extends CourseEvent {
  final int id;

  DeleteCourseEvent(this.id);
}

class IncrementLikesEvent extends CourseEvent {
  final int id;

  IncrementLikesEvent(this.id);
}
