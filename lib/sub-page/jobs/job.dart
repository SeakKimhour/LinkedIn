import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../Data/dummy_data.dart';
import '../../models/jobDetail.dart';

class JobPage extends StatefulWidget {
  @override
  State<JobPage> createState() => _JobPageState();
}

class _JobPageState extends State<JobPage> {
  List<Jobs> jobLst = jobdetail;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      color: HexColor("#f3f2ee"),
      child: Container(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "My Jobs",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text("See all"),
                  )
                ],
              ),
            ),
            Card(
              color: Colors.white,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Recent searches",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text("Clear"),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "web developer",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "2 new",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Voat Phnum,Phnoom Penh,Cambodia",
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                children: [
                  ListView.builder(
                    itemCount: jobLst.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) =>
                        _buildJobRecommend(jobLst[index]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildJobRecommend(Jobs jobItem) {
    return Card(
      child: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.1,
                  height: MediaQuery.of(context).size.width * 0.1,
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: CircleAvatar(
                        radius: 90,
                        backgroundImage: NetworkImage(jobItem.jobProfileUrl),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: 10, bottom: 0, right: 0, top: 0),
                        width: MediaQuery.of(context).size.width * 0.65,
                        height: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Text(
                                jobItem.title,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 11),
                              ),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.bookmark_outline))
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          jobItem.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 11),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 50),
              child: Text(
                jobItem.location,
                style: TextStyle(fontSize: 10),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 50),
              child: Row(
                children: [
                  Text(
                    jobItem.date + " Day",
                    style: TextStyle(fontSize: 10),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 4,
                    height: 4,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black45,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '${jobItem.application.toString()} applications',
                    style: TextStyle(fontSize: 10, color: Colors.green),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
