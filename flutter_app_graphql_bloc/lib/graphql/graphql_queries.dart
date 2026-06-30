const String getCoursesQuery = r'''
query GetCourses {
  courses {
    id
    name
    likes
  }
}
''';

const String addCourseMutation = r'''
mutation AddCourse($name: String!) {
  addCourse(name: $name) {
    id
    name
    likes
  }
}
''';

const String deleteCourseMutation = r'''
mutation DeleteCourse($id: Int!) {
  deleteCourse(id: $id)
}
''';

const String incrementLikesMutation = r'''
mutation IncrementLikes($id: Int!) {
  incrementLikes(id: $id) {
    id
    name
    likes
  }
}
''';
