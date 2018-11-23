import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:core';
import './news-detail.dart';

class NewsScreen extends StatefulWidget {
  static const String routeName = "/news";
  NewsScreen({Key key}) : super(key: key);

  @override
  _NewsScreenState createState() => new _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  var data;

  Future getData() async {
    // var response = http.get(new Uri.http('betelnarede.com:8000', '/api/news'));
    // var localData = jsonDecode(response.body);

    var response = '[{"id":10,"author_id":1,"author":"Christiano H.","title":"sssssss","text":"<p>aaa</p>","image_path":"/img/app/news/20181102_183932.jpg","image_url":"https://www.codemate.com/wp-content/uploads/2016/02/flutter-logo-round.png","status":1,"share_link":null,"created_at":"2018-11-02 18:39:32","updated_at":"2018-11-02 18:39:32"},{"id":9,"author_id":1,"author":"Christiano H.","title":"dsddddddddddddddddddddddddddddddddddddddddddddddddasas","text":"<p>asdasd</p>","image_path":"/img/app/news/20181102_183908.jpg","image_url":"https://www.codemate.com/wp-content/uploads/2016/02/flutter-logo-round.png","status":1,"share_link":null,"created_at":"2018-11-02 18:39:08","updated_at":"2018-11-02 18:39:08"},{"id":8,"author_id":1,"author":"Christiano H.","title":"asdasd","text":"<p>asdasd</p>","image_path":"/img/app/news/20181102_183808.jpg","image_url":"https://www.codemate.com/wp-content/uploads/2016/02/flutter-logo-round.png","status":1,"share_link":null,"created_at":"2018-11-02 18:38:08","updated_at":"2018-11-02 18:38:08"},{"id":7,"author_id":1,"author":"Christiano H.","title":"jsadasd","text":"<p>adsd</p>","image_path":"/img/app/news/20181102_183746.jpg","image_url":"https://www.codemate.com/wp-content/uploads/2016/02/flutter-logo-round.png","status":1,"share_link":null,"created_at":"2018-11-02 18:37:46","updated_at":"2018-11-02 18:37:46"},{"id":6,"author_id":1,"author":"Christiano H.","title":"qwqw","text":"gfgjgfgfgfjg","image_path":"/img/app/news/20181102_162117.jpg","image_url":"https://www.codemate.com/wp-content/uploads/2016/02/flutter-logo-round.png","status":1,"share_link":null,"created_at":"2018-11-02 16:21:17","updated_at":"2018-11-02 16:54:08"},{"id":5,"author_id":1,"author":"Christiano H.","title":"sdsad","text":"hgfgfgfjgfgfgfjgjf","image_path":"/img/app/news/20181102_161043.jpg","image_url":"https://www.codemate.com/wp-content/uploads/2016/02/flutter-logo-round.png","status":0,"share_link":null,"created_at":"2018-11-02 16:10:43","updated_at":"2018-11-02 18:37:20"},{"id":4,"author_id":1,"author":"Christiano H.","title":"skfjsd dhfudshfsdjfewrvdhs owerhf we","text":"jvgffkfgffgh","image_path":"/img/app/news/20181020_164509.jpg","image_url":"https://www.codemate.com/wp-content/uploads/2016/02/flutter-logo-round.png","status":0,"share_link":null,"created_at":"2018-10-20 16:45:09","updated_at":"2018-11-02 18:37:15"},{"id":3,"author_id":1,"author":"Christiano H.","title":"fffffffffffffffffffffffffffffffffffffffffffffff","text":"gftreyreerertyfdvbkughvbg","image_path":"/img/app/news/20181020_164437.jpg","image_url":"https://www.codemate.com/wp-content/uploads/2016/02/flutter-logo-round.png","status":0,"share_link":null,"created_at":"2018-10-20 16:44:37","updated_at":"2018-11-02 18:37:10"},{"id":2,"author_id":1,"author":"Christiano H.","title":"erwrwer","text":"<p>ewrwer</p>","image_path":"/img/app/news/20181020_164407.jpg","image_url":"https://www.codemate.com/wp-content/uploads/2016/02/flutter-logo-round.png","status":0,"share_link":null,"created_at":"2018-10-20 16:44:07","updated_at":"2018-11-02 18:37:04"},{"id":1,"author_id":1,"author":"Christiano H.","title":"Tteste teste teste teste","text":"<p>teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste</p>","image_path":"/img/app/news/20180922_103433.jpg","image_url":"https://www.codemate.com/wp-content/uploads/2016/02/flutter-logo-round.png","status":0,"share_link":null,"created_at":"2018-09-22 10:34:33","updated_at":"2018-11-02 18:36:57"}]';

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
    timeago.setLocaleMessages('pt_BR', timeago.PtBrMessages());
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Noticias"),
      ),
      body: new ListView.builder(
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
                          padding: new EdgeInsets.only(left: 4.0),
                          child: new Text(
                            timeago.format(DateTime.parse(data[index]["created_at"]), locale: "pt_BR"),
                            style: new TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                        new Padding(
                          padding: new EdgeInsets.all(5.0),
                          child: new Text(
                            data[index]["author"],
                            style: new TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[700],
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
                                      data[index]["title"].length < 20 ? data[index]["title"].length : 20
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
                                    data[index]["text"].substring(0, 
                                      data[index]["text"].length < 50 ? data[index]["text"].length : 50
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
                        new Column(
                          children: <Widget>[
                            new Padding(
                              padding:
                                  new EdgeInsets.only(top: 8.0),
                              child: new SizedBox(
                                height: 100.0,
                                width: 100.0,
                                child: new Image.network(
                                  data[index]["image_url"],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        )
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
      )
    );
  }

  show(data){
    Navigator.of(context).push(
      new MaterialPageRoute(builder: (BuildContext context) {
        return new DetailPage(data);
      }
      )
    );
  }

}