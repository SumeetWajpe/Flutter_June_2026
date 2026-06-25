import 'package:flutter/material.dart';
import 'package:flutterdemy_basics/models/course_model.dart';
import 'package:flutterdemy_basics/models/courselist_changenotifier_mode.dart';
import 'package:flutterdemy_basics/screens/course_details.dart';
import 'package:provider/provider.dart';

class CourseList extends StatefulWidget {
  const CourseList({super.key});

  @override
  State<CourseList> createState() => _CourseListState();
}

class _CourseListState extends State<CourseList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CourseListNotifier>(
      builder: (_, courseListChangeNotifierObj, __) => ListView.builder(
        itemCount: courseListChangeNotifierObj.listofcourses.length,
        itemBuilder: (context, index) {
          var course = courseListChangeNotifierObj.listofcourses[index];
          return GestureDetector(
            onHorizontalDragEnd: (_) {
              courseListChangeNotifierObj.deleteACourse(index);
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
                  child: Image(
                    image: NetworkImage(course.imageUrl!),
                    width: 100,
                  ),
                ),
                title: Text(
                  course.title!,
                  style: const TextStyle(fontSize: 25),
                ),
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
                    courseListChangeNotifierObj.deleteACourse(index);
                  },
                ),
              ),
            ),
          );
        },
      ),
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