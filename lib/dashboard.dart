import 'dart:io';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'util.dart';

class Taskmanager {
  Random ran = Random();
  late Icon icon;
  String task;
  String date;
  Taskmanager({
    required this.task,
    required this.date,
    required this.icon,
  });
}

List<Taskmanager> MyTask = [];
Random ran = Random();

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  //const SplashHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: ListView(
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/dashboard');
                    },
                    title: const Text('Home'),
                    leading: const CircleAvatar(
                      backgroundColor: Yellow,
                      radius: 15,
                      child: Icon(
                        CupertinoIcons.profile_circled,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                  const Divider(
                    height: 30,
                    thickness: 1,
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, '/addtask');
                    },
                    title: const Text('Add Tasks'),
                    leading: const CircleAvatar(
                      backgroundColor: Yellow,
                      radius: 15,
                      child: Icon(
                        CupertinoIcons.arrow_right_arrow_left_circle_fill,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                  const Divider(
                    height: 30,
                    thickness: 1,
                  ),
                  ListTile(
                    onTap: () {
                      if (TargetPlatform.android == TargetPlatform.android) {
                        SystemNavigator.pop();
                      } else if (TargetPlatform.iOS == TargetPlatform.iOS) {
                        exit(0);
                      }
                    },
                    title: const Text('Exit App'),
                    leading: const CircleAvatar(
                      backgroundColor: Yellow,
                      radius: 15,
                      child: Icon(
                        CupertinoIcons.arrow_turn_down_left,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Planit',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Yellow,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => {},
              icon: const Icon(
                Icons.notification_add_sharp,
                color: Colors.black,
              ))
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: MyTask.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'No Tasks Yet 🤔',
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  Image.asset(
                    'assets/images/empty.png',
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width / 1.5,
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        '⬅ Swipe Task Right to Delete',
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      //color: Colors.red,
                      height: MediaQuery.of(context).size.height / 1.25,
                      width: MediaQuery.of(context).size.width / 1.1,
                      child: Scrollbar(
                        thickness: 4,
                        interactive: true,
                        child: ListView.builder(
                            itemCount: MyTask.length,
                            itemBuilder: (context, index) => Dismissible(
                                  direction: DismissDirection.horizontal,
                                  background: Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                    alignment: Alignment.centerRight,
                                    color: Colors.yellow[800],
                                    child: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                  ),
                                  key: UniqueKey(),
                                  onDismissed: (dismissed) {
                                    setState(() {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        content: Text('Task Removed'),
                                        duration: Duration(seconds: 3),
                                        backgroundColor: Colors.black,
                                        showCloseIcon: true,
                                        closeIconColor: Colors.white,
                                        behavior: SnackBarBehavior.floating,
                                        dismissDirection:
                                            DismissDirection.horizontal,
                                        margin: EdgeInsets.all(10),
                                        padding: EdgeInsets.all(10),
                                      ));
                                      MyTask.removeAt(index);
                                    });
                                  },
                                  child: Card(
                                    color: Colors.yellow[200],
                                    child: ListTile(
                                      title: Text(
                                        MyTask[index].task,
                                        style: const TextStyle(color: Colors.black),
                                      ),
                                      leading: MyTask[index].icon,
                                      subtitle: Text(
                                        MyTask[index].date,
                                      ),
                                    ),
                                  ),
                                )),
                      ),
                    ),
                  ),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addtask');
        },
        backgroundColor: Yellow,
        foregroundColor: Colors.black,
        elevation: 40,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
