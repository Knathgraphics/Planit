import 'package:flutter/material.dart';
import 'package:plarnit/addtask.dart';
import 'package:plarnit/dashboard.dart';
import 'package:plarnit/register.dart';
import 'package:plarnit/splash_screen.dart';
import 'package:plarnit/util.dart';
import 'menu.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
primarySwatch: Yellow,
        primaryColor: Yellow,
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.orange,
              width: 0.5,
            )
          )
        )
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => SplashHome(),
        '/menu' : (context) => DashMenu(),
        '/register' : (context) => Register(),
        '/addtask' : (context) => AddTask(),
        '/dashboard' : (context) => Dashboard(),
      },
      debugShowCheckedModeBanner: false,
     //home: SplashHome(),
    )
  );
}
