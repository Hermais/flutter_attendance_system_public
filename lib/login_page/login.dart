
import 'package:flutter/material.dart';
import 'package:flutter_attendance_system/users_pages/utilities/temp_users_navigator.dart';

void main()
{
  runApp(const MaterialApp(
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
  var emailController = TextEditingController();
  var passwordController = TextEditingController();


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
              const SizedBox(
                height: 10,
              ),
              Icon(
                Icons.lock,
                color: Theme.of(context).primaryColor,
                size: 100,
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Welcome!',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight:FontWeight.w500
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  onFieldSubmitted: (String value){
                    print(value);
                  },
                  decoration: const InputDecoration(
                    labelText: 'User Name',
                    prefixIcon: Icon(
                      Icons.key,
                    ),
                    border: OutlineInputBorder(),

                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: passwordController,
                  obscureText: true,
                  onFieldSubmitted: (String value){
                    print(value);
                  },
                  decoration: const InputDecoration(
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
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 79
                ),
                child: FilledButton(


                  onPressed: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => NoLoginNavigation(appBarFlexibleSpace: widget.appBarFlexibleSpace,),
                      ),
                    );
                    print(emailController.text);
                    print(passwordController.text);
                  },
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding:  EdgeInsets.all(8.0),
                        child: Icon(Icons.login,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 45
                ),
                child: FilledButton(
                  onPressed: (){

                  },
                  child:  const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding:  EdgeInsets.all(8.0),
                        child: Icon(Icons.qr_code_scanner,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      Text(
                        'Scan to Login',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an account?',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  MaterialButton(
                    child: const Text(
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
