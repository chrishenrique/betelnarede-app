import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import './pages/news.dart';
import './pages/videos.dart';
import './pages/calendar.dart';
import './pages/map.dart';
import './pages/lesson.dart';
import './pages/index.dart';
import './pages/contact.dart';

void main() {
  timeago.setLocaleMessages('pt_BR', timeago.PtBrMessages());
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new IndexScreen(), // route for home is '/' implicitly
    routes: <String, WidgetBuilder>{
      // define the routes
      CalendarScreen.routeName: (BuildContext context) => new CalendarScreen(),
      NewsScreen.routeName: (BuildContext context) => new NewsScreen(),
      // VideosScreen.routeName: (BuildContext context) => new VideosScreen(),
      LessonScreen.routeName: (BuildContext context) => new LessonScreen(),
      MapScreen.routeName: (BuildContext context) => new MapScreen(),
      ContactScreen.routeName: (BuildContext context) => new ContactScreen(),
    },
  ));
}