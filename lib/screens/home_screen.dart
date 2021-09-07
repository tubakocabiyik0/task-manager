import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:task_manager/Theme/colors.dart';
import 'package:task_manager/screens/calendar_screen.dart';
import 'package:task_manager/widgets/active_projects_card.dart';
import 'package:task_manager/widgets/calender_button.dart';
import 'package:task_manager/widgets/leadings.dart';
import 'package:task_manager/widgets/sliver_app_bar_delegate.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double profileValue = 55;
  double myValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myValue = profileValue / 100;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: MyColors.LightYellow,
        body: SafeArea(
            child: ListView(
          children: [
            CustomScrollView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              slivers: [
                barSliver(width),
                makeHeader(),
              ],
            ),
            SingleChildScrollView(
              child: Container(
                height: height * 0.1,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.05),
                      child: Text(
                        "My Tasks",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 27),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.42),
                      child: GestureDetector(
                        onTap:(){
                          Navigator.push(context,MaterialPageRoute(builder: (context) => CalendarPage()));
                        },
                        child: CalenderButton(
                            MyColors.Green, Icons.calendar_today, 30),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Leadings(MyColors.Red, Icons.access_time_rounded, 25, "To Do",
                "5 tasks now"),
            SizedBox(
              height: height * 0.01,
            ),
            Flexible(
                child: Leadings(MyColors.DarkYellow, Icons.create, 25,
                    "In Progress", "1 task now")),
            SizedBox(
              height: height * 0.01,
            ),
            Leadings(MyColors.Blue, Icons.done_all, 25, "Done", "20 tasks now"),
            SizedBox(
              height: height * 0.01,
            ),
            Padding(
              padding: EdgeInsets.only(right: width *0.5),
              child: Text(
                "Active Projects",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            activeProjectsCards(),
          ],
        )));
  }

  SliverFixedExtentList barSliver(double width) {
    return SliverFixedExtentList(
      itemExtent: 100.0,
      delegate: SliverChildListDelegate(
        [
          DecoratedBox(
            decoration: BoxDecoration(
                color: MyColors.DarkYellow,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40))),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: width * 0.05),
                  child: Icon(
                    Icons.menu,
                    color: Colors.black,
                    size: 35,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.7),
                  child: Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 35,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SliverPersistentHeader makeHeader() {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverAppBarDelegate(
          minHeight: 110.0,
          maxHeight: 110.0,
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: MyColors.DarkYellow,
                borderRadius: BorderRadius.only(
                  //topLeft: Radius.circular(40),
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                )),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 35, bottom: 10),
                  child: CircularPercentIndicator(
                    radius: 90,
                    lineWidth: 5,
                    percent: myValue,
                    animation: true,
                    backgroundColor: MyColors.DarkYellow,
                    progressColor: MyColors.Red,
                    circularStrokeCap: CircularStrokeCap.round,
                    center: CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage('assets/images/avatar.png'),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.06,
                          top: MediaQuery.of(context).size.height * 0.03),
                      child: Text(
                        "Gülben Derenoğlu",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 22),
                      ),
                    ),
                    Text(
                      "App Developer",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }

  activeProjectsCards() {
    return Flexible(
      child: GridView(
        shrinkWrap: true,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        scrollDirection: Axis.vertical,
        children: List.generate(4, (index) {
          return ProjectCards(MyColors.Blue, 0.75, "Write code");
        }),

        //  ProjectCards(MyColors.Red, 0.75, "Write code"),
        //ProjectCards(MyColors.Red, 0.75, "Write code"),
      ),
    );
  }
}
