import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewMessages extends StatefulWidget {
  const NewMessages({Key? key}) : super(key: key);

  @override
  _NewMessagesState createState() => _NewMessagesState();
}

class _NewMessagesState extends State<NewMessages> {
  final _controller = TextEditingController();
  String _enteredMessage = '';

  _sendMessage() async{
    FocusScope.of(context).unfocus();
    final user =  FirebaseAuth.instance.currentUser;
    final userData = await FirebaseFirestore.instance.collection('users').doc(user!.uid).get();
    //send= Message Here
    FirebaseFirestore.instance.collection('chat').add({
      'text':_enteredMessage,
      'creatadAt': Timestamp.now(),
      'username': userData['username'],
       'userId': user.uid,
      'userImage': userData['image_url'],
        });
    _controller.clear();
    setState(() {
      _enteredMessage = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
              child: TextField(
                autocorrect: true,
                textCapitalization: TextCapitalization.sentences,
                enableSuggestions: true,
               controller: _controller,
               decoration: InputDecoration(labelText: 'Send a message...'),
               onChanged: (val){
                 setState(() {
                   _enteredMessage = val;
                 });
               },
              ),
          ),
          IconButton(
            color: Theme.of(context).primaryColor,
              onPressed: _enteredMessage.trim().isEmpty ? null : _sendMessage,
              icon: Icon(Icons.send),
          ),
         ],
      ),
    );
  }
}
