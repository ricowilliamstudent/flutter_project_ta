import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_ta/API.dart';
import 'package:project_ta/iptables.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

class iptables extends StatefulWidget {
  @override
  State<iptables> createState() => _iptablesState();
}

class _iptablesState extends State<iptables> {
  List _get = [];

  Future _accept(String ip, String tipe, String waktu) async {
    tipe = tipe.contains('ICMP') ? "ICMP" : "TCP";
    waktu = waktu.replaceAll(" ", ".");
    try {
      final response = await http.get(Uri.parse(
          "http://192.168.43.247:8080/api/accept/" +
              ip +
              "/" +
              waktu +
              "/" +
              tipe));
      print(response.body);
      // cek apakah respon berhasil
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        setState(() {
          //memasukan data yang di dapat dari internet ke variabel _get
          print(data);
        });
      }
    } catch (e) {
      //tampilkan error di terminal
      print(e);
    }
  }

  Future _reject(String ip, String tipe, String waktu) async {
    tipe = tipe.contains('ICMP') ? "ICMP" : "TCP";
    waktu = waktu.replaceAll(" ", ".");
    try {
      final response = await http.get(Uri.parse(
          "http://192.168.43.247:8080/api/reject/" +
              ip +
              "/" +
              waktu +
              "/" +
              tipe));
      print(response.body);
      // cek apakah respon berhasil
      if (response.statusCode == 200) {
        print("jalan");
        final data = jsonDecode(response.body);

        setState(() {
          //memasukan data yang di dapat dari internet ke variabel _get
          print(data);
        });
      }
    } catch (e) {
      //tampilkan error di terminal
      print(e);
    }
  }

  Future _drop(String ip, String tipe, String waktu) async {
    tipe = tipe.contains('ICMP') ? "ICMP" : "TCP";
    waktu = waktu.replaceAll(" ", ".");
    try {
      final response = await http.get(Uri.parse(
          "http://192.168.43.247:8080/api/drop/" +
              ip +
              "/" +
              waktu +
              "/" +
              tipe));
      print(response.body);
      // cek apakah respon berhasil
      if (response.statusCode == 200) {
        print("jalan");
        final data = jsonDecode(response.body);

        setState(() {
          //memasukan data yang di dapat dari internet ke variabel _get
          print(data);
        });
      }
    } catch (e) {
      //tampilkan error di terminal
      print(e);
    }
  }

  Future _getData() async {
    try {
      final response = await http
          .get(Uri.parse("http://192.168.43.247:8080/api/getiptables"));

      // cek apakah respon berhasil
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        setState(() {
          //memasukan data yang di dapat dari internet ke variabel _get
          _get = data;
        });
      }
    } catch (e) {
      //tampilkan error di terminal
      print(e);
    }
  }

  initState() {
    super.initState();
    _getData();
  }

  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ProgressDialog pd = ProgressDialog(context: context);
    return Scaffold(
      appBar:
          AppBar(title: const Text("IPtables"), backgroundColor: Colors.orange),
      backgroundColor: Color.fromARGB(255, 228, 228, 228),
      body: Container(
          margin: EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: _get.length,
            itemBuilder: (context, index) {
              print(_get[index]);
              return Card(
                elevation: 5,
                child: Column(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Icon(Icons.bug_report),
                            Text("IP Address : " + _get[index]["sumberip"]),
                          ],
                        )),
                    Container(
                        margin: EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Icon(Icons.timer_sharp),
                            Text("Waktu : " + _get[index]["waktu"]),
                          ],
                        )),
                    Container(
                        margin: EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Icon(Icons.edit_notifications),
                            Text("Status : " + _get[index]["status"]),
                          ],
                        )),
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FlatButton(
                            color: Colors.green,
                            child: Text(
                              'ACCEPT',
                            ),
                            onPressed: () async {
                              pd.show(max: 100, msg: 'Loading...');
                              await _accept(_get[index]["sumberip"],
                                  _get[index]["tipe"], _get[index]["waktu"]);
                              pd.close();
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => iptables()));
                            },
                          ),
                          SizedBox(width: 5),
                          FlatButton(
                            color: Colors.yellow,
                            child: Text(
                              'REJECT',
                            ),
                            onPressed: () async {
                              pd.show(max: 100, msg: 'Loading...');
                              await _reject(_get[index]["sumberip"],
                                  _get[index]["tipe"], _get[index]["waktu"]);
                              pd.close();
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => iptables()));
                            },
                          ),
                          SizedBox(width: 5),
                          FlatButton(
                            color: Colors.red,
                            child: Text(
                              'DROP',
                            ),
                            onPressed: () async {
                              pd.show(max: 100, msg: 'Loading...');
                              await _drop(_get[index]["sumberip"],
                                  _get[index]["tipe"], _get[index]["waktu"]);
                              pd.close();
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => iptables()));
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ); //End Card
            },
          )),
    );
  }
}
