import 'package:flutter/material.dart';
import 'package:plarnit/onboarding.dart';
import 'util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashHome extends StatefulWidget {
  @override
  State<SplashHome> createState() => _SplashHomeState();
}

class _SplashHomeState extends State<SplashHome> {
  //const SplashHome({Key? key}) : super(key: key);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(const Duration(seconds: 3)).then((value) => {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (ctx) => Slide1()))
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo.png',
            width: 110,
          ),
          const SizedBox(
            height: 80,
          ),
          const SpinKitThreeBounce(
            color: Colors.black,
            size: 20.0,
          ),
        ],
      ),
      backgroundColor: Yellow,
    );
  }
}
