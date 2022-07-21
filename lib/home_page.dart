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
        backgroundColor: Colors.orange[90],
        body: Container(
          padding: const EdgeInsets.all(40.0),
          child: ListView(
            children: <Widget>[
              Image.asset('images/iconaplikasi.png', scale: 2),
// Card serangan terbaru
              Card(
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: const BorderSide(color: Colors.orange)),
                elevation: 5,
                shadowColor: Colors.orange,
                margin: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => logserangan()));
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      ListTile(
                        leading: Icon(
                          Icons.bug_report_outlined,
                          size: 50,
                          color: Colors.orange,
                        ),
                        title: Text('Log Serangan',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.orange)),
                        // subtitle: Text('Daftar Log Serangan'),
                      ),
                    ],
                  ),
                ),
              ),
// End card serangan terbaru

// Card Iptables terbaru
              Card(
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: const BorderSide(color: Colors.orange)),
                elevation: 5,
                shadowColor: Colors.orange,
                margin: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => iptables()));
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      ListTile(
                        leading: Icon(
                          Icons.circle_notifications_outlined,
                          size: 50,
                          color: Colors.orange,
                        ),
                        title: Text('IPtables',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.orange)),
                        // subtitle: Text('Daftar Log Serangan'),
                      ),
                    ],
                  ),
                ),
              ),
// End Card Iptables terbaru

// Card info aplikasi terbaru
              Card(
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: const BorderSide(color: Colors.orange)),
                elevation: 5,
                shadowColor: Colors.orange,
                margin: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => infoaplikasi()));
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      ListTile(
                        leading: Icon(
                          Icons.perm_device_information_outlined,
                          size: 50,
                          color: Colors.orange,
                        ),
                        title: Text('Info Aplikasi',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.orange)),
                        // subtitle: Text('Daftar Log Serangan'),
                      ),
                    ],
                  ),
                ),
              ),
// Card info aplikasi terbaru

              // //Card Serangan
              // Card(
              //   elevation: 5,
              //   margin: const EdgeInsets.all(8.0),
              //   child: InkWell(
              //     // Push ke log serangan
              //     onTap: () {
              //       Navigator.push(context,
              //           MaterialPageRoute(builder: (context) => logserangan()));
              //     },
              //     // End push ke log serangan
              //     splashColor: Colors.orange,
              //     child: Center(
              //       child: Column(
              //         mainAxisSize: MainAxisSize.min,
              //         children: const <Widget>[
              //           Icon(
              //             Icons.bug_report,
              //             color: Colors.orange,
              //             size: 50.0,
              //           ),
              //           Text("LOG SERANGAN", style: TextStyle(fontSize: 17.0))
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              // //akhir card log serangan

              // // IPtables
              // Card(
              //   elevation: 5,
              //   margin: const EdgeInsets.all(8.0),
              //   child: InkWell(
              //     // Push ke iptables
              //     onTap: () {
              //       Navigator.push(context,
              //           MaterialPageRoute(builder: (context) => iptables()));
              //     },
              //     // End push ke log serangan
              //     splashColor: Colors.orange,
              //     child: Center(
              //       child: Column(
              //         mainAxisSize: MainAxisSize.min,
              //         children: const <Widget>[
              //           Icon(
              //             Icons.border_color_rounded,
              //             color: Colors.orange,
              //             size: 50.0,
              //           ),
              //           Text("IPTables", style: TextStyle(fontSize: 17.0))
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              // // End Iptables

              // //Card Info Aplikasi
              // Card(
              //   elevation: 5,
              //   margin: const EdgeInsets.all(8.0),
              //   child: InkWell(
              //     // Push ke info aplikasi
              //     onTap: () {
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => const infoaplikasi()));
              //     },
              //     // End ke info aplikasi
              //     splashColor: Colors.orange,
              //     child: Center(
              //       child: Column(
              //         mainAxisSize: MainAxisSize.min,
              //         children: const <Widget>[
              //           Icon(
              //             Icons.perm_device_information,
              //             color: Colors.orange,
              //             size: 50.0,
              //           ),
              //           Text("INFO APLIKASI", style: TextStyle(fontSize: 17.0))
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              // //Akhir card info aplikasi
            ],
          ),
        ));
  }
}
