import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:core';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class VideosScreen extends StatefulWidget {
  static const String routeName = "/videos";
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideosScreen> {
  var data;
  TargetPlatform _platform;
  VideoPlayerController _controller;

  Future getData() async {
    // var response = await http.get('http://betelnarede.com:8000/api/videos');
    // var localData = jsonDecode(response.body);

    var response = '[{"id":"1"},{"id":"2"}]';
    var localData = jsonDecode(response);

    this.setState(() {
      data = localData;
    });

    return "Success!";
  }

  @override
  void initState() {
    super.initState();
    this.getData();
    _controller = new VideoPlayerController.network(
      "https://r1---sn-vgqsknee.googlevideo.com/videoplayback?signature=D8506A220599CBCB9EE83ABFA81D8F977E41CC53.962AB0F5C3170CC57BB04F3BB2E1157C68EE8440&expire=1542526397&ratebypass=yes&pl=14&mv=m&id=o-AOlTxqwpRyQ2fpaWmfOSpA7mvmK7cda0gJzC6guHfyB7&ms=au%2Crdu&ipbits=0&mm=31%2C29&mime=video%2Fmp4&mn=sn-vgqsknee%2Csn-vgqsrnez&mt=1542504703&key=yt6&ip=54.144.123.57&source=youtube&dur=309.730&c=WEB&ei=XMHwW6PQNKnn8gST16gg&lmt=1528858995498969&itag=22&requiressl=yes&sparams=dur%2Cei%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cexpire&fvip=1&initcwndbps=4277500",
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Videos'),
      ),
      body: new Column(
          children: <Widget>[
            new Expanded(
              child: new Center(
                child: new Chewie(
                  _controller,
                  aspectRatio: 3 / 2,
                  autoPlay: false,
                  looping: true,
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
                  autoInitialize: true,
                ),
              ),
            ),
            // new Row(
            //   children: <Widget>[
            //     new Expanded(
            //       child: new FlatButton(
            //         onPressed: () {
            //           setState(() {
            //             _controller = new VideoPlayerController.network(
            //               "https://r3---sn-vgqsknez.googlevideo.com/videoplayback?source=youtube&mime=video%2Fmp4&itag=22&key=cms1&requiressl=yes&beids=%5B9466592%5D&ratebypass=yes&fexp=9466586,23724337&ei=g3jiWvfCL4O_8wScopaICA&signature=43C209DD37289D74DB39A9BBF7BC442EAC049426.14B818F50F4FA686C13AF5DD1C2A498A9D64ECC9&fvip=3&pl=16&sparams=dur,ei,expire,id,initcwndbps,ip,ipbits,ipbypass,itag,lmt,mime,mip,mm,mn,ms,mv,pl,ratebypass,requiressl,source&ip=54.163.50.118&lmt=1524616041346022&expire=1524813027&ipbits=0&dur=1324.768&id=o-AJvotKVxbyFDCz5LQ1HWQ8TvNoHXWb2-86a_50k3EV0f&rm=sn-p5qyz7s&req_id=e462183e4575a3ee&ipbypass=yes&mip=96.244.254.218&redirect_counter=2&cm2rm=sn-p5qe7l7s&cms_redirect=yes&mm=34&mn=sn-vgqsknez&ms=ltu&mt=1524791367&mv=m",
            //             );
            //           });
            //         },
            //         child: new Padding(
            //           child: new Text("Video 1"),
            //           padding: new EdgeInsets.symmetric(vertical: 16.0),
            //         ),
            //       ),
            //     ),
            //     new Expanded(
            //       child: new FlatButton(
            //         onPressed: () {
            //           setState(() {
            //             _controller = new VideoPlayerController.network(
            //               'http://www.sample-videos.com/video/mp4/720/big_buck_bunny_720p_20mb.mp4',
            //             );
            //           });
            //         },
            //         child: new Padding(
            //           padding: new EdgeInsets.symmetric(vertical: 16.0),
            //           child: new Text("Video 2"),
            //         ),
            //       ),
            //     )
            //   ],
            // ),

            new Expanded(
              child: ListView.builder(
                itemCount: data == null ? 0 : data.length,
                padding: new EdgeInsets.all(8.0),
                itemBuilder: (BuildContext context, int index) {
                  return new Text(data[index]["id"]);
                }
              ),
            ),


            // new Expanded(
            //   child: ListView(
            //     children: <Widget>[
            //       new Expanded(
            //         child: ListTile(
            //           leading: Icon(Icons.video_library),
            //           title: Text('Betel News'),
            //         ),
            //         onTap: () {
            //           setState(() {
            //             _controller = new VideoPlayerController.network(
            //               'http://www.sample-videos.com/video/mp4/720/big_buck_bunny_720p_20mb.mp4',
            //             );
            //           });
            //         },
            //       ),
            //     ],
            //   ),
            // ),


          ],
        ),
    );
  }
}


