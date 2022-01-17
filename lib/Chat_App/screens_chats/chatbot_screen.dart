import 'package:chatapp/Chat_App/widgets/chatapp.dart';
import 'package:chatapp/Chat_App/widgets/chatbot.dart';
import 'package:chatapp/main.dart';

import 'package:flutter/material.dart';

class Chat_screen extends StatefulWidget {
  Chat_screen({Key? key}) : super(key: key);


  //final String title;

  @override
  _Chat_screen createState() => _Chat_screen();
}

class _Chat_screen extends State<Chat_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.only(left:1),
            child:Row(
              children: [
                IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));

                },
                    icon: Icon(Icons.arrow_back))
              ],
            ),
          ),
         actions: [
           IconButton(
               onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Chatpage()));},
               icon: Icon(Icons.chat))
         ],

         centerTitle: true,
           title: Text('ChatBot', style:TextStyle(fontWeight: FontWeight.bold, color: Colors.white, wordSpacing: 1) ,),
        ),
        body: Center(
            child: Chat())
    );
  }
}
