import 'package:flutter/material.dart';
import 'package:flutterdemy_basics/models/course_model.dart';
import 'package:flutterdemy_basics/screens/course_details.dart';

class CourseList extends StatefulWidget {
  const CourseList({super.key});

  @override
  State<CourseList> createState() => _CourseListState();
}

class _CourseListState extends State<CourseList> {
 
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
        return GestureDetector(
          onHorizontalDragEnd: (_) {
            deleteACourse(course);
          },
          child: Card(
            elevation: 5,
            child: ListTile(
              leading: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CourseDetails(course),
                    ),
                  );
                },
                child: Image(image: NetworkImage(course.imageUrl!), width: 100),
              ),
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