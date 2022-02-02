import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:week_one_application/utils/MyRoutes.dart';
import 'package:week_one_application/utils/logic_for_bmi.dart';
import 'package:week_one_application/utils/user_info.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userName = UserInfo.username;
  var userAge = UserInfo.userAge;
  num userBMI = UserInfo.userWeight /
      ((UserInfo.userHeight / 100) * (UserInfo.userHeight / 100));
  var statusBMI = CalculateBMI();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffefefe),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/new_image.png",
                fit: BoxFit.cover,
                height: 270,
              ),
              Container(
                alignment: Alignment.topCenter,
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/images/white.png",
                      fit: BoxFit.cover,
                    ),
                    //     Text("You name is $userName"),
                    //     Text("My age is $userAge"),
                    //     Text("Your BMI is ${userBMI.toStringAsFixed(2)}")
                    Positioned(
                      child: Text(
                        "Your calculated BMI",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      top: 25,
                      right: 100,
                    ),
                    Positioned(
                      bottom: 110,
                      right: 100,
                      child: Text(
                        userBMI.toStringAsFixed(2),
                        style: TextStyle(
                            color: statusBMI.methodCalculate(userBMI) ==
                                    "Normal weight"
                                ? Colors.green
                                : Colors.red,
                            fontSize: 60,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Material(
                color: Colors.black,
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(20),
                  // ),
                  alignment: Alignment.center,
                  width: 150,
                  height: 50,
                  child: Text(
                    
                    statusBMI.methodCalculate(userBMI),
                    style: TextStyle(
                      color:
                          statusBMI.methodCalculate(userBMI) == "Normal Weight"
                              ? Colors.white
                              : Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Text(
                      "Body Mass Index (BMI), estimates your percentage of body fat based on your height and weight.",
                      style: TextStyle(
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      statusBMI.methodCalculate(userBMI) == "Obesity"
                          ? "${UserInfo.username}, your BMI isn’t where it should be, you must reduce your caloric intake and increase your exercise."
                          : statusBMI.methodCalculate(userBMI) == "Underweight"
                              ? "You are adviced to put on weight by eating small meals frequently throughout the day. Try to snack on healthy, high energy foods like cheese, nuts, milk-based smoothies and dried fruit."
                              : statusBMI.methodCalculate(userBMI) ==
                                      "Overweight"
                                  ? "You are Overweight. You adviced to reduce your caloric intake and increase your exercise."
                                  : "Your BMI is Normal. Keep exercising and intake balanced diet!",
                      style:
                          TextStyle(height: 1.5, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
