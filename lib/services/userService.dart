import 'package:flutter/cupertino.dart';
import 'package:httptask/models/user.dart';
import 'package:dio/dio.dart';

class UserService {
  String baseUrl = "https://jsonplaceholder.typicode.com/";
  String users = "users";
  
  Future<List<User>> getUsers() async {
    List<User> usersList = [];
    
    Dio dio = new Dio();
    Response response = await dio.get("$baseUrl"+"$users");
    var data = response.data;
    data.forEach((element) {
      usersList.add(User.fromJson(element));
    });
    return usersList;
  }
}
