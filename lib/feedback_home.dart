import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'feedback.dart';
import 'feedback_splashscreen.dart';
import 'package:concentric_transition/concentric_transition.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final data = [
    CardFeedBacktData(
      title: "FeedBack",
      subtitle:
          "Tell Us What You Want.",
      image: const AssetImage("assets/images/img-1.png"),
      backgroundColor: const Color.fromRGBO(0, 10, 56, 1),
      titleColor: Colors.pink,
      subtitleColor: Colors.white,
      background: LottieBuilder.asset("assets/animation/bg-1.json"),
    ),
    CardFeedBacktData(
      title: "Opinion",
      subtitle: "Tell Us The pros And cons of Our Program .",
      image: const AssetImage("assets/images/img-2.png"),
      backgroundColor: Colors.white,
      titleColor: Colors.purple,
      subtitleColor: const Color.fromRGBO(0, 10, 56, 1),
      background: LottieBuilder.asset("assets/animation/bg-2.json"),
    ),
    CardFeedBacktData(
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
          return CardFeedBack(data: data[index]);
          
        },),
        Align(
          alignment: Alignment.bottomRight,
            child: FlatButton(
              child: Text("Skip",style: TextStyle(fontSize:18,color: Color(0xfff5435d), ),),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return feedBack();
                  }
                  )
                  );
              },
            ),
        )
        ]
        )
      // body: ConcentricPageView(
      //   colors: data.map((e) => e.backgroundColor).toList(),
      //   itemCount: data.length,
      //   itemBuilder: (int index, double value) {
      //     return CardPlanet(data: data[index]);
          
      //   },
      // ),
    
    );

  }
}
