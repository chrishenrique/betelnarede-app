import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

class ConfigurationScreen extends StatefulWidget {
	static const String routeName = "/configuration";
	ConfigurationScreen({Key key}): super(key: key);

	@override
	_ConfigurationScreenState createState() => new _ConfigurationScreenState();
}

class _ConfigurationScreenState extends State < ConfigurationScreen > {

  File jsonFile;
  Directory dir;
  String fileName = "myJSONFile.json";
  bool fileExists = false;
  var fileContent;

  @override
  void initState() {
    super.initState();
    getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      jsonFile = new File(dir.path + "/" + fileName);
      fileExists = jsonFile.existsSync();
      if (fileExists) this.setState(() => fileContent = json.decode(jsonFile.readAsStringSync()));
    });
  }

  void createFile(content, Directory dir, String fileName) {
    // print("Creating file!");
    File file = new File(dir.path + "/" + fileName);
    file.createSync();
    fileExists = true;
    file.writeAsStringSync(json.encode(content));
  } 

  void writeToFile(String key, String value) {
    // print("Writing to file!");
    var content = {key: value};
    if (fileExists) {
      // print("File exists");
      var jsonFileContent = json.decode(jsonFile.readAsStringSync());
      jsonFileContent.addAll(content);
      jsonFile.writeAsStringSync(json.encode(jsonFileContent));
    } else {
      // print("File does not exist!");
      createFile(content, dir, fileName);
    }
    this.setState(() => fileContent = json.decode(jsonFile.readAsStringSync()));
    // print(fileContent);
  }

  getValueField(key)
  {
    if (fileContent == null)
    {
      return true;
    }
    var value = fileContent[key];
    print(fileContent);
    print('$key, $value');
    return value != null ? (value == 'true') : true; 
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Configurações'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                children: <Widget>[
                  Text('Receber Notificações',
                    style: new TextStyle(fontSize: 18.0),
                  ),
                  new Switch(
                    key: Key('notifications'),
                    value: getValueField('notifications'),
                    onChanged: (bool value) {
                      writeToFile('notifications', value.toString());
                    },
                  ),  
                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                children: <Widget>[
                  Text('Autoplay nos vídeos',
                    style: new TextStyle(fontSize: 18.0),
                  ),
                  new Switch(
                    key: Key('autoplay'),
                    value: getValueField('autoplay'),
                    onChanged: (bool value) {
                      writeToFile('autoplay', value.toString());
                    },
                  ),  
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}