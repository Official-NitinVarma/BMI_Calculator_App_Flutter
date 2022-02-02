import 'dart:ui';

import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:week_one_application/utils/MyRoutes.dart';
import 'package:week_one_application/utils/user_info.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var userName = "";

  var changeButton = false;
  final _registrationKey = GlobalKey<FormState>();

  navigateNextPage(BuildContext) async {
    if (_registrationKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(milliseconds: 230));
      await Navigator.pushNamed(context, MyRoutes.homeScreen);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _registrationKey,
        child: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/signup_image.png",
                  fit: BoxFit.cover,
                  width: 270,
                  height: 270,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  userName == "" ? "Register Yourself" : "Welcome $userName!",
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text("Below details are required to calculate your BMI"),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      TextFormField(
                        onChanged: (value) {
                          UserInfo.username = value;

                          userName = value;

                          setState(() {});
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "You must enter your name to continue";
                          } else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                          // border: OutlineInputBorder(
                          //     borderRadius: BorderRadius.circular(20)),
                          // prefixIcon: Icon(CupertinoIcons.person),
                          hintText: "Enter your name",
                          label: Text(
                            "Enter your name",
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter your age",
                          label: Text(
                            "Enter your age",
                          ),
                        ),
                        validator: (String? age) {
                          var agenew = age;
                          if (age!.isEmpty) {
                            return "You must enter your age to continue";
                          } else if (age.isNotEmpty) {
                            UserInfo.userAge = int.parse(age);
                            var agenew = int.parse(age);
                            if (agenew < 15) {
                              return "Ages below 15 are not adviced to calculate BMI";
                            }
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Eg: 165",
                          label: Text(
                            "Enter Height (cm)",
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "You must enter your height to continue";
                          } else {
                            UserInfo.userHeight = int.parse(value);
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Eg: 65",
                          label: Text(
                            "Enter Weight (Kg)",
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "You must enter your weight to continue";
                          } else {
                            UserInfo.userWeight = int.parse(value);
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Material(
                        // color: Color(0xff3f3d56),
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30),
                        child: InkWell(
                          onDoubleTap: () {
                            setState(() {
                              changeButton = false;
                            });
                          },
                          onTap: () => navigateNextPage(BuildContext),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 200),
                            width: changeButton == true ? 50 : 150,
                            height: 50,
                            alignment: Alignment.center,
                            child: changeButton == true
                                ? Icon(
                                    CupertinoIcons.checkmark_alt,
                                    color: Colors.white,
                                  )
                                : Text(
                                    "Continue",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors
                                            .white, //0xff3f3d56 -> Black ; 0xff90ee90 -> Green
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
