import 'package:flutter/material.dart';

import './calendar.dart';
import './map.dart';
import './lesson.dart';
import './news.dart';
// import './videos.dart';
import './home.dart';
import './contact.dart';

class IndexScreen extends StatefulWidget {
  @override
  IndexScreenState createState() => new IndexScreenState();
}

class IndexScreenState extends State<IndexScreen> {
  Drawer getNavDrawer(BuildContext context) {
    var headerChild = new DrawerHeader(
      child: new Text(
        "Igreja Batista Betel",
        textAlign: TextAlign.right,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),  
      ),
      decoration: new BoxDecoration(
        image: new DecorationImage(
            image: new AssetImage("assets/images/fundo.png"),
            fit: BoxFit.fill
        )
      ),
    );
    var aboutChild = new AboutListTile(
      child: new Text("Sobre"),
      applicationName: "Betel app",
      applicationVersion: "v0.0.1",
      applicationIcon: new Icon(Icons.adb),
      icon: new Icon(Icons.info)
    );

    ListTile getNavItem(var icon, String s, String routeName) {
      return new ListTile(
        leading: new Icon(icon),
        title: new Text(s),
        onTap: () {
          setState(() {
            // pop closes the drawer
            Navigator.of(context).pop();
            // navigate to the route
            Navigator.of(context).pushNamed(routeName);
          });
        },
      );
    }

    var myNavChildren = [
      headerChild,
      // getNavItem(Icons.home, "Home", "/"),
      getNavItem(Icons.today, "Calendario", CalendarScreen.routeName),
      getNavItem(Icons.note, "Noticias", NewsScreen.routeName),
      // getNavItem(Icons.video_library, "Videos", VideosScreen.routeName),
      getNavItem(Icons.book, "Lições", LessonScreen.routeName),
      getNavItem(Icons.map, "Mapa", MapScreen.routeName),
      getNavItem(Icons.forum, "Fale Conosco", ContactScreen.routeName),
      new Divider(),
      aboutChild
    ];

    ListView listView = new ListView(children: myNavChildren);

    return new Drawer(
      child: listView,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Betel na Rede"),
      ),
      body: new HomePage(),
      drawer: getNavDrawer(context),
    );
  }
}