import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:core';
import './calendar-detail.dart';
import 'package:intl/intl.dart';

class CalendarScreen extends StatefulWidget {
  static const String routeName = "/calendar";
  CalendarScreen({Key key}) : super(key: key);

  @override
  _CalendarScreenState createState() => new _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  var data;

  Future getData() async {
    // var response = http.get(new Uri.http('betelnarede.com:8000', '/api/news'));
    // var localData = jsonDecode(response.body);

    var response = '[{"id":10,"author_id":1,"author":"Christiano H.","title":"Acampamento de Jovens 2019","begin":"2018-11-04 12:00:00","end":"2018-11-08 16:00:00","local":"Sede Campestre","color":"#00000","description":"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.","created_at":"2018-11-02 18:39:32","updated_at":"2018-11-02 18:39:32"},{"id":11,"author_id":1,"author":"Christiano H.","title":"Conferência de Aniversário","begin":"2018-11-04 18:00:00","end":"2018-11-04 20:00:00","local":"Rua Larangeiras, 45, Durval de Barros - Contagem","color":"#00000","description":"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.","created_at":"2018-11-02 18:39:32","updated_at":"2018-11-02 18:39:32"},{"id":12,"author_id":1,"author":"Christiano H.","title":"Culto de Casais","begin":"2018-12-04 10:00:00","end":"2018-1122 12:00:00","local":"Rua Larangeiras, 45, Durval de Barros - Contagem","color":"#00000","description":"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.","created_at":"2018-11-02 18:39:32","updated_at":"2018-11-02 18:39:32"}]';

    this.setState(() {
      data = jsonDecode(response);
    });

    return "Success!";
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }

//   @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Calendário de Eventos"),
      ),
      body: new Container(
        color: const Color(0x57777777),
        child: new ListView.builder(
          itemCount: data == null ? 0 : data.length,
          padding: new EdgeInsets.all(8.0),
          itemBuilder: (BuildContext context, int index) {
            return new Card(
              elevation: 1.7,
              child:  new GestureDetector(
                child: new Padding(
                  padding: new EdgeInsets.all(10.0),
                  child: new Column(
                    children: [
                      new Row(
                        children: <Widget>[
                          new Padding(
                            padding: new EdgeInsets.all(4.0),
                            child: new Icon(Icons.calendar_today),
                          ),
                          new Padding(
                            padding: new EdgeInsets.only(left: 4.0),
                            child: new Text(
                              new DateFormat("dd/MM/yyyy HH:mm").format(DateTime.parse(data[index]["begin"])),
                              style: new TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                          new Padding(
                            padding: new EdgeInsets.only(left: 4.0),
                            child: new Text(
                              " - ",
                              style: new TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                          new Padding(
                            padding: new EdgeInsets.only(left: 4.0),
                            child: new Text(
                              new DateFormat("dd/MM/yyyy HH:mm").format(DateTime.parse(data[index]["end"])),
                              style: new TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                        ],
                      ),
                      new Row(
                        children: [
                          new Expanded(
                            child: new GestureDetector(
                              child: new Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  new Padding(
                                    padding: new EdgeInsets.only(
                                        left: 4.0,
                                        right: 8.0,
                                        bottom: 8.0,
                                        top: 8.0),
                                    child: new Text(
                                      data[index]["title"].substring(0, 
                                        data[index]["title"].length < 60 ? data[index]["title"].length : 60
                                      ),
                                      style: new TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  new Padding(
                                    padding: new EdgeInsets.only(
                                        left: 4.0,
                                        right: 4.0,
                                        bottom: 4.0),
                                    child: new Text(
                                      data[index]["local"].substring(0, 
                                        data[index]["local"].length < 60 ? data[index]["local"].length : 60
                                      ),
                                      style: new TextStyle(
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                onTap: () {
                  show(data[index]);
                }, 
              ),
            );
          },
        ),
      )
    );
  }

  show(data){
    Navigator.of(context).push(
      new MaterialPageRoute(builder: (BuildContext context) {
        return new CalendarDetailPage(data);
      }
      )
    );
  }

}