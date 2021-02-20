import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'constants.dart';
import 'custom_route.dart';
import 'dashboard_screen.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/auth';

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: Constants.logoName,
      // logo: 'assets/images/ecorp.png',
      emailValidator: (value) {
        if (!value.contains('@')) {
          return "Email must contain '@'";
        }
        return null;
      },
      passwordValidator: (value) {
        if (value.isEmpty) {
          return 'Password is empty';
        }
        return null;
      },
      onLogin: (loginData) {
        print('Login info');
        print('Name: ${loginData.name}');
        print('Password: ${loginData.password}');
        return Future<String>.value("Login"); //_loginUser(loginData.name, loginData.password);
      },
      onSignup: (loginData) {
        print('Signup info');
        print('Name: ${loginData.name}');
        print('Password: ${loginData.password}');
        return Future<String>.value("Signup"); //_signUpUser(loginData.name, loginData.password);
      },
      onSubmitAnimationCompleted: (loginCompleted) {
        if (loginCompleted) {
          Navigator.of(context).pushReplacement(FadePageRoute(
            builder: (context) => DashboardScreen(),
          ));
        } else {
          Navigator.of(context).pushReplacement(FadePageRoute(
            builder: (context) => DashboardScreen(),
          ));
        }
      },
      onRecoverPassword: (name) {
        print('Recover password info');
        print('Name: $name');
        return Future<String>.value("Recover");//_recoverPassword(name);
        // Show new password dialog
      },
      showDebugButtons: true,
    );
  }
}
