import 'package:flutter/material.dart';
import 'package:httptask/models/user.dart';
import 'package:httptask/screens/userDetails.dart';
import 'package:httptask/screens/widget/myCard.dart';
import 'package:httptask/services/userService.dart';
import '../utils.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  bool loading = true;
  List<User> users = [];
  getUserList() async {
    users = await UserService().getUsers();
    loading = false;
    setState(() {});
  }

  void initState() {
    super.initState();
    getUserList();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users screen"),
      ),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: () {
                        pushPage(context, UserDetails(users[index]));
                      },
                      child: MyCard(content: "${users[index].name}")),
                );
              }),
    );
  }
}
