import 'package:flutter/material.dart';
import 'package:task_manager/Theme/colors.dart';
import 'package:task_manager/model/event.dart';

class AddTask extends StatefulWidget {
  final Event event;

  const AddTask({Key key, this.event}) : super(key: key);

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  DateTime fromDate;
  DateTime toDate;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.event == null) {
      toDate = DateTime.now().add(Duration(hours: 2));
      fromDate = DateTime.now();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.LightYellow,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              DecoratedBox(
                child: Container(
                  height: 30,
                ),
                decoration: BoxDecoration(
                  color: MyColors.DarkYellow,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                ),
              ),
              Column(
                children: [
                  Container(
                      child: DecoratedBox(
                    child: Container(
                      height: 280,
                      width: MediaQuery.of(context).size.width,
                      child: Column(children: [Text("fafafaf")],),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        color: MyColors.DarkYellow),
                  )),
                  Column(

                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
