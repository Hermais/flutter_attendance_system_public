
import 'package:flutter/material.dart';

void main()
{

}


class LoginPage extends StatefulWidget
{
  final Widget? appBarFlexableSpace;

  const LoginPage({super.key, this.appBarFlexableSpace});

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
        flexibleSpace: widget.appBarFlexableSpace,
        title: const Text("Login to continue"),
      ),
      /// AHMED SALEM - put the body here after removing the container.
      body: Container(),

    );
  }
}