import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,

                accountName: Text("Heet Patel"),
                accountEmail: Text("heet149@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/myself.jpg"),

                ),
          ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.home,
              color: Colors.deepPurple,
            ),
            title: Text(
              "Home",
              textScaleFactor: 1.3,
              style: TextStyle(
                color: Colors.deepPurple,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.camera_circle_fill,
              color: Colors.deepPurple,
            ),
            title: Text(
              "Camera",
              textScaleFactor: 1.3,
              style: TextStyle(
                color: Colors.deepPurple,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.person,
              color: Colors.deepPurple,
            ),
            title: Text(
              "My Profile",
              textScaleFactor: 1.3,
              style: TextStyle(
                color: Colors.deepPurple,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.settings,
              color: Colors.deepPurple,
            ),
            title: Text(
              "Settings",
              textScaleFactor: 1.3,
              style: TextStyle(
                color: Colors.deepPurple,
              ),
            ),
          )
        ],
      ),
    );
  }
}
