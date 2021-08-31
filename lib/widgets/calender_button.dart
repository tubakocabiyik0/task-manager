import 'package:flutter/material.dart';
import 'package:task_manager/Theme/colors.dart';

class CalenderButton extends StatelessWidget {
  Color color;
  IconData icon;
  double radius;


  CalenderButton(this.color, this.icon, this.radius);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: color,
      child: Icon(
        icon,
        color: Colors.white,
        size: 27,
      ),
    );
  }
}
