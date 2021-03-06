import 'package:clone_linkin/main-page/Screen/search.dart';
import 'package:flutter/material.dart';

class QRCodePage extends StatefulWidget {
  @override
  State<QRCodePage> createState() => _QRCodePageState();
}

class _QRCodePageState extends State<QRCodePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color.fromARGB(255, 160, 159, 159),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchPage()));
            },
          ),
          backgroundColor: Colors.white,
          bottom: const TabBar(
            
            unselectedLabelColor: Color.fromARGB(255, 160, 159, 159),
            labelColor: Color.fromARGB(255, 121, 219, 125),
            
            tabs: [
              Tab(

                child: Text("My code"),
              ),
              Tab(
                child: Text("Scan"),
              ),
            ],
          ),
          title: const Text(
            'LinkedIn QR code',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Color.fromARGB(196, 218, 217, 217),
              child: Stack(alignment: Alignment.topCenter, children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.25,
                        margin: EdgeInsets.only(top: 50),
                        alignment: Alignment.center,
                        child: Container(
                          margin: EdgeInsets.only(top: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Seak Kimhour",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Student at kirirom Institute of Technology",
                                style: TextStyle(fontSize: 10),
                              ),
                              Image.asset("assets/qrcode.png"),
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.share,
                            size: 20,
                          ),
                          Text("Share my code"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.download,
                              size: 20,
                            ),
                            Text("Save to gallery"),
                          ]),
                    )
                  ],
                )
              ]),
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Click to scan",
                  style: TextStyle(fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }
}
