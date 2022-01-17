
import 'package:chatapp/Chat_App/screens_chats/auth_screen.dart';
import 'package:chatapp/Chat_App/screens_chats/chat_screen.dart';
import 'package:chatapp/Chat_App/screens_chats/splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
class Chatpage extends StatelessWidget {
  const Chatpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.blue,
        accentColor: Colors.deepPurple,
        accentColorBrightness: Brightness.dark,
        buttonTheme: ButtonTheme.of(context).copyWith(
          buttonColor: Colors.blue,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),

      ),
      home: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder: (ctx, snapShot){
        if(snapShot.connectionState ==ConnectionState.waiting){
          return SplashScreen();
        }
        if(snapShot.hasData){
          return ChatScreen();
        }else{
          return AuthScreen();
        }
      },),
    );
  }
}
