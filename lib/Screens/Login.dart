import 'package:chatappsimple/Screens/ListMessages.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatApp extends StatefulWidget {

  const ChatApp();
  @override
  State<ChatApp> createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  final userIDController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final CollectionReference dbUsers = FirebaseFirestore.instance.collection('Users');
  String userID = '';

  @override
  void dispose() {
    userIDController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('ChatAppSimple'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                  )
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Text('Username: ', style: TextStyle(fontSize: 16)),
                  Expanded(
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                        labelText: 'Email Address',
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Text('Password: ', style: TextStyle(fontSize: 16)),
                  Expanded(
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                        labelText: 'Password',
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  SignIn();
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.blue
                  ),
                  child: Center(child: Text('Login', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)),
                ),
              )
            ],
          ),
        )
      ),
    );
  }

  Future SignIn() async {
    try {
      var userCheck = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim()
      );
      if (userCheck != null) {
        dbUsers.doc(userCheck.user!.uid).set({
          'Username': userIDController.text.trim(),
          'Email': emailController.text.trim()
        });
        userID = userCheck.user!.uid;
        print('userID = $userID');
        Navigator.push(context, MaterialPageRoute(builder: (context) => ListMessages(myID: userID)));
      }
    } catch (e) {
      print('Something error!!!');
    }
  }
}
