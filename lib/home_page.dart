import 'package:flutter/material.dart';
import 'package:project_ta/info_aplikasi.dart';
import 'package:project_ta/iptables.dart';
import 'package:project_ta/log_serangan.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Beranda"),
          backgroundColor: Colors.orange,
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                Navigator.pushReplacementNamed(context, "login-page");
              },
            )
          ],
        ),
        backgroundColor: Colors.orange[100],
        body: Container(
          padding: const EdgeInsets.all(30.0),
          child: GridView.count(
            crossAxisCount: 1,
            children: <Widget>[
              Image.asset('images/suricataicon.png', scale: 3),

              //Card Serangan
              Card(
                elevation: 5,
                margin: const EdgeInsets.all(8.0),
                child: InkWell(
                  // Push ke log serangan
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => logserangan()));
                  },
                  // End push ke log serangan
                  splashColor: Colors.orange,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const <Widget>[
                        Icon(
                          Icons.bug_report,
                          color: Colors.orange,
                          size: 50.0,
                        ),
                        Text("LOG SERANGAN", style: TextStyle(fontSize: 17.0))
                      ],
                    ),
                  ),
                ),
              ),
              //akhir card log serangan

              // IPtables
              Card(
                elevation: 5,
                margin: const EdgeInsets.all(8.0),
                child: InkWell(
                  // Push ke iptables
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => iptables()));
                  },
                  // End push ke log serangan
                  splashColor: Colors.orange,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const <Widget>[
                        Icon(
                          Icons.border_color_rounded,
                          color: Colors.orange,
                          size: 50.0,
                        ),
                        Text("IPTables", style: TextStyle(fontSize: 17.0))
                      ],
                    ),
                  ),
                ),
              ),
              // End Iptables

              //Card Info Aplikasi
              Card(
                elevation: 5,
                margin: const EdgeInsets.all(8.0),
                child: InkWell(
                  // Push ke info aplikasi
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const infoaplikasi()));
                  },
                  // End ke info aplikasi
                  splashColor: Colors.orange,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const <Widget>[
                        Icon(
                          Icons.perm_device_information,
                          color: Colors.orange,
                          size: 50.0,
                        ),
                        Text("INFO APLIKASI", style: TextStyle(fontSize: 17.0))
                      ],
                    ),
                  ),
                ),
              ),
              //Akhir card info aplikasi
            ],
          ),
        ));
  }
}
