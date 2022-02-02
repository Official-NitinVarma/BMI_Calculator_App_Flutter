import 'package:flutter/material.dart';
import 'package:week_one_application/Screens/Home_Screen.dart';
import 'package:week_one_application/Screens/Signup_Screen.dart';
import 'package:week_one_application/utils/MyRoutes.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "BMI Calculator",
    initialRoute: MyRoutes.signupScreen,
    theme: ThemeData(
      primarySwatch: Colors.lightGreen,
    ),
    routes: {
      MyRoutes.signupScreen: (context) => SignupScreen(),
      MyRoutes.homeScreen: (context) => HomeScreen(),
    },
  ));
}
