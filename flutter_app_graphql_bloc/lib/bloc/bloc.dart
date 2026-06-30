import 'package:flutter_app_graphql_bloc/bloc/events.dart';
import 'package:flutter_app_graphql_bloc/bloc/state.dart';
import 'package:flutter_app_graphql_bloc/graphql/graphql_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final CourseRepository repository;

  CourseBloc(this.repository) : super(CourseState.initial()) {
    on<LoadCoursesEvent>(_loadCourses);
    on<AddCourseEvent>(_addCourse);
    on<DeleteCourseEvent>(_deleteCourse);
    on<IncrementLikesEvent>(_incrementLikes);
  }

  /// LOAD COURSES
  Future<void> _loadCourses(
    LoadCoursesEvent event,
    Emitter<CourseState> emit,
  ) async {
    emit(state.copyWith(loading: true));

    try {
      final courses = await repository.fetchCourses();

      emit(state.copyWith(loading: false, courses: courses));
    } catch (e) {
      emit(state.copyWith(loading: false, error: e.toString()));
    }
  }

  /// ADD COURSE
  Future<void> _addCourse(
    AddCourseEvent event,
    Emitter<CourseState> emit,
  ) async {
    try {
      final newCourse = await repository.addCourse(event.name);

      /// LOCAL STATE UPDATE
      emit(state.copyWith(courses: [...state.courses, newCourse]));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  /// DELETE COURSE
  Future<void> _deleteCourse(
    DeleteCourseEvent event,
    Emitter<CourseState> emit,
  ) async {
    try {
      await repository.deleteCourse(event.id);

      /// LOCAL STATE UPDATE
      emit(
        state.copyWith(
          courses: state.courses.where((c) => c.id != event.id).toList(),
        ),
      );
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  /// INCREMENT LIKES
  Future<void> _incrementLikes(
    IncrementLikesEvent event,
    Emitter<CourseState> emit,
  ) async {
    try {
      final updatedCourse = await repository.incrementLikes(event.id);

      /// LOCAL STATE UPDATE
      emit(
        state.copyWith(
          courses: state.courses.map((c) {
            if (c.id == event.id) {
              return updatedCourse;
            }

            return c;
          }).toList(),
        ),
      );
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }
}
