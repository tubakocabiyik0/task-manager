import 'package:flutter/material.dart';
import 'package:task_manager/Theme/colors.dart';
import 'package:task_manager/Utils/utils.dart';
import 'package:task_manager/model/event.dart';
import 'package:task_manager/screens/calendar_screen.dart';

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
    final titleController = TextEditingController();
    final dateController = TextEditingController();
    bool auto;

    setState(() {
      auto = false;
    });
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
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 330, top: 15),
                            child: BackButton(
                              color: Colors.black,
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => CalendarPage()));
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 125, top: 10),
                            child: Text(
                              "Create New Task",
                              style: TextStyle(
                                  fontSize: 30.0, fontWeight: FontWeight.w700),
                            ),
                          ),
                          titleAndDate(titleController,dateController, auto, fromDate),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        color: MyColors.DarkYellow),
                  )),
                  Column()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  titleAndDate(
      TextEditingController titleController,TextEditingController dateController, bool auto, DateTime fromDate,) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 22, right: 10),
          child: TextFormField(
            validator: (text) => text.isEmpty ? 'cant be empty' : null,
            // ignore: deprecated_member_use
            autovalidate: auto,
            controller: titleController,
            decoration: InputDecoration(
              labelText: "title",
              labelStyle: TextStyle(color: Colors.black38, fontSize: 20),
              hoverColor: MyColors.PalePink,
              fillColor: MyColors.PalePink,
              focusColor: MyColors.PalePink,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black38),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black38),
              ),
            ),
          ),
        ),
        date(fromDate,dateController),
      ],
    );
  }

  date(DateTime fromDate, TextEditingController dateController) {
    return Padding(
      padding: const EdgeInsets.only(left: 22.0, right: 200),
      child: TextFormField(
        //controller: dateController,
        initialValue: Utils.toDate(fromDate).toString(),
        enabled: false,
        decoration: InputDecoration(
          suffix: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.black,
          ),
          labelText: "date",
          labelStyle: TextStyle(color: Colors.black38, fontSize: 20),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black38),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black38),
          ),
        ),
      ),
    );
  }
}
