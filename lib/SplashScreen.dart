import 'package:chatapp/HomePage.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:flare_flutter/flare_actor.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          
            Container(

            
              child: Lottie.asset('assets/lottie/school.json',width: 400,height: 400), 
              
              ),
              Container(child:  Text(
                " Twintech Unversity",
                style: TextStyle(
                    fontSize: 28,
                    fontFamily: "sans-serif",
                  color:  Color(0xfff5435d),
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center
            ),)
              
           
          ],
        ),
      ),
    );
  }
}


