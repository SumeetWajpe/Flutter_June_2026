import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_basics/routes/app_routes.constant.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(child: const Text("Home")),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).push(Uri(path: "/bout").toString());
            },
            child: Text("Go to About"),
          ),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).pushNamed(
                MyAppRouterContants.profileRouteName,
                pathParameters: {'username': 'Sumeet', 'userid': 'sw101'},
              );
            },
            child: Text("Go to Profile"),
          ),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(
                context,
              ).pushNamed(MyAppRouterContants.contactusRouteName);
            },
            child: Text("Go to Contactus"),
          ),
        ],
      ),
    );
  }
}
