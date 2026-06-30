import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdemy_bloc/bloc/course.bloc.dart';
import 'package:flutterdemy_bloc/model/course.model.dart';

class CourseWidget extends StatelessWidget {
  final CourseModel course;

  const CourseWidget({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              course.name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 6),

            Text(course.subtitle),

            const SizedBox(height: 12),

            Row(
              children: [
                IconButton(
                  onPressed: () {
                    context.read<CourseBloc>().add(
                      IncrementLikesEvent(course.id),
                    );
                  },
                  icon: const Icon(Icons.thumb_up),
                ),

                Text('${course.likes} Likes'),

                const Spacer(),

                IconButton(
                  onPressed: () {
                    context.read<CourseBloc>().add(
                      DeleteCourseEvent(course.id),
                    );
                  },
                  icon: const Icon(Icons.delete, color: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
