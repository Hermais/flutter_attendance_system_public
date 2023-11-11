
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{

}


class LoginPage extends StatefulWidget
{
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
        title: Text("Login to continue"),
      ),
      /// AHMED SALEM - put the body here after removing the container.
      body: Container(),

    );
  }
}