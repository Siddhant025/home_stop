import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:home_stop/constants.dart';

class ChatScreen extends StatefulWidget {
  static const String id='chatscreen';
  ChatScreen({Key key,this.loggedInUser}) : super(key: key);
  final FirebaseUser loggedInUser;// update the constructor to include the uid
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  final _firestore = Firestore.instance;
  String TextMessage;
  final messageController=TextEditingController();

  void messageStream() async{
    await for(var snapshot in _firestore.collection("users").document(widget.loggedInUser.uid).collection("messages").snapshots()){
      for(var message in snapshot.documents){
        print(message.data);
      }
    }
  }


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        leading: null,
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection("users").document(widget.loggedInUser.uid).collection("messages").snapshots(),
              builder: (context,snapshot){
                if(!snapshot.hasData){
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.blueAccent,
                    ),
                  );
                }
                final messages=snapshot.data.documents.reversed;
                List<Messagebubble> messagebubbles=[];
                for(var message in messages){
                  final messageText=message.data['text'];
                  final messageSender=message.data['Sender'];

                  final currentUser = widget.loggedInUser.email;

                  final messagebubble=Messagebubble(
                    text: messageText,
                    sender: messageSender,
                    isMe: currentUser == messageSender,
                  );
                  messagebubbles.add(messagebubble);
                }
                return Expanded(
                  child: ListView(
                    reverse: true,
                    children: messagebubbles,
                    padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                  ),
                );
              },
            ),
            Container(
             decoration: kMessageContainerDecoration,
             child: Row(
               crossAxisAlignment: CrossAxisAlignment.center,
               children: <Widget>[
                 Expanded(
                   child: TextField(
                     controller: messageController,
                     style: TextStyle(color: Colors.white),
                     onChanged: (value){
                       TextMessage=value;
                     },
                     decoration: kMessageTextFieldDecoration,
                   ),
                 ),
                 FlatButton(
                   onPressed: (){
                     messageController.clear();
                     _firestore.collection("users").document(widget.loggedInUser.uid).collection("messages").add(
                       {'text':TextMessage,'Sender':widget.loggedInUser.displayName});
                   },
                   child: Text(
                     'Send',
                     style: kSendButtonTextStyle,
                   ),
                 ),
               ],
             ),
            )
          ],
        ),
      ),
    );
  }
}


class Messagebubble extends StatelessWidget {
  Messagebubble({
    @required this.text,
    @required this.sender,
    this.isMe,
  });
  @override
  final String text;
  final String sender;
  final bool isMe;

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment:
        isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            sender,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Material(
            borderRadius: isMe
                ? BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            )
                : BorderRadius.only(
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            elevation: 5,
            color: isMe ? Colors.lightBlueAccent : Colors.cyanAccent,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 25,
                  color: isMe ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

