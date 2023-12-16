import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/cubits/theme_change_manager_cubit.dart';
import '../../../shared/shared_pref/shared_theme_colors.dart';
import '../temp_users_nav/temp_users_navigator.dart';

class LoginPage extends StatefulWidget {



  const LoginPage(
      {super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    const buttonTextIconsColor = Colors.white;
     /// BlocBuilder receives emits from the cubit and rebuilds the widget tree.
    return BlocBuilder<ThemeChangeManagerCubit, ThemeChangeManagerState>(
  builder: (context, state) {
    MaterialColor materialColor = state.primarySwatchAppColor;
    final buttonsColor = materialColor.withAlpha(100);

    return Scaffold(
      appBar: AppBar(
        // flexibleSpace: state.appBarFlexibleSpace,
        title: const Text("Login to continue"),
        actions:  [
          Container(
            margin: const EdgeInsets.only(right: 20),
            alignment: Alignment.centerRight,
            child: DropdownButton<MaterialColor>(
              icon: Icon(
                Icons.color_lens_sharp,
                size: 50,
                color: materialColor[500]!.withAlpha(150),
              ),
              value: materialColor,
              elevation: 0,
              underline: Container(
                height: 0,
                color: Colors.transparent,
              ),
              onChanged: (MaterialColor? newValue) {
                ManageLastThemeColor().saveLastThemeColor(newValue!);
                BlocProvider.of<ThemeChangeManagerCubit>(context).changeTheme(newValue);

              },
              items: ManageLastThemeColor().materialColors
                  .map((MaterialColor color) {
                return DropdownMenuItem<MaterialColor>(
                  value: color,
                  child: Container(
                    color: color[500],
                    height: 30,
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),

      /// AHMED SALEM - put the body here after removing the container.
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const FlutterLogo(
                size: 130,
              ),
              const SizedBox(
                height: 30,
              ),
              // const Text(
              //   'Hello!',
              //   style: TextStyle(fontSize: 25, color:  buttonTextIconsColor,fontWeight: FontWeight.w500),
              // ),
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
                  onFieldSubmitted: (String value) {
                    print(value);
                  },
                  decoration:  InputDecoration(
                    labelText: 'User Name',
                    suffixText: '@eng.zu.edu.eg',
                    prefixIcon: Icon(
                      Icons.key,
                      color: Theme.of(context).primaryColor,),

                    border: const OutlineInputBorder(),
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
                  onFieldSubmitted: (String value) {
                    print(value);
                  },
                  decoration:  InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Theme.of(context).primaryColor,

                    ),
                    suffixIcon: Icon(Icons.remove_red_eye,
                      color: Theme.of(context).primaryColor,
                    ),
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 79),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonsColor,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const NoLoginNavigation(
                          //appBarFlexibleSpace: state.appBarFlexibleSpace,
                        ),
                      ),
                    );

                  },
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.login,
                          color: buttonTextIconsColor,
                          size: 30,
                        ),
                      ),
                      Text(
                        'Login',
                        style: TextStyle(color: buttonTextIconsColor , fontSize: 25),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonsColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  child:  const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.qr_code_scanner,
                          color: buttonTextIconsColor,
                          size: 30,
                        ),
                      ),
                      Text(
                        'Scan to Login',
                        style: TextStyle(color: buttonTextIconsColor, fontSize: 25),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     const Text(
              //       'Don\'t have an account?',
              //       style: TextStyle(
              //         fontSize: 16,
              //         color: Colors.black,
              //       ),
              //     ),
              //     MaterialButton(
              //       child:  Text(
              //         'Create',
              //         style: TextStyle(
              //           fontSize: 20,
              //           color: Theme.of(context).primaryColor,
              //
              //         ),
              //       ),
              //       onPressed: () {
              //       },
              //     )
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  },
);

  }
}
