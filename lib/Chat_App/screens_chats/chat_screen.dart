import 'dart:async';

import 'package:chatapp/Chat_App/chats/messages.dart';
import 'package:chatapp/Chat_App/chats/new_messages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  @override
  void initState(){
    super.initState();
    final fbm = FirebaseMessaging.instance;

    fbm.requestPermission();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });

    fbm.subscribeToTopic('chat');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter Chat'),
        actions: [
          DropdownButton(
              items: [
                DropdownMenuItem(child: Row(children: [
                  Icon(Icons.exit_to_app),
                  SizedBox(width: 8),
                  Text('Logout')
                ],),
                  value: 'logout',
                ),
              ],

              icon: Icon(Icons.more_vert,color: Theme.of(context).primaryIconTheme.color,
              ),
              onChanged: (itemIdentifier){
                if(itemIdentifier == 'logout'){
                  FirebaseAuth.instance.signOut();
                }
              }),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(child: Messages()),
            NewMessages(),
          ],
        ),
      ),

      // print(event.docs[0]['text']);
      /* event.docs.forEach((element) {
             print(element['text']);
           });*/





    );
  }
}
