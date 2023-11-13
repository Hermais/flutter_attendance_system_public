
import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(home: LoginPage()
    ));

}


class LoginPage extends StatefulWidget
{
  final Widget? appBarFlexibleSpace;

  const LoginPage({super.key, this.appBarFlexibleSpace});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginPageState();
  }



}


class _LoginPageState extends State<LoginPage>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: widget.appBarFlexibleSpace,
        title: const Text("Login to continue"),
      ),
      /// AHMED SALEM - put the body here after removing the container.
      body: Container(),

    );
  }
}