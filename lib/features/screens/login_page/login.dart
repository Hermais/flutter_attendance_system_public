import 'package:flutter/material.dart';
import 'package:flutter_attendance_system/core/cubits/auth_cubit.dart';
import 'package:flutter_attendance_system/features/widgets/connectivity_listener.dart';
import 'package:flutter_attendance_system/features/widgets/drop_down_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motion/motion.dart';

import '../../../core/cubits/theme_change_manager_cubit.dart';
import '../../../core/data/models/auth_post_model.dart';
import '../../../main.dart';
import '../../../shared/constants_and_statics/shared_vars.dart';
import '../../../shared/shared_pref/shared_theme_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  var devMode = false;
  var emailController = TextEditingController(text: 'hithamab@yahoo.com');
  var passwordController = TextEditingController(text: '19660603-9671-5368');
  var _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    const buttonTextIconsColor = Colors.white;

    return ConnectivityListener(
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, authState) {
          if (authState is AuthLoading) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Authorizing, Please wait...'),
                backgroundColor: Theme.of(context).primaryColor,
                duration: const Duration(seconds: 2),
              ),
            );
          }
          if (authState is AuthInitial) {
          } else if (authState is AuthSuccess) {
            if (authState.authGet.userType == 1) {
              Navigator.of(context).pushNamed(facultyAdmin);
            } else if (authState.authGet.userType == 2) {
              Navigator.of(context).pushNamed(student);
            } else if (authState.authGet.userType == 3) {
              Navigator.of(context).pushNamed(parent);
            } else if (authState.authGet.userType == 4) {
              Navigator.of(context).pushNamed(instructor);
            }
          } else if (authState is AuthFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Login Failed, try again!'),
              ),
            );
          }
        },
        child: BlocBuilder<ThemeChangeManagerCubit, ThemeChangeManagerState>(
          builder: (context, state) {
            MaterialColor materialColor = state.primarySwatchAppColor;
            final buttonsColor = materialColor.withAlpha(100);
      
            return Scaffold(
              appBar: AppBar(
                // flexibleSpace: state.appBarFlexibleSpace,
                title: const Text("Login to continue"),
                actions: [
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
                        BlocProvider.of<ThemeChangeManagerCubit>(context)
                            .changeTheme(newValue);
                      },
                      items: ManageLastThemeColor()
                          .materialColors
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
                      const Motion(
                        shadow: null,
                        child: FlutterLogo(
                          size: 200,
                        ),
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
                      Visibility(
                        visible: !devMode,
                        child: Column(
                          children: [
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
                                decoration: InputDecoration(
                                  labelText: 'User Name',
                                  prefixIcon: Icon(
                                    Icons.key,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  border: const OutlineInputBorder(),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Form(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 25,
                                ),
                                child: TextFormField(
                                  keyboardType: TextInputType.visiblePassword,
                                  controller: passwordController,
                                  obscureText: _obscurePassword,
                                  onFieldSubmitted: (String value) {
                                    print(value);
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                         _obscurePassword
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _obscurePassword = !_obscurePassword;
                                        });
                                      },
                                    ),
                                    border: const OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                          visible: devMode,
                          child: DropdownButtonWidget<String>(
                            items: const [
                              "admin_1@gmail.com 30301011366639",
                              "wferriby1@wikipedia.org 19860808-0785-8800",
                              "keales8@issuu.com 20021204-8706-8438",
                              "scockaymee@arizona.edu 19871129-0601-1282",
                              "hithamab@yahoo.com 19660603-9671-5368"
                            ],
                            selectionDescription: 'Select a user to login',
                            setValue: (String value) {
                              final email = value.split(" ")[0];
                              final password = value.split(" ")[1];
                              print(email);
                              print(password);
                              authCubit.postAuth(
                                AuthPost(
                                  emailId: email,
                                  nationalId: password,
                                ),
                              );
                            },
                          )),
                      const SizedBox(
                        height: 25,
                      ),
                      Visibility(
                        visible: !devMode,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 79),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: buttonsColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              authCubit.postAuth(
                                AuthPost(
                                  emailId: emailController.text,
                                  nationalId: passwordController.text,
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
                                  style: TextStyle(
                                      color: buttonTextIconsColor,
                                      fontSize: 25),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
