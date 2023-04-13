import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plarnit/util.dart';

class DashMenu extends StatefulWidget {
  const DashMenu({Key? key}) : super(key: key);

  @override
  State<DashMenu> createState() => _DashMenuState();
}

class _DashMenuState extends State<DashMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Menu'),
        backgroundColor: Yellow,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          color: Colors.white,
          child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: ListView(
                children: [
                  ListTile(
                    onTap: (){
                      Navigator.popAndPushNamed(context, '/menu');
                    },
                    title: Text('Home'),
                    leading: CircleAvatar(
                      child: Icon(
                        CupertinoIcons.profile_circled,
                        color: Colors.black,
                        size: 20,
                      ),
                      backgroundColor: Yellow,
                      radius: 15,
                    ),
                  ),
                  Divider(
                    height: 30,
                    thickness: 1,
                  ),
                  ListTile(
                    onTap: (){
                      Navigator.pushNamed(context, '/addtask');
                    },
                    title: Text('Add Tasks'),
                    leading: CircleAvatar(
                      child: Icon(
                        CupertinoIcons.arrow_right_arrow_left_circle_fill,
                        color: Colors.black,
                        size: 20,
                      ),
                      backgroundColor: Yellow,
                      radius: 15,
                    ),
                  ),
                  Divider(
                    height: 30,
                    thickness: 1,
                  ),
                  ListTile(
                    onTap: (){
                      Navigator.popAndPushNamed(context, '/menu');
                    },
                    title: Text('Manage All Tasks'),
                    leading: CircleAvatar(
                      child: Icon(
                        CupertinoIcons.alarm,
                        color: Colors.black,
                        size: 20,
                      ),
                      backgroundColor:Yellow,
                      radius: 15,
                    ),
                  ),
                  Divider(
                    height: 30,
                    thickness: 1,
                  ),
                  ListTile(
                    onTap: (){
                     if(TargetPlatform.android == true){
                       SystemNavigator.pop();
                     }
                     else if(TargetPlatform.iOS == true){
                       exit(0);
                     }
                    },
                    title: Text('Exit App'),
                    leading: CircleAvatar(
                      child: Icon(
                        CupertinoIcons.arrow_turn_down_left,
                        color: Colors.black,
                        size: 20,
                      ),
                      backgroundColor: Yellow,
                      radius: 15,
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
