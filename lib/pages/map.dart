import 'package:flutter/material.dart';

class MapScreen extends StatefulWidget {
	static const String routeName = "/map";
	MapScreen({Key key}): super(key: key);

	@override
	_MapScreenState createState() => new _MapScreenState();
}

class _MapScreenState extends State < MapScreen > {

	//   @override
	Widget build(BuildContext context) {
		return new Scaffold(
			appBar: new AppBar(
				title: new Text("Mapa"),
			),
			body: Text('Tela do Mapa'),
		);
	}

}