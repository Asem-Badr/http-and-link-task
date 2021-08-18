import 'package:flutter/material.dart';
import 'package:httptask/models/user.dart';
import 'package:httptask/screens/mapScreen.dart';
import 'package:httptask/screens/widget/myCard.dart';

import '../utils.dart';

class UserDetails extends StatefulWidget {
  User user;
  UserDetails(this.user);

  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          MyCard(
            content: "${widget.user.name}",
          ),
          SizedBox(
            height: 15,
          ),
          ///////////////////////////
          InkWell(
              onTap: () {
                launchURL("mailto:${widget.user.email}");
              },
              child: Text("Email: ${widget.user.email}")),
          SizedBox(
            height: 15,
          ), ///////////////////////////
          InkWell(
              onTap: () {
                launchURL("tel:${widget.user.phone}");
              },
              child: Text("phone: ${widget.user.phone}")),
          SizedBox(
            height: 15,
          ), ///////////////////////////

          SizedBox(
            height: 15,
          ),
          InkWell(
              onTap: () {
                launchURL("https://${widget.user.website}");
              },
              child: Text("web: ${widget.user.website}")),
          MaterialButton(
            onPressed: () {
              pushPage(
                  context,
                  MapSample(
                    myLocation: widget.user.address.geo,
                  ));
            },
            child: Text("Map view"),
          )
        ], ///////////////////////////
      ),
    );
  }
}
