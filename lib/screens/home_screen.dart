import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:task_manager/Theme/colors.dart';
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
      backgroundColor: MyColors.LightYellow,
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          barSliver(width),
          makeHeader(),
        ],
      )),
    );
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
}
