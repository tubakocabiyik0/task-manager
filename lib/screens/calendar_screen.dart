import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:task_manager/Theme/colors.dart';
import 'package:task_manager/screens/home_screen.dart';

import 'add_task_screen.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MyColors.LightYellow,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: MyColors.Red,
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddTask()));
        },
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MyColors.LightYellow,
        leading: BackButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: height * 0.02, left: width * 0.05),
                      child: Text(
                        'Today',
                        style: TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.36, top: height * 0.03),
                      child: FlatButton(
                          minWidth: width * 0.34,
                          height: height * 0.06,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          },
                          color: MyColors.Green,
                          child: Text(
                            "Add task",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 19),
                          )),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: width * 0.58),
                child: Text(
                  "Prodactive Day",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              calendarView(),
            ],
          ),
        ),
      ),
    );
  }

  calendarView() {
    return Container(
      height: 550,
      child: Padding(
        padding:
            EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.04),
        child: SfCalendar(
          //view: CalendarView.week,
          allowedViews: [
            CalendarView.day,
            CalendarView.week,
            CalendarView.schedule
          ],
          initialSelectedDate: DateTime.now(),
          backgroundColor: MyColors.LightYellow,
          todayHighlightColor: MyColors.Red,
          selectionDecoration: BoxDecoration(
            border: Border.all(color: MyColors.Red),
          ),
          timeSlotViewSettings: TimeSlotViewSettings(timeIntervalHeight: 80),
        ),
      ),
    );
  }
}
