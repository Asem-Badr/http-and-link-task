import 'package:flutter/material.dart';
import 'package:httptask/models/post.dart';
import 'package:httptask/services/postSirvice.dart';

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  bool loading = true;
  List<Post> posts = [];
  getPostsList() async {
    posts = await PostService().getPosts();
    loading = false;
    setState(() {});
  }
void initState() {
    super.initState();
    getPostsList();
  }
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts screen"),
      ),
      body: loading ?
          Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: posts.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Container(
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("${posts[index].body}"),
                    ),
                  ),
                );
              }),
    );
  }
}
