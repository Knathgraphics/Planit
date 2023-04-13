import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'util.dart';
import 'screenproperty.dart';

class Slide1 extends StatefulWidget {
  @override
  State<Slide1> createState() => _Slide1State();
}

class _Slide1State extends State<Slide1> {
  //const SplashHome({Key? key}) : super(key: key);

  int currentpage = 0;
  var pagecon = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.horizontal,
          controller: pagecon,
          onPageChanged: (index) {
            setState(() {
              currentpage = index;
              print(currentpage);
            });
          },
          dragStartBehavior: DragStartBehavior.start,
          itemCount: eachscreen.length,
          itemBuilder: (_, int) {
            return Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Yellow,
                Colors.yellowAccent,
              ], begin: Alignment.bottomCenter)),
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(eachscreen[int].Image),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      eachscreen[int].Title,
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      eachscreen[int].Subtitle,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 90,
                    ),
                  ],
                ),
              ),
            );
          }),
      backgroundColor: Yellow,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (currentpage == 0) {
            currentpage++;
            pagecon.animateToPage(currentpage++,
                duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
          } else if (currentpage == 1) {
            currentpage++;
            pagecon.animateToPage(currentpage++,
                duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
          } else if (currentpage == 2) {
            Navigator.pushReplacementNamed(context, '/dashboard');
          }
        },
        backgroundColor: Colors.white,
        elevation: 30,
        icon: currentpage != eachscreen.length - 1
            ? Icon(
                Icons.arrow_forward_ios_rounded,
                size: 15,
              )
            : Icon(Icons.check),
        label: currentpage != eachscreen.length - 1
            ? Text('Swipe')
            : Text('Ok I\'m in!'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
