import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:http/http.dart' as http;
import 'LoginModel.dart';
// import 'package:sn_progress_dialog/sn_progress_dialog.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController txtUsername = new TextEditingController();
  TextEditingController txtPassword = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // ProgressDialog pd = ProgressDialog(context: context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Login"),
        backgroundColor: Colors.orange,
      ),
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Image.asset(
                  'images/suricataicon.png',
                  scale: 3,
                ),
                TextFormField(
                  controller: txtUsername,
                  cursorColor: Colors.orange,
                  decoration: InputDecoration(
                      hintText: "Masukan Username",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.orange)),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange),
                      )),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: txtPassword,
                  cursorColor: Colors.orange,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Masukan Password",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.orange)),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange),
                      )),
                ),
                const SizedBox(height: 12),
                ButtonTheme(
                    height: 50,
                    minWidth: double.infinity,
                    buttonColor: Colors.orange,
                    child: RaisedButton(
                        onPressed: () async {
                          // pd.show(max: 100, msg: 'Loading...');
                          await this._doLogin();
                          // pd.close();
                        },
                        child: const Text("Login",
                            style: TextStyle(color: Colors.white)))),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future _doLogin() async {
    if (txtUsername.text.isEmpty || txtPassword.text.isEmpty) {
      Alert(context: context, title: "Data Tidak Benar", type: AlertType.error)
          .show();

      return;
    }

    // 'php artisan passport:install' in ubuntu server to connect
    final response = await http.post(
        Uri.parse('http://192.168.43.247:8080/api/login'),
        body: {'username': txtUsername.text, 'password': txtPassword.text},
        headers: {'Accept': 'application/json'});

    if (response.statusCode == 200) {
      final loginModel = loginModelFromJson(response.body);
      var token = loginModel.data.token;

      Navigator.pushReplacementNamed(context, 'home-page');

      Alert(context: context, title: "Login Berhasil", type: AlertType.success)
          .show();
    } else {
      print(response.body);
      await Alert(context: context, title: "Login Gagal", type: AlertType.error)
          .show();
    }
  }
}
