import 'package:flutter/material.dart';

class LessonScreen extends StatefulWidget {
	static const String routeName = "/lesson";
	LessonScreen({Key key}): super(key: key);

	@override
	_LessonScreenState createState() => new _LessonScreenState();
}

class _LessonScreenState extends State < LessonScreen > {

	//   @override
	Widget build(BuildContext context) {
		return new Scaffold(
			appBar: new AppBar(
				title: new Text("Lições"),
			),
			body: Text('Tela de Lições'),
		);
	}

}