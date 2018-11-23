import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class DetailPage extends StatelessWidget{
  var data;
  DetailPage(this.data);

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
             new Padding(
              padding:
                  new EdgeInsets.only(top: 8.0),
              child: new SizedBox(
                height: 100.0,
                width: 100.0,
                child: new Image.network(
                  data["image_url"],
                  fit: BoxFit.cover,
                ),
              ),
            ),
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
          getDate(data["created_at"]),
          getAuthor(data["author"]),
          getDescription(data["text"]),
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

  getDate(date) {
    return new Container(
      margin: new EdgeInsets.only(top: 4.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Text(
            timeago.format(DateTime.parse(date), locale: "pt_BR"),
            style: new TextStyle(
                fontSize: 10.0,
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

}