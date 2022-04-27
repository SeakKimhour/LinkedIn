import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import '../../Data/dummy_data.dart';
import '../../models/chat.dart';
import '../main_page.dart';
import 'package:floating_pullup_card/floating_pullup_card.dart';

class MessagePage extends StatefulWidget {
  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  List<Chat> chatInfo = chat;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Messaging",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.grey),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MainPage()));
          },
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert, color: Colors.grey)),
          IconButton(
              onPressed: () {},
              icon: Icon(FontAwesome.pencil_squared, color: Colors.grey)),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey,
          alignment: Alignment.topCenter,
          child: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Icon(Icons.search),
                            Text("Search messages")
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {});
                          },
                          icon: Icon(Icons.menu))
                    ],
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => _buildItem(chatInfo[index]),
                  itemCount: chatInfo.length,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildItem(Chat chatItem) {
    return Container(
      decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey, width: 1))),
      child: Row(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(chatItem.urlProfile),
                ),
              ),
              chatItem.active
                  ? Positioned(
                      bottom: 1,
                      right: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CircleAvatar(
                          radius: 5,
                          backgroundColor: Color.fromARGB(255, 95, 224, 99),
                        ),
                      ),
                    )
                  : Container(),
              chatItem.active
                  ? Positioned(
                      bottom: 3,
                      right: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CircleAvatar(
                          radius: 3,
                          backgroundColor: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(chatItem.nameChat),
                    Text(
                      chatItem.lastDate,
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "You : ${chatItem.lastChat}",
                style: TextStyle(fontSize: 10),
              )
            ],
          )
        ],
      ),
    );
  }
}
