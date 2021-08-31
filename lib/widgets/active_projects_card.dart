import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProjectCards extends StatelessWidget {
  Color color;
  double loadingPercent;
  String title;


  ProjectCards(this.color, this.loadingPercent, this.title);

  @override
  Widget build(BuildContext context) {
    return
      Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        elevation: 0,
        color:color ,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top:30.0),
            child: CircularPercentIndicator(
            animation: true,
            radius: 75.0,
            percent: loadingPercent,
            lineWidth: 5.0,
            circularStrokeCap: CircularStrokeCap.round,
            backgroundColor: Colors.white10,
            progressColor: Colors.white,
            center: Text(
              '${(loadingPercent*100).round()}%',
              style: TextStyle(
                  fontWeight: FontWeight.w700, color: Colors.white),
            ),
        ),
          ),

        Text(title,style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),)
        ],),
    ) ;
  }
}
