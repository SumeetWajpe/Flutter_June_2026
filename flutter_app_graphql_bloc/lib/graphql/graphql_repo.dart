import 'package:flutter_app_graphql_bloc/graphql/graphql_queries.dart';
import 'package:flutter_app_graphql_bloc/models/course_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class CourseRepository {
  final GraphQLClient client;

  CourseRepository(this.client);

  /// FETCH COURSES
  Future<List<CourseModel>> fetchCourses() async {
    final result = await client.query(
      QueryOptions(document: gql(getCoursesQuery)),
    );

    if (result.hasException) {
      throw result.exception!;
    }

    final List courses = result.data!['courses'];

    return courses.map((e) => CourseModel.fromJson(e)).toList();
  }

  /// ADD COURSE
  Future<CourseModel> addCourse(String name) async {
    final result = await client.mutate(
      MutationOptions(
        document: gql(addCourseMutation),
        variables: {'name': name},
      ),
    );

    if (result.hasException) {
      throw result.exception!;
    }

    return CourseModel.fromJson(result.data!['addCourse']);
  }

  /// DELETE COURSE
  Future<void> deleteCourse(int id) async {
    final result = await client.mutate(
      MutationOptions(
        document: gql(deleteCourseMutation),
        variables: {'id': id},
      ),
    );

    if (result.hasException) {
      throw result.exception!;
    }
  }

  /// INCREMENT LIKES
  Future<CourseModel> incrementLikes(int id) async {
    final result = await client.mutate(
      MutationOptions(
        document: gql(incrementLikesMutation),
        variables: {'id': id},
      ),
    );

    if (result.hasException) {
      throw result.exception!;
    }

    return CourseModel.fromJson(result.data!['incrementLikes']);
  }
}
