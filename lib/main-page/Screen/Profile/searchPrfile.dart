import 'package:clone_linkin/main-page/Screen/Profile/profile.dart';
import 'package:clone_linkin/main-page/Screen/qrcode.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../Data/dummy_data.dart';

class SearchProfile extends StatelessWidget {
  List<String> history = recentsearch;
  List<String> recent = trySearch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black45,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          },
        ),
        backgroundColor: Colors.white,
        title: TextField(
          decoration: InputDecoration(
            hintText: "Search",
          ),
          cursorColor: Colors.black,
          cursorHeight: 20,
          showCursor: true,
          enableSuggestions: true,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QRCodePage()),
                );
              },
              icon: Icon(
                Icons.qr_code,
                color: Colors.black45,
              )),
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(right: 8, left: 8, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("recent searches"),
                    TextButton(onPressed: () {}, child: Text("Clear"))
                  ],
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: history.length,
                  itemBuilder: (context, index) => InkWell(
                        onTap: () {},
                        child: Container(
                          width: double.maxFinite,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 10, right: 10),
                                    height:
                                        MediaQuery.of(context).size.width * 0.1,
                                    child: Icon(
                                      Icons.access_time_outlined,
                                      size: 15,
                                    ),
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.width *
                                        0.04,
                                    child: Text(
                                      history[index],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Icon(
                                  CupertinoIcons.arrow_up_left,
                                  size: 15,
                                ),
                              )
                            ],
                          ),
                        ),
                      )),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 15, top: 10, bottom: 10),
                child: Text("Try searching for"),
              ),
              ListView.builder(
                itemCount: recent.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => InkWell(
                  onTap: () {},
                  child: Container(
                    width: double.maxFinite,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10, right: 10),
                              height: MediaQuery.of(context).size.width * 0.1,
                              child: Icon(
                                Icons.search,
                                size: 15,
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.width * 0.04,
                              child: Text(
                                recent[index],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Icon(
                            CupertinoIcons.arrow_up_left,
                            size: 15,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
