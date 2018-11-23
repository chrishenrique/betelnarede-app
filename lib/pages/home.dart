import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'dart:convert';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatelessWidget{
  HomePage();

  @override
  Widget build(BuildContext context) {
    return _getItems();
  }

  Widget _getItems() {
    return new ListView(
        children: <Widget>[
          _name(),
          _banners(),
          _video(),
          _birthday(),
        ],
    );
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

  _video() {
    var link = "https://r1---sn-vgqsknee.googlevideo.com/videoplayback?signature=D8506A220599CBCB9EE83ABFA81D8F977E41CC53.962AB0F5C3170CC57BB04F3BB2E1157C68EE8440&expire=1542526397&ratebypass=yes&pl=14&mv=m&id=o-AOlTxqwpRyQ2fpaWmfOSpA7mvmK7cda0gJzC6guHfyB7&ms=au%2Crdu&ipbits=0&mm=31%2C29&mime=video%2Fmp4&mn=sn-vgqsknee%2Csn-vgqsrnez&mt=1542504703&key=yt6&ip=54.144.123.57&source=youtube&dur=309.730&c=WEB&ei=XMHwW6PQNKnn8gST16gg&lmt=1528858995498969&itag=22&requiressl=yes&sparams=dur%2Cei%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cexpire&fvip=1&initcwndbps=4277500";
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