import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class genLoginSignupHeader extends StatelessWidget {
  String headerName;

  genLoginSignupHeader(this.headerName);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 50.0),
          Text(
            headerName,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 40.0),
          ),
          SizedBox(height: 10.0),
          Container(child: Lottie.asset('assets/lottie/login.json',width: 200,height: 200,), ),
          // Image.asset(
          //   "assets/lottie/adminpanel.json",
          //   height: 150.0,
          //   width: 150.0,
          // ),
          SizedBox(height: 10.0),
          
        ],
      ),
    );
  }
}
