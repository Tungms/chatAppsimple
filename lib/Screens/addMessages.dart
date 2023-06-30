import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddMessages extends StatefulWidget {
  const AddMessages({required this.myID});
  final String myID;

  @override
  State<AddMessages> createState() => _AddMessagesState();
}

class _AddMessagesState extends State<AddMessages> {
  final userIDController = TextEditingController();
  final emailController = TextEditingController();
  final CollectionReference dbmsgs = FirebaseFirestore.instance.collection('messages');

  @override
  void dispose() {
    userIDController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add User'),
      ),
      body: Column(
        children: [
          SizedBox(height: 32),
          Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Text('ID: ', style: TextStyle(fontSize: 16), textAlign: TextAlign.center,)),
              Expanded(
                flex: 6,
                child: TextFormField(
                  controller: userIDController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                    labelText: 'Nickname',
                  ),
                ),
              ),
              SizedBox(width: 8,)
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Text('Email Address: ', style: TextStyle(fontSize: 16), textAlign: TextAlign.center,)),
              Expanded(
                flex: 6,
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                    labelText: 'Email Address',
                  ),
                ),
              ),
              SizedBox(width: 8,)
            ],
          ),
          SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              dbmsgs.doc(widget.myID).set({
                'ReceiverMail: ': emailController.text.trim(),
                'SenderID: ': widget.myID
              });
            },
            child: Container(
              margin: EdgeInsets.only(left: 32, right: 32, top: 16),
              height: 48,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(24)
              ),
              child: Center(child: Text('Send', style: TextStyle(color: Colors.white, fontSize: 24))),
            ),
          )
        ],
      ),
    );
  }
}
