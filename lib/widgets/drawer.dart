// ignore_for_file: must_be_immutable, prefer_const_constructors, unused_local_variable, prefer_const_declarations
import 'package:flutter/material.dart';


class MyDrawer extends StatelessWidget {
  MyDrawer({required this.data, Key? key}) : super(key: key);
  Map<String, String?> data = {};
  @override
  Widget build(BuildContext context) {
    final imageBaseURL = "https://dev.bynail.xyz/test_api/profile_image/";
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('${data["name"]}'),
            accountEmail: Text('${data["email"]}'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: data["ProfilePic"] == null
                    ? Image.asset(
                        "assets/images/person.jpeg",
                        fit: BoxFit.cover,
                        width: 90,
                        height: 90,
                      )
                    : Image.network(
                        imageBaseURL + data["ProfilePic"]!,
                        fit: BoxFit.cover,
                        width: 90,
                        height: 90,
                      ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),
            ),
          ),
          // ListTile(
          //   leading: Icon(Icons.notifications),
          //   title: Text('Requests'),
          //   onTap: null,
          //   trailing: ClipOval(
          //     child: Container(
          //       color: Colors.red,
          //       width: 20,
          //       height: 20,
          //       child: Center(
          //         child: Text(
          //           '8',
          //           style: TextStyle(
          //             color: Colors.white,
          //             fontSize: 12,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // Divider(),
          // ListTile(
          //   leading: Icon(Icons.settings),
          //   title: Text('Settings'),
          //   onTap: () => null,
          // ),
          
          Divider(),
          ListTile(
            title: Text('LogOut'),
            leading: Icon(Icons.exit_to_app),
            onTap: () {
             
            },
            // trailing: ClipOval(
            //   child: Container(
            //     color: Colors.red,
            //     width: 20,
            //     height: 20,
            //     child: Center(
            //       child: Text(
            //         '8',
            //         style: TextStyle(
            //           color: Colors.white,
            //           fontSize: 12,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ),
          Divider()
        ],
      ),
    );
  }
}
