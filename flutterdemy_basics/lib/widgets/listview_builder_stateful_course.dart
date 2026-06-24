import 'package:flutter/material.dart';
import 'package:flutterdemy_basics/models/course_model.dart';

class CourseList extends StatefulWidget {
  const CourseList({super.key});

  @override
  State<CourseList> createState() => _CourseListState();
}

class _CourseListState extends State<CourseList> {
  final List<CourseModel> listofcourses = [
    CourseModel(
      1,
      "React",
      "A JS library",
      "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/React-icon.svg/3840px-React-icon.svg.png?utm_source=commons.wikimedia.org&utm_campaign=index&utm_content=thumbnail",
      200,
    ),
    CourseModel(
      2,
      "Node",
      "JS Server Side FX",
      "https://miro.medium.com/v2/resize:fit:800/1*bc9pmTiyKR0WNPka2w3e0Q.png",
      300,
    ),
    CourseModel(
      3,
      "Angular",
      "JS FX",
      "https://upload.wikimedia.org/wikipedia/commons/thumb/6/67/Angular_gradient_logo.png/960px-Angular_gradient_logo.png?utm_source=commons.wikimedia.org&utm_campaign=index&utm_content=thumbnail",
      500,
    ),
  ];

  void deleteACourse(CourseModel course) {
    setState(() {
      listofcourses.removeWhere((theCourse) => course.id == theCourse.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listofcourses.length,
      itemBuilder: (context, index) {
        var course = listofcourses[index];
        return Card(
          elevation: 5,
          child: ListTile(
            leading: Image(image: NetworkImage(course.imageUrl!), width: 100),
            title: Text(course.title!, style: const TextStyle(fontSize: 25)),
            subtitle: Text(
              course.subtitle!,
              style: const TextStyle(fontSize: 15, color: Colors.grey),
            ),
            trailing: InkWell(
              child: const Icon(
                Icons.delete,
                color: Color.fromARGB(255, 223, 84, 74),
              ),
              onTap: () {
                deleteACourse(course);
              },
            ),
          ),
        );
      },
    );
  }
}


// trailing: Column(
//               children: [
//                 InkWell(
//                   child: const Icon(
//                     Icons.thumb_up_alt_sharp,
//                     color: Color.fromARGB(255, 74, 154, 223),
//                   ),
//                   onTap: () {
//                     // change the likes
//                     setState(() {
//                       // ??
//                       course.likes++;
//                     });
//                   },
//                 ),
//                 Text(
//                   course.likes.toString(),
//                   style: const TextStyle(fontSize: 15),
//                 ),
//               ],
//             ),