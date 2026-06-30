import 'package:flutter/material.dart';
import 'package:flutter_app_graphql_bloc/bloc/bloc.dart';
import 'package:flutter_app_graphql_bloc/bloc/events.dart';
import 'package:flutter_app_graphql_bloc/graphql/graphql_repo.dart';
import 'package:flutter_app_graphql_bloc/screens/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initHiveForFlutter();

  final HttpLink httpLink = HttpLink('http://10.0.2.2:4000/graphql');

  final GraphQLClient client = GraphQLClient(
    link: httpLink,
    cache: GraphQLCache(store: HiveStore()),
  );

  runApp(
    GraphQLProvider(
      client: ValueNotifier(client),
      child: MyApp(client: client),
    ),
  );
}

class MyApp extends StatelessWidget {
  final GraphQLClient client;

  const MyApp({super.key, required this.client});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          CourseBloc(CourseRepository(client))..add(LoadCoursesEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'GraphQL Courses App',
        theme: ThemeData(primarySwatch: Colors.teal),
        home: const HomeScreen(),
      ),
    );
  }
}
