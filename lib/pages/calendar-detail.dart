import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarDetailPage extends StatelessWidget{
  var data;
  CalendarDetailPage(this.data);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text(data["title"]),
      ),
      body: new Container(
        margin: new EdgeInsets.all(10.0),
        child: new Material(
          elevation: 4.0,
          borderRadius: new BorderRadius.circular(6.0),
          child: new ListView(
            children: <Widget>[
              getBody(data),
            ],
          ),
        ),
      ),
    );
  }

  Widget getBody(data){
    return new Container(
      margin: new EdgeInsets.all(15.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          getTittle(data["title"]),
          getDate(data["begin"], data['end']),
          getLocal(data["local"]),
          // getColor(data["color"]),
          getDescription(data["description"]),
          getAuthor(data["author"]),
        ],
      ),
    );
  }

  getTittle(title) {
    return new Text(title,
    style: new TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0),
    );
  }

  getDate(begin, end) {
    return new Container(
      margin: new EdgeInsets.only(top: 4.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Text(
            new DateFormat("dd/MM/yyyy HH:mm").format(DateTime.parse(begin)) + " - " + new DateFormat("dd/MM/yyyy HH:mm").format(DateTime.parse(end)),
            style: new TextStyle(
                fontSize: 12.0,
                color: Colors.grey
            ),
          ),
        ],
      ),
    );
  }

  getAuthor(author) {
    return new Container(
      margin: new EdgeInsets.only(top: 4.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Text(
            author,
            style: new TextStyle(
                fontSize: 10.0,
                color: Colors.grey
            ),
          ),
        ],
      ),
    );
  }

  getDescription(text) {
    return new Container(
      margin: new  EdgeInsets.only(top: 20.0),
      child: new Text(text),
    );
  }

  getLocal(text) {
    return new Container(
      margin: new  EdgeInsets.only(top: 20.0),
      child: new Text(text),
    );
  }

  getColor(text) {
    return new Container(
      margin: new  EdgeInsets.only(top: 20.0),
      child: new Text(text),
    );
  }

}