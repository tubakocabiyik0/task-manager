import 'package:flutter/material.dart';
import 'package:task_manager/widgets/calender_button.dart';

class Leadings extends StatelessWidget {
  Color color;
  IconData icon;
  double radius;
  String title;
  String subtitle;

  Leadings(this.color, this.icon, this.radius, this.title, this.subtitle);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CalenderButton(color,icon,radius),
      title: Text(title,style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
      ),
      subtitle: Text(subtitle,style: TextStyle(fontWeight: FontWeight.w400, fontSize: 22)),
    );
  }
}
