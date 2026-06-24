// import 'package:flutter/material.dart';
// import 'package:flutterdemy_basics/models/course_model.dart';

// class CoursesWithListTile extends StatelessWidget {
//   CoursesWithListTile({super.key});

//   final List<CourseModel> listofcourses = [
//     CourseModel(
//       1,
//       "React",
//       "A JS library",
//       "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/React-icon.svg/3840px-React-icon.svg.png?utm_source=commons.wikimedia.org&utm_campaign=index&utm_content=thumbnail",
//     ),
//     CourseModel(
//       2,
//       "Node",
//       "JS Server Side FX",
//       "https://miro.medium.com/v2/resize:fit:800/1*bc9pmTiyKR0WNPka2w3e0Q.png",
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: [
//         ...listofcourses.map(
//           (course) => Card(
//             elevation: 5,
//             child: ListTile(
//               leading: Image(image: NetworkImage(course.imageUrl!), width: 100),
//               title: Text(course.title!, style: const TextStyle(fontSize: 25)),
//               subtitle: Text(
//                 course.subtitle!,
//                 style: const TextStyle(fontSize: 15, color: Colors.grey),
//               ),
//               trailing: const Icon(
//                 Icons.delete,
//                 color: Color.fromARGB(255, 223, 84, 74),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
