import 'package:flutter/material.dart';
import 'package:flutter_calendar/flutter_calendar.dart';
// import 'package:calendar_views/calendar_views.dart';

// import 'days_page_view_example.dart';
// import 'day_view_example.dart';
// import 'month_page_view_example.dart';
// import 'month_view_example.dart';

class CalendarScreen extends StatelessWidget {
  static const String routeName = "/calendar";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Calendario"),
      ),
      body: new Builder(builder: (BuildContext context) {
          return new ListView(
          children: <Widget>[
              new Calendar(
                isExpandable: true,
                dayBuilder: (BuildContext context, DateTime day) {
                  return new InkWell(
                    onTap: () => print("OnTap"),
                    child: new Container(
                      decoration: new BoxDecoration(
                          border: new Border.all(color: Colors.black38)),
                      child: new Text(
                        day.day.toString(), 
                      ),
                    ),
                  );
                },
              ),
              new Divider(height: 0.0),
              new ListView(
                shrinkWrap: true,
                children: <Widget>[
                ]
              ),
            ],
          );
      }),
    );
  }

  // void _showWidgetInFullScreenDialog(BuildContext context, Widget widget) {
  //   Navigator.of(context).push(
  //     new MaterialPageRoute(
  //       fullscreenDialog: true,
  //       builder: (BuildContext context) {
  //         return widget;
  //       },
  //     ),
  //   );
  // }
}