
import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(
      home: LoginPage()
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
  var emailcontroler = TextEditingController();
  var passwordcontroler = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: widget.appBarFlexibleSpace,
        title: const Text("Login to continue"),
      ),
      /// AHMED SALEM - put the body here after removing the container.
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Icon(
                Icons.lock,
                size: 100,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Welcome To You',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight:FontWeight.w500
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailcontroler,
                  onFieldSubmitted: (String value){
                    print(value);
                  },
                  decoration: InputDecoration(
                    labelText: 'User Name',
                    prefixIcon: Icon(
                      Icons.key,
                    ),
                    border: OutlineInputBorder(),

                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: passwordcontroler,
                  obscureText: true,
                  onFieldSubmitted: (String value){
                    print(value);
                  },
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(
                      Icons.lock,
                    ),
                    suffixIcon: Icon(
                        Icons.remove_red_eye
                    ),
                    border: OutlineInputBorder(),

                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 79
                  ),
                  child: MaterialButton(
                    onPressed: (){
                      print(emailcontroler.text);
                      print(passwordcontroler.text);
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Container(
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 45
                  ),
                  child: MaterialButton(
                    onPressed: (){

                    },
                    child: Text(
                      'Scan with QRcode',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  MaterialButton(
                    child: Text(
                      'Create',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.lightBlue,
                      ),
                    ),
                    onPressed: (){
                      print("click On create");
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),

    );
  }
}
