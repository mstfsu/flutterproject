import 'dart:convert';

import 'package:darq/darq.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'kategorisorular.dart';
import 'models/gereksizbilgiler.dart';

class GereksizBilgiler extends StatefulWidget {
  @override
  _GereksizBilgilerState createState() => _GereksizBilgilerState();
}

class _GereksizBilgilerState extends State<GereksizBilgiler> {
  String title = "";
  List<gereksizbilgiler> distinct = [];
  _verilerigetir() async {
    var response = await http.get("https://www.netdata.com/JSON/21FC2BE0");
    if (response.statusCode == 200) {
      var listOfGereksizBilgiler = (json.decode(response.body) as List)
          .map((bean) => gereksizbilgiler.fromJson(bean))
          .toList();
      setState(() {
        distinct =
            listOfGereksizBilgiler.distinct((d) => d.dcKategori).toList();
      });
    } else {
      throw Exception();
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
          title: Text('Kategoriler'),
        ),
        body: distinct.isEmpty != true
            ? ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    shadowColor: Colors.pink,
                    margin: EdgeInsets.all(5),
                    child: ListTile(
                      title: Text(distinct[index].dcKategori),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  KategoriSorular(distinct[index].dcKategori)),
                        );
                      },
                    ),
                  );
                },
                itemCount: distinct.length,
              )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}
