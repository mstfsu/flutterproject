import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'beyaz_show_video.dart';
import 'models/video.dart';

class BeyazShow extends StatefulWidget {
  @override
  _BeyazShowState createState() => _BeyazShowState();
}

class _BeyazShowState extends State<BeyazShow> {
  List<video> beyazshowvideolar = [];

  _verilerigetir() async {
    var response = await http.get("https://www.netdata.com/JSON/1d35eb7f");
    print("geldi");
    if (response.statusCode == 200) {
      var a = (json.decode(response.body) as List)
          .map((bean) => video.fromJson(bean))
          .toList();
      setState(() {
        beyazshowvideolar = a;
      });
    } else {
      print("olmadııı");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _verilerigetir();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Beyaz Show Videoları'),
        ),
        body: beyazshowvideolar.isEmpty != true
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    childAspectRatio: MediaQuery.of(context).size.height / 700,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 12),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(5),
                    child: Card(
                      semanticContainer: true,
                      color: Colors.white70,
                      shadowColor: Colors.cyan,
                      margin: EdgeInsets.all(5),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BeyazShowVideoPlayer(
                                    beyazshowvideolar[index].dcLink)),
                          );
                        },
                        title: Text(
                            beyazshowvideolar[index].dcVideoBaslik.toString()),
                        subtitle: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                  "Beğenilme : ${beyazshowvideolar[index].dcBegeniSayisi}"),
                              Text(
                                  "Beğenilmeme : ${beyazshowvideolar[index].dcBegenilmemeSayisi}"),
                              Text(
                                  "${beyazshowvideolar[index].dcYayinlanmaTarihi}"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: beyazshowvideolar.length,
              )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}
