import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plarnit/dashboard.dart';
import 'package:plarnit/util.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

String PickedDate1 = DateTime.now().toString();
List arrayDate1 = PickedDate1.split(' ');
String _date = arrayDate1[0];

String PickedTime1 = TimeOfDay.now().toString();
String _time = PickedTime1.substring(10, 15);

var _myformkey = GlobalKey<FormState>();
var _taskcontroller = TextEditingController();
var _datecontroller = TextEditingController();
var _timecontroller = TextEditingController();

class _AddTaskState extends State<AddTask> {
  void ShowMyDate() {
    try {
      showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2024))
          .then((value) {
        setState(() {
          if (value == null) {
            _date = DateTime.now().toString();
          } else {
            String PickedDate = value.toString();
            List ArrayDate = PickedDate.split(' ');
            _datecontroller.text = _date = ArrayDate[0];
          }
        });
      });
    } catch (ex) {
      print(ex);
    }
  }

  void ShowMyTime() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      setState(() {
        String pickedtime = value.toString();
        _timecontroller.text = _time = pickedtime.substring(10, 15);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add New Task',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding:const EdgeInsets.all(40),
          child: Form(
            key: _myformkey,
            child: Column(
              children: [
                const Text(
                  'Here, you can schedule, manage \n and add new task ✨',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.length < 10) {
                      return 'Add a little bit description';
                    }
                    if (value.isEmpty || value == null) {
                      return 'Task Cannot be Empty';
                    }
                  },
                  controller: _taskcontroller,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        _taskcontroller.clear();
                      },
                      icon: const Icon(CupertinoIcons.arrow_counterclockwise),
                    ),
                    labelText: 'Schedule a Task',
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                  maxLines: 5,
                ),
                const SizedBox(
                  height: 50,
                ),



                //DateTime Section
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return 'Date Cannot be Empty';
                    }
                    if (value.toString() == '') {
                      return 'Date cannot be Space';
                    }
                  },
                  controller: _datecontroller,
                  decoration: InputDecoration(
                    enabled: false,
                    suffixIcon: IconButton(
                      onPressed:ShowMyDate,
                      icon:const Icon(CupertinoIcons.calendar),
                    ),
                    labelText: 'Date',
                    labelStyle: const TextStyle(color: Colors.black),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                TextButton(onPressed: ShowMyDate, child:const Text('Pick Date')),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return 'Date Cannot be Empty';
                    }
                    if (value.toString() == '') {
                      return 'Date cannot be Space';
                    }
                  },
                  controller: _timecontroller,
                  decoration: InputDecoration(
                    enabled: false,
                    suffixIcon: IconButton(
                      onPressed: ShowMyTime,
                      icon:const Icon(CupertinoIcons.time),
                    ),
                    labelText: 'Time',
                    labelStyle: const TextStyle(color: Colors.black),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                TextButton(onPressed: ShowMyTime, child:const Text('Pick Time')),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        elevation: 20,
        onPressed: () {
          if (_myformkey.currentState!.validate()) {
            MyTask.add(Taskmanager(
                task: _taskcontroller.text,
                date:
                    'Date - ${_datecontroller.text} at - ${_timecontroller.text}',
                icon: const Icon(
                  CupertinoIcons.time,
                  color: Colors.black,
                )));
            _taskcontroller.clear();
            _datecontroller.clear();
            _timecontroller.clear();
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              margin: EdgeInsets.all(40),
              content: Text('New Schedule Added'),
              duration: Duration(seconds: 2),
              showCloseIcon: true,
              backgroundColor: Colors.black,
            ));
            Future.delayed( const Duration(seconds: 1)).then((value) {
              Navigator.of(context)
                  .pushNamed('/dashboard')
                  .then((value) => setState(() {}));
            });
          } else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Oops! Try Fixing the Issues'),
              duration: Duration(seconds: 2),
              showCloseIcon: true,
              backgroundColor: Colors.red,
            ));
          }
        },
        backgroundColor: Yellow,
        child: const Icon(
          CupertinoIcons.checkmark_alt,
          color: Colors.black,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
