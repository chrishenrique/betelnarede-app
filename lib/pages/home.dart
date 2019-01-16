import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'dart:convert';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget{
  HomePage();

  @override
  Widget build(BuildContext context) {
    return _getItems();
  }

  Widget _getItems() {
    return new Container(
      color: const Color(0x57777777),
      child: ListView(
          children: <Widget>[
            _name(),
            _banners(),
            _events(),
            // _video(),
            _birthday(),
          ],
      ),
    );
  }

  Future<String> _get(String url) {
    return http.get(url).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400) {
        throw new Exception("Error while fetching data");
      }
      // print("Response get: ${res}");
      return res;
    });
  }

  _name() {
    return new Center(
      child: new Padding(
        padding: new EdgeInsets.all(7.0),
        child: new Column(
          children: <Widget>[
            Text('Igreja Batista Betel',
              style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0
              ),
            ),
            Text('Uma igreja em célula perto de voçẽ'),
          ],
        ),
      ),
    );
  }

  _banners() {
    // var response = http.get(new Uri.http('betelnarede.com:8000', '/api/banners'));
    // List banners = jsonDecode(response.body);

    var response = '[{"image_url":"https://www.w3schools.com/w3css/img_lights.jpg"},{"image_url":"https://images.ctfassets.net/o59xlnp87tr5/nywabPmH5Y6W4geG8IYuk/0a59905671f8d637350df8e7ec9e7fb9/backgrounds-min.jpg"},{"image_url":"https://www.esaint/var/esa/storage/images/esa_multimedia/images/2017/11/autumn_fireball/17255671-1-eng-GB/Autumn_fireball_node_full_image_2.jpg"},{"image_url":"http://www.messagescollection.com/wp-content/uploads/2017/08/best-good-night-images-for-whatsapp.jpg"}]';
    List banners = jsonDecode(response);

    return new SizedBox(
      height: 200.0,
      width: 350.0,
      child: new Carousel(
        images: banners.map((item) => new NetworkImage(item['image_url'])).toList(),
        autoplay: false,
        dotSize: 4.0,
        dotSpacing: 15.0,
        dotColor: Colors.blueAccent,
        indicatorBgPadding: 5.0,
        dotBgColor: Colors.blue.withOpacity(0.5),
        borderRadius: false,
        moveIndicatorFromBottom: 0.0,
        noRadiusForIndicator: true,
      )
    );
  }

  _birthday() {
    return new Card(
      child: new Column(
        children: <Widget>[
          new Padding(
            padding: new EdgeInsets.all(7.0),
            child: new Row(
              children: <Widget>[
                new Padding(
                  padding: new EdgeInsets.all(7.0),
                  child: new Icon(Icons.mood),
                ),
                new Padding(
                  padding: new EdgeInsets.all(7.0),
                  child: new Text('Aniversáriantes', 
                    style: new TextStyle(fontSize: 18.0),
                  ),
                ),
              ],
            )
          ),
          new Column(
            children: _getBirthDays(),
          )
        ],
      ),
    );
  }

  List<Widget> _getBirthDays() {
    // var response = http.get(new Uri.http('betelnarede.com:8000', '/api/birthdays'));
    // List birthdays = jsonDecode(response.body);

    var response = '[{"date":"08/07","name":"Chrstiano Henrique"},{"date":"06/07","name":"Gustavo Augusto dos Santos"},{"date":"03/07","name":"Antônio Silva"},{"date":"01/07","name":"Carlos Henrique Teixeira"}]';
    List birthdays = jsonDecode(response);
    List<Widget> list = new List();

    birthdays.map((item) => list.add(new Padding(
        padding: new EdgeInsets.all(7.0),
        child: new Row(
          children: <Widget>[
            new Padding(
              padding: new EdgeInsets.only(
                left: 7.0,
                right: 7.0,
              ),
              child: new Text(item['date']),
            ),
            new Text('-'),
            new Padding(
              padding: new EdgeInsets.only(
                left: 7.0,
                right: 7.0,
              ),
              child: new Text(item['name'], 
                style: new TextStyle(fontSize: 18.0),
              ),
            ),
          ],
        )
      )
    )).toList();

    return list;
  }

  _events() {
    return new Card(
      child: new Column(
        children: <Widget>[
          new Padding(
            padding: new EdgeInsets.all(7.0),
            child: new Row(
              children: <Widget>[
                new Padding(
                  padding: new EdgeInsets.all(7.0),
                  child: new Icon(Icons.calendar_today),
                ),
                new Padding(
                  padding: new EdgeInsets.all(7.0),
                  child: new Text('Proximos Eventos', 
                    style: new TextStyle(fontSize: 18.0),
                  ),
                ),
              ],
            )
          ),
          new Column(
            children: _getEvents(),
          )
        ],
      ),
    );
  }

  List<Widget> _getEvents() {
    // var response = http.get(new Uri.http('betelnarede.com:8000', '/api/birthdays'));
    // List birthdays = jsonDecode(response.body);

    var response = '[{"date":"08/07","time":"12:00","name":"Conferência 45 anos - 1 dia"},{"date":"06/07","time":"12:00","name":"Culto dos Homens"},{"date":"03/07","time":"12:00","name":"Dia Betel"},{"date":"01/07","time":"12:00","name":"Noite das Crianças"}]';
    List birthdays = jsonDecode(response);
    List<Widget> list = new List();

    birthdays.map((item) => list.add(new Padding(
        padding: new EdgeInsets.all(7.0),
        child: new Row(
          children: <Widget>[
            new Padding(
              padding: new EdgeInsets.only(
                left: 7.0,
                right: 7.0,
              ),
              child: new Text(item['name'], 
                style: new TextStyle(fontSize: 18.0),
              ),
            ),
            new Text('-'),
            new Padding(
              padding: new EdgeInsets.only(
                left: 7.0,
                right: 7.0,
              ),
              child: new Text(item['date']),
            ),
            new Text('às'),
            new Padding(
              padding: new EdgeInsets.only(
                left: 7.0,
                right: 7.0,
              ),
              child: new Text(item['time']),
            ),
          ],
        )
      )
    )).toList();

    return list;
  }

  _video() async{
    var url = 'http://you-link.herokuapp.com/?url=https://www.youtube.com/watch?v=1BnpOcUFxys';
    String response = await _get(url);
    var arrResponse = jsonDecode(response);
    var link = arrResponse[0]['link'];
    return new Card(
      child: new Column(
        children: <Widget>[
          new Padding(
            padding: new EdgeInsets.all(7.0),
            child: new Row(
              children: <Widget>[
                new Padding(
                  padding: new EdgeInsets.all(7.0),
                  child: new Icon(Icons.video_library),
                ),
                new Padding(
                  padding: new EdgeInsets.all(7.0),
                  child: new Text('Betel News', 
                    style: new TextStyle(fontSize: 18.0),
                  ),
                ),
              ],
            )
          ),
          new Padding(
            padding: new EdgeInsets.all(2.0),
            child: new Chewie(
              new VideoPlayerController.network(
                link,
              ),
              aspectRatio: 3 / 2,
              autoPlay: false,
              looping: false,
              showControls: true,
              materialProgressColors: new ChewieProgressColors(
                playedColor: Colors.red,
                handleColor: Colors.blue,
                backgroundColor: Colors.grey,
                bufferedColor: Colors.lightGreen,
              ),
              placeholder: new Container(
                color: Colors.grey,
              ),
              autoInitialize: false,
            ),
          ),
        ]
      ),
    );
  }
}