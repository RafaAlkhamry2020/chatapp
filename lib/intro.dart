import 'dart:ui';

import 'package:chatapp/SplashScreen.dart';
import 'package:flutter/material.dart';

class AwesomeCarousel extends StatefulWidget {
  @override
  _AwesomeCarouselState createState() => _AwesomeCarouselState();
}

class _AwesomeCarouselState extends State<AwesomeCarousel> {
  List<String> data = [
    "assets/images/image3.png",
    "assets/images/image2.jpg"

  ];

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedSwitcher(
          duration: Duration(milliseconds: 10),
          child: Container(
            key: ValueKey<String>(data[_currentPage]),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(data[_currentPage]),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 15,
                sigmaY: 15,
              ),
              child: Container(
                color: Colors.black.withOpacity(0.2),
              ),
            ),
          ),
        ),
        FractionallySizedBox(
          heightFactor: 0.55,
          child: PageView.builder(
            itemCount: data.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              return FractionallySizedBox(
                widthFactor: 0.8,
                child: Container(
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(data[index]),
                      fit: BoxFit.cover,
                      
                    ),
                    borderRadius: BorderRadius.circular(32),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
            child: FlatButton(
              child: Text("Skip",style: TextStyle(fontSize:18 ),),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return SplashScreen();
                  }
                  )
                  );
              },
            ),
        )
      ],
    );
  }
}
