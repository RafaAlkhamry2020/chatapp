import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.50,
            width: MediaQuery.of(context).size.width * 0.90,
            child: Lottie.asset('assets/lottie/404-error-page.json',width: 300,height: 300,), 
          )
        )
      )
    );
  }
}

