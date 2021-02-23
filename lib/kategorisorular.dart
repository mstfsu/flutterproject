import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mix/models/buffer_gereksizbilgiler.dart';

import 'models/soru.dart';

class KategoriSorular extends StatefulWidget {
  String kategoriAdi;
  KategoriSorular(this.kategoriAdi);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return KategoriSorularState();
  }
}

class KategoriSorularState extends State<KategoriSorular> {
  List<soru> sorular = [];
  _verilerigetir() async {
    var response = await http.get("https://www.netdata.com/JSON/21FC2BE0");
    if (response.statusCode == 200) {
      var a = (json.decode(response.body) as List)
          .map((bean) => gereksizbilgiler.fromJson(bean))
          .toList();
      setState(() {
        a.forEach((element) {
          if (element.dcKategori == widget.kategoriAdi) {
            sorular.add(soru(element.dcSoru, element.dcCevap));
          }
        });
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
    print('build çalıştı');
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.kategoriAdi),
        ),
        body: sorular.isEmpty != true
            ? Padding(
                padding: EdgeInsets.all(5),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.white60,
                      shadowColor: Colors.cyan,
                      margin: EdgeInsets.all(7),
                      child: ListTile(
                        hoverColor: Colors.green,
                        title: Text(sorular[index].dcSoru),
                        subtitle: Padding(
                          child: Text(sorular[index].dcCevap),
                          padding: EdgeInsets.all(5),
                        ),
                      ),
                    );
                  },
                  itemCount: sorular.length,
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}
