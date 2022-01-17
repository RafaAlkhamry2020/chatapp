import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  final String Image;

  const ImageSlider({Key? key, required this.Image, }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.12 / 1,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(Image),
              fit: BoxFit.cover,
            )
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(begin: Alignment.bottomLeft,
                  colors: [Color(0xFFF101113).withOpacity(0.8),
                    Color(0xFFF101113).withOpacity(0.1)
                  ])
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              /////////////////// circle image story


            ],

          ),
        ),

      ),
    );


  }
}
