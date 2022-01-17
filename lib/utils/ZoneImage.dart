import 'package:flutter/material.dart';


class ZoneImage extends StatelessWidget {
  final String image;
  final String text;
  const ZoneImage({
    Key? key,
    required this.image,
    required this.text,
  }) : super(key: key);
 

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0,),
        child: Column(
           mainAxisSize: MainAxisSize.min,
          children:<Widget> [
              Image.asset(
                    image,
                    width: 80,
                    height: 70, ),

                    Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      text,
                      style:
                       TextStyle(
                         //backgroundColor:  Color.fromRGBO(14, 106, 38, 0.4),
                            color:  Color.fromRGBO(14, 106, 176, 5),
                             fontWeight: FontWeight.bold,
                             fontSize: 20,),
                              textAlign: TextAlign.center,
                      ),
                     
                    ),
                  
        ],
        ),
      ),
    );
  }
}
