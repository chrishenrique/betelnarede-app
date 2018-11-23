import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
	static const String routeName = "/contact";
	ContactScreen({Key key}): super(key: key);

  ContactFormState createState() {
    return ContactFormState();
  }
}

class ContactFormState extends State < ContactScreen > {
  final _formKey = GlobalKey<FormState>();

	//   @override
	Widget build(BuildContext context) {
		return new Scaffold(
			appBar: new AppBar(
				title: new Text("Contato"),
			),
			body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    Scaffold.of(context).showSnackBar(SnackBar(content: Text('Processing Data')));
                  }
                },
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
		);
	}

}
