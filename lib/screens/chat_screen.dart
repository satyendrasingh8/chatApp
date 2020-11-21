import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
            stream: Firestore.instance
                .collection('chats/qlxlom4AuKMJNjSo3w4a/messages')
                .snapshots(),
            builder: (ctx, streamSnapShot) {
              if (streamSnapShot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              final Documents = streamSnapShot.data.documents;
              return ListView.builder(
                itemCount: Documents.length,
                itemBuilder: (ctx, index) => Container(
                  padding: EdgeInsets.all(8),
                  child: Text(Documents[index]['text']),
                ),
              );
            }),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Firestore.instance
                  .collection('chats/qlxlom4AuKMJNjSo3w4a/messages')
                  .add({'text': 'this was addded bi clicking the button4!'});
            }));
  }
}
