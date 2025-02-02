import 'package:dio/dio.dart';
import 'package:firstapp/postModel.dart';
import 'package:flutter/material.dart';

class ViewPosts extends StatefulWidget {
  const ViewPosts({super.key});

  @override
  State<ViewPosts> createState() => _ViewPostsState();
}

class _ViewPostsState extends State<ViewPosts> {
  Dio dio = new Dio();

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  Future<List<Post>> fetchPosts() async {
    Response posts =
        await dio.get("https://jsonplaceholder.typicode.com/posts");
    // print("Posts: $posts");
    // print("Posts Data: ${posts.data}");
    List<Post> postData =
        (posts.data as List).map((json) => Post.fromJson(json)).toList();
    return postData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: fetchPosts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator()); // ✅ Loading state
            }
            if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            }
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                  child: Text("No Posts Found")); // ✅ Handle empty data
            }

            final posts = snapshot.data!;
            return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("${posts[index].title}"),
                  );
                });
          }),
    );
  }
}
