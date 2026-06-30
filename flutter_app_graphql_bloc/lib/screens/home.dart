import 'package:flutter/material.dart';
import 'package:flutter_app_graphql_bloc/bloc/bloc.dart';
import 'package:flutter_app_graphql_bloc/bloc/events.dart';
import 'package:flutter_app_graphql_bloc/bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('GraphQL Courses')),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: const Text('Add Course'),
                content: TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    hintText: 'Enter course name',
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      context.read<CourseBloc>().add(
                        AddCourseEvent(controller.text),
                      );

                      Navigator.pop(context);
                    },
                    child: const Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),

      body: BlocBuilder<CourseBloc, CourseState>(
        builder: (context, state) {
          if (state.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.error != null) {
            return Center(child: Text(state.error!));
          }

          if (state.courses.isEmpty) {
            return const Center(child: Text('No Courses Found'));
          }

          return ListView.builder(
            itemCount: state.courses.length,
            itemBuilder: (context, index) {
              final course = state.courses[index];

              return Card(
                margin: const EdgeInsets.all(10),

                child: ListTile(
                  title: Text(course.name),

                  subtitle: Text('${course.likes} Likes'),

                  leading: CircleAvatar(child: Text(course.name[0])),

                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.thumb_up),
                        onPressed: () {
                          context.read<CourseBloc>().add(
                            IncrementLikesEvent(course.id),
                          );
                        },
                      ),

                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          context.read<CourseBloc>().add(
                            DeleteCourseEvent(course.id),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
