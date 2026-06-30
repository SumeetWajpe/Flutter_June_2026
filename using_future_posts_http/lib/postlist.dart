import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:using_future_posts_http/posts.model.dart';
import 'package:http/http.dart' as http;

class PostListScreen extends StatefulWidget {
  const PostListScreen({super.key});

  @override
  State<PostListScreen> createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  late Future<List<PostModel>> _postsFuture;

  @override
  void initState() {
    super.initState();
    _postsFuture = fetchPosts();
  }

  Future<List<PostModel>> fetchPosts() async {
    final url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => PostModel.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load posts !");
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PostModel>>(
      future: _postsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error : ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No data found'));
        }
        final posts = snapshot.data;
        return ListView.builder(
          itemCount: posts!.length,
          itemBuilder: (context, index) {
            final post = posts[index];
            return ListTile(
              leading: CircleAvatar(child: Text('${post.id}')),
              title: Text(post.title),
              subtitle: Text(
                post.body,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            );
          },
        );
      },
    );
  }
}
