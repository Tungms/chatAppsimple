import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen();

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Username'),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: Text('this is chat body')
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      onTap: () {

                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                        labelText: 'Say something ^^'
                      ),
                    )
                  ),
                  SizedBox(width: 8,),
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(22)
                    ),
                    child: Icon(Icons.send)
                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}
