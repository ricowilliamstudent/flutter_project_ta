// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
// import 'package:realmec2/main.dart';

// ignore: camel_case_types
class infoaplikasi extends StatelessWidget {
  const infoaplikasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("INFO APLIKASI"), backgroundColor: Colors.orange),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/suricataicon.png',
              scale: 2,
            ),
            Card(
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.orange, width: 1)),
              elevation: 5,
              shadowColor: Colors.orange,
              color: Color.fromARGB(255, 252, 165, 35),
              margin: const EdgeInsets.all(20.0),
              child: InkWell(
                // End ke info aplikasi
                splashColor: Colors.orange,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                            '   Aplikasi Mobile Intrusion Prevention System merupakan aplikasi yang '
                            ' digunakan untuk tujuan membantu administrator jaringan server dalam '
                            ' melakukan monitoring jaringan server, jika terjadi serangan yang '
                            ' ditujukan pada jaringan server sistem akan menampilkan list serangan terhadap '
                            ' server yang dilindungi. Serangan yang terdeteksi akan ditampilkan pada menu Log Serangan dan menu Iptables sebagai status tindakan aksi.'
                            ' Tindakan aksi yang dapat dilakukan terhadap ip penyerang yaitu Drop, Reject dan Accept.'
                            ' Port yang dilindungi adalah port TCP dan ICMP.',
                            style: TextStyle(
                              height: 1.5,
                              fontSize: 12,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.justify),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
