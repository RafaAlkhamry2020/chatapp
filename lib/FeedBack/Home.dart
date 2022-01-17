
import 'package:chatapp/FeedBack/card_planet.dart';
import 'package:chatapp/FeedBack/page.dart';

import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';






class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final data = [
    CardPlanetData(
      title: "FeedBack",
      subtitle:
          "Tell Us What You Want.",
      image: const AssetImage("assets/images/img-1.png"),
      backgroundColor: const Color.fromRGBO(0, 10, 56, 1),
      titleColor: Colors.pink,
      subtitleColor: Colors.white,
      background: LottieBuilder.asset("assets/animation/bg-1.json"),
    ),
    CardPlanetData(
      title: "Opinion",
      subtitle: "Tell Us The pros And cons of Our Program .",
      image: const AssetImage("assets/images/img-2.png"),
      backgroundColor: Colors.white,
      titleColor: Colors.purple,
      subtitleColor: const Color.fromRGBO(0, 10, 56, 1),
      background: LottieBuilder.asset("assets/animation/bg-2.json"),
    ),
    CardPlanetData(
      title: "Helps",
      subtitle: "Tell Us Ie We Want Any Help.",
      image: const AssetImage("assets/images/img-3.png"),
      backgroundColor: const Color.fromRGBO(71, 59, 117, 1),
      titleColor: Colors.yellow,
      subtitleColor: Colors.white,
      background: LottieBuilder.asset("assets/animation/bg-3.json"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Stack(
        children: <Widget>[
          ConcentricPageView(
            colors: data.map((e) => e.backgroundColor).toList(),
          itemCount: data.length,
          itemBuilder: (int index, double value) {
          return CardPlanet(data: data[index]);
          
        },),
        Align(
          alignment: Alignment.bottomRight,
            child: FlatButton(
              child: Text("Skip",style: TextStyle(fontSize:18,color: Color(0xfff5435d), ),),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return page();
                  }
                  )
                  );
              },
            ),
        )
        ]
        )
      
    
    );

  }
}
