import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Translate extends StatefulWidget {
  Translate({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TranslateState createState() => _TranslateState();
}

class _TranslateState extends State<Translate> {
  final String _baseUrl =
      "https://www.netdata.com/JSON/d495b07c?%24where=dc_Turkce=";
  final textFieldValueHolder = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tr-En Çevirici"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(5),
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                child: TextField(
                  controller: textFieldValueHolder,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: 'Enter a word',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
            ),
            RaisedButton(
              textTheme: ButtonTextTheme.accent,
              splashColor: Colors.white,
              onPressed: () {
                _translate();
              },
              child: Text(
                "Translate",
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _translate() async {
    http.Response res = await http.get(_baseUrl + textFieldValueHolder.text);
    List data = jsonDecode(res.body);
    // List list = res.body;
    if (data[0]['ID'] != null) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Success"),
                content: Text("Turkish : " +
                    data[0]['dc_Turkce'] +
                    "\n" "English : " +
                    data[0]['dc_Ingilizce']),
              ));
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Error"),
                content: Text(data[0]['Exception']),
              ));
    }
  }
}
