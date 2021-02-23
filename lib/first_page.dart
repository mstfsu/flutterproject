import 'package:flutter/material.dart';
import 'package:mix/beyaz_show.dart';
import 'package:mix/gereksiz_bilgiler.dart';
import 'package:mix/tr_en_dictionary.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('İlk Sayfa'),
      ),
      body: Center(
        child: Container(
          height: 400,
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: SizedBox(
                  width: double.infinity,
                  height: 100.0,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GereksizBilgiler()),
                      );
                    },
                    child: Text(
                      "Gereksiz Bilgiler",
                      style: TextStyle(fontSize: 30),
                    ),
                    textTheme: ButtonTextTheme.accent,
                    splashColor: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: SizedBox(
                  width: double.infinity,
                  height: 100.0,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BeyazShow()),
                      );
                    },
                    child: Text(
                      "Beyaz Show Videoları",
                      style: TextStyle(fontSize: 30),
                    ),
                    textTheme: ButtonTextTheme.accent,
                    splashColor: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: SizedBox(
                  width: double.infinity,
                  height: 100.0,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Translate()),
                      );
                    },
                    child: Text(
                      "Tr-En Çevirici",
                      style: TextStyle(fontSize: 30),
                    ),
                    textTheme: ButtonTextTheme.accent,
                    splashColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
