import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_ta/API.dart';
import 'package:project_ta/iptables.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

class logserangan extends StatefulWidget {
  @override
  State<logserangan> createState() => _logseranganState();
}

class _logseranganState extends State<logserangan> {
  List _get = [];
  Future _accept(String ip, String tipe, String waktu) async {
    tipe = tipe.contains('ICMP') ? "ICMP" : "TCP";
    waktu = waktu.replaceAll(" ", ".");
    try {
      final response = await http.get(Uri.parse(
          "http://10.30.10.37:8080/api/accept/" +
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

  Future _reject(String ip, String tipe, String waktu) async {
    tipe = tipe.contains('ICMP') ? "ICMP" : "TCP";
    waktu = waktu.replaceAll(" ", ".");
    try {
      final response = await http.get(Uri.parse(
          "http://10.30.10.37:8080/api/reject/" +
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
          "http://10.30.10.37:8080/api/drop/" + ip + "/" + waktu + "/" + tipe));
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
      final response =
          await http.get(Uri.parse("http://10.30.10.37:8080/api/getlog"));

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
    print(_get);
  }

  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ProgressDialog pd = ProgressDialog(context: context);
    return Scaffold(
      appBar: AppBar(
          title: const Text("Log Serangan"), backgroundColor: Colors.orange),
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
                            Text("IP Address : " + _get[index][2]),
                          ],
                        )),
                    Container(
                        margin: EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Icon(Icons.timer_sharp),
                            Text("Waktu : " + _get[index][0]),
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
                              await _accept(_get[index][2], _get[index][1],
                                  _get[index][0]);
                              pd.close();
                              Navigator.push(
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
                              await _reject(_get[index][2], _get[index][1],
                                  _get[index][0]);
                              pd.close();
                              Navigator.push(
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
                              await _drop(_get[index][2], _get[index][1],
                                  _get[index][0]);
                              pd.close();
                              Navigator.push(
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
