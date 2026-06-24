import 'package:flutter/material.dart';
import 'package:flutterdemy_basics/models/course_model.dart';
import 'package:intl/intl.dart';

class CourseDetails extends StatefulWidget {
  final CourseModel theCourse;
  CourseDetails(this.theCourse);

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  void changeFavorite() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image(image: NetworkImage(widget.theCourse.imageUrl!), height: 300),
            ListTile(
              title: Text(
                widget.theCourse.title!,
                style: const TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                widget.theCourse.subtitle!,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: changeFavorite,
                    child: Icon(Icons.favorite_outline, color: Colors.red[900]),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      InkWell(
                        child: const Icon(
                          Icons.thumb_up_sharp,
                          color: Color.fromARGB(255, 52, 146, 247),
                        ),
                        onTap: () {
                          // change the likes
                        },
                      ),

                      Text(
                        widget.theCourse.likes.toString(),
                        style: const TextStyle(
                          fontSize: 15.0,
                          color: Color.fromARGB(255, 35, 31, 31),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Last Updated -  ${DateFormat.yMMMMd().format(widget.theCourse.lastUpdated!)}",
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.theCourse.description!),
            ),
          ],
        ),
      ),
    );
  }
}
