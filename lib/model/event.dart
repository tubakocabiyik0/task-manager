import 'dart:ui';

class Event {
  final String title;
  final String desc;
  final DateTime from;
  final DateTime to;
  final Color bc;
  final bool isAllDay;

  const Event(
      {this.title,
      this.desc,
      this.from,
      this.to,
      this.bc,
      this.isAllDay = false});
}
