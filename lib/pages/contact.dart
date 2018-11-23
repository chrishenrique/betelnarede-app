import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
	static const String routeName = "/contact";
	ContactScreen({Key key}): super(key: key);

  ContactFormState createState() {
    return ContactFormState();
  }
}

class ContactFormState extends State < ContactScreen > {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _name;
  String _email;
  String _phone;
  String _message;

	//   @override
	Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

		return new Scaffold(
			appBar: new AppBar(
				title: new Text("Contato"),
			),
			body: new Container(
        padding: new EdgeInsets.all(20.0),
        child: new Form(
          key: this._formKey,
          autovalidate: _autoValidate,
          child: new ListView(
            children: <Widget>[
              new TextFormField(
                decoration: new InputDecoration(
                  labelText: 'Nome'
                ),
                validator: validateName,
                onSaved: (String val) {
                  _name = val;
                },
              ),
              new TextFormField(
                keyboardType: TextInputType.emailAddress, // Use email input type for emails.
                decoration: new InputDecoration(
                  hintText: 'seu@email.com',
                  labelText: 'E-mail',
                ),
                validator: validateEmail,
                onSaved: (String val) {
                  _email = val;
                },
              ),
              new TextFormField(
                keyboardType: TextInputType.phone,
                decoration: new InputDecoration(
                  hintText: '(31) 912345678',
                  labelText: 'Telefone',
                ),
                validator: validatePhone,
                onSaved: (String val) {
                  _phone = val;
                },
              ),
              new TextFormField(
                maxLines: 10,
                keyboardType: TextInputType.multiline,
                 decoration: new InputDecoration(
                  labelText: 'Mensagem',
                ),
                validator: validateMessage,
                onSaved: (String val) {
                  _message = val;
                },
              ), 
              new Container(
                width: screenSize.width,
                child: new RaisedButton(
                  child: new Text(
                    'Enviar',
                    style: new TextStyle(
                      color: Colors.white
                    ),
                  ),
                  onPressed: _validateInputs,
                  color: Colors.blue,
                ),
                margin: new EdgeInsets.only(
                  top: 20.0
                ),
              )
            ],
          ),
        )
      ),
		);
	}

  void _validateInputs() {
    if (_formKey.currentState.validate()) {
    // If all data are correct then save data to out variables
      // _formKey.currentState.save();
      print('valid');
      _showMessage(true);
    } else {
      _showMessage(false);
    // If all data are not valid then start auto validation.
      setState(() {
        _autoValidate = true;
      });
    }
  }

  _showMessage(result) {
    var message1 = '';
    var message2 = '';

    if (result) {
      message1 = 'Obrigado por entrar em contato.';
      message2 = '';
    } else {
      message1 = 'Algo de errado aconteceu!';
      message2 = 'Tente enviar novamente';
    }
    
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: result ? new Icon(Icons.mood) : new Icon(Icons.mood_bad),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message1),
                Text(message2),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  String validateName(String value) {
    if (value.length < 3)
      return 'Nome inválido';
    else
      return null;
  }

  String validatePhone(String value) {
// Indian Mobile number are of 10 digit only
    if (value.length != 10)
      return 'Número inválido';
    else
      return null;
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'E-mail inválido';
    else
      return null;
  }

  String validateMessage(String value) {
// Indian Mobile number are of 10 digit only
    if (value.length < 1)
      return 'Você precisa escrever uma mensagem';
    else
      return null;
  }

}
