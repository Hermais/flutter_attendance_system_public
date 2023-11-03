import 'package:flutter/material.dart';
import 'package:flutter_attendance_system/admin/admin_ui.dart';

import 'package:flutter_attendance_system/qr_apis/qr_app.dart';
///This is a test comment for git

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();



}

class LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  String adminUsername = '7@T0RaemVXaDNNSGRp'; // Replace with your admin username.


  Future<void> login() async {
    final username = usernameController.text;
    /// quickly to login REMOVE IT IN PRODUCTION
    usernameController.text = adminUsername;
    if (username == adminUsername) {
      // If the entered username matches the admin's username, you can navigate to a new screen.
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Login is successful")));
      Navigator.push(context, MaterialPageRoute(builder: (context) => const MainAdminUI()));
    } else {
      // Handle incorrect login (show an error message, for example).
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Login failed!")));
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Login to continue')),
      body: Container(
        padding: const EdgeInsets.all(15),
        child:
          Center(
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(labelText: 'Identifier'),
                ),
                ElevatedButton(
                  onPressed: login,
                  child: const Text('Login'),
                ),
                ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder:
                    (context) => QRScanner(getResultFromQR))).then((value) {
                      login();

                    });
                  },
                  child: const Text('Scan to login'),
                ),
              ],
            ),
          ),

      ),
    );
  }

  void getResultFromQR(String identifier)
  {

    usernameController.text = identifier;

  }

}

