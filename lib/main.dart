import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';

import './pages/news.dart';
import './pages/videos.dart';
import './pages/calendar.dart';
import './pages/map.dart';
import './pages/lesson.dart';
import './pages/index.dart';
import './pages/contact.dart';

void main() {
  timeago.setLocaleMessages('pt_BR', timeago.PtBrMessages());
  final Connectivity _connectivity = Connectivity();

  check() {
    try {
      _connectivity.checkConnectivity();
      print('>>>>>>>> Has internet');
      return new IndexScreen();
    } on PlatformException catch (e) {
      print('>>>>>>>> Not has internet');
      return Scaffold(
        appBar: AppBar(
          title: const Text('Betel na Rede'),
        ),
        body: Center(child: Text('Voce precisa de conexão com a internet.')),
      );
    }
  }

  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: check(), 
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