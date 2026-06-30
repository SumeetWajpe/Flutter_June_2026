import 'package:flutter_app_graphql_bloc/models/course_model.dart';

class CourseState {
  final List<CourseModel> courses;
  final bool loading;
  final String? error;

  CourseState({required this.courses, required this.loading, this.error});

  factory CourseState.initial() {
    return CourseState(courses: [], loading: false);
  }

  CourseState copyWith({
    List<CourseModel>? courses,
    bool? loading,
    String? error,
  }) {
    return CourseState(
      courses: courses ?? this.courses,
      loading: loading ?? this.loading,
      error: error,
    );
  }
}
