import 'package:week_one_application/utils/user_info.dart';

class CalculateBMI {
  var userBMInew = UserInfo.userBMInum;
  var statusColor = "";
  var userBMIstatus = "";
  String methodCalculate(num userBMInew) {
    if (userBMInew < 18.90) {
      statusColor = "Colors.red";
      return userBMIstatus = "Underweight";
    } else if (userBMInew > 29.9) {
      statusColor = "Colors.red";
      return userBMIstatus = "Obesity";
    } else if (userBMInew >= 25) {
      statusColor = "Colors.red";
      return userBMIstatus = "Overweight";
    } else {
      statusColor = "Colors.green";
      return userBMIstatus = "Normal weight";
    }
  }
}
