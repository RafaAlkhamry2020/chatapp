import 'dart:io';


import 'package:chatapp/Chat_App/widgets/messages_bubbles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('chat').orderBy('creatadAt', descending: true).snapshots(),
      builder: (ctx,AsyncSnapshot snapShot) {
        if(snapShot.connectionState == ConnectionState.waiting){
          return CircularProgressIndicator();
        }
        final docs = (snapShot.data! as QuerySnapshot).docs; //snapShot.data!.docs;
        final user = FirebaseAuth.instance.currentUser;
        return ListView.builder(
          reverse: true,
          itemBuilder: (ctx, index)=> MessageBubble(
            docs[index]['text'],
            docs[index]['username'],
            docs[index]['userImage'],
             docs[index]['userId']== user!.uid,
            key: ValueKey(docs[index].id),
          ),
          itemCount: docs.length,
        );
      },
    );
  }
}
