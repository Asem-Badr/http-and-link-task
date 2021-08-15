
  import 'package:dio/dio.dart';
import 'package:httptask/models/post.dart';

class PostService {
  String baseUrl = "https://jsonplaceholder.typicode.com/";
  String Posts = "Posts";
  
  Future<List<Post>> getPosts() async {
    // ignore: non_constant_identifier_names
    List<Post> PostsList = [];
    Dio dio = new Dio();
    Response response = await dio.get("$baseUrl"+"$Posts");
    var data = response.data;
    data.forEach((element) {
      PostsList.add(Post.fromJson(element));
    });
    return PostsList;
  }
}
