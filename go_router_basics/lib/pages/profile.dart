import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final String username;
  final String userid;

  const Profile({super.key, required this.username, required this.userid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(child: Text("Profile")),
          Text(userid),
          Text(username),
        ],
      ),
    );
  }
}
