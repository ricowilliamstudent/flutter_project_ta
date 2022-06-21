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
              scale: 3,
            ),
            Card(
              elevation: 5,
              margin: const EdgeInsets.all(5),
              child: InkWell(
                // End ke info aplikasi
                splashColor: Colors.orange,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      Text(
                          '   Aplikasi Intrusion Prevention System merupakan aplikasi mobile yang '
                          ' digunakan dengan tujuan membantu administrator jaringan server untuk '
                          ' melakukan monitoring jaringan server jika terjadi serangan yang '
                          ' ditujukan pada jaringan server dan menampilkan list serangan terhadap '
                          ' server yang dilindungi.',
                          style: TextStyle(
                            height: 1.5,
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.justify),
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
