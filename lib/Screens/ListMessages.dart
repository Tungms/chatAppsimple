import 'package:chatappsimple/Screens/addMessages.dart';
import 'package:flutter/material.dart';

class Message {
  final String sender;
  final String lastMessage;
  Message({required this.sender, required this.lastMessage});
}

class ListMessages extends StatefulWidget {
  const ListMessages({required this.myID});
  final String myID;

  @override
  State<ListMessages> createState() => _ListMessagesState();
}

class _ListMessagesState extends State<ListMessages> {
  List<Message> _listMessage = [
    Message(sender: 'sender', lastMessage: 'lastMessage')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 16,right: 12, left: 12),
        child: Stack(
          children: [
            Container(
            child: StreamBuilder(
              builder: (context, snapshot) {
                return ListView.builder(
                    itemCount: _listMessage.length,
                    itemBuilder: (context, index) {
                      final message = _listMessage[index];
                      return Container(
                        child: GestureDetector(
                          onTap: () {
                            print('print messages');
                          },
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(20)),
                                width: 40,
                                height: 40,
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('User'),
                                    Text('lastMessage')
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }
                );
              },
            ),
          ),
            Positioned(
              bottom: 16,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AddMessages(myID: widget.myID)));
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: Colors.blueAccent),
                  child: Icon(Icons.add, size: 32),
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }
}
