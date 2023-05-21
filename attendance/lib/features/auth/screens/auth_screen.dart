import 'package:attendance/common/widgets/custom_button.dart';
import 'package:attendance/common/widgets/custom_textfield.dart';
import 'package:attendance/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:provider/provider.dart';

// login page
class AuthScreen extends StatefulWidget {
  // static String tag = 'login-page';
  static route() => MaterialPageRoute(
        builder: (context) => AuthScreen(),
      );
  @override
  _AuthScreenState createState() => new _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final AuthService authService = AuthService();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void loginUser() {
    authService.signInUser(
      context: context,
      email: emailController.text,
      password: passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    const logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image(
          image: NetworkImage(
              'https://www.studyplaces.co.in/wp-content/uploads/2021/05/bpit-logo.jpg'),
          width: 200,
          height: 300,
          fit: BoxFit.cover,
        ),
      ),
    );

    final email =
        CustomTextField(controller: emailController, hintText: "Email");

    final password =
        CustomTextField(controller: passwordController, hintText: "Password");

    final loginButton = CustomButton(
        text: "Login",
        onTap: loginUser);

    final forgotLabel = CustomButton(text: "Forgot Password ?", onTap: () {});

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            const SizedBox(height: 48.0),
            email,
            const SizedBox(height: 8.0),
            password,
            const SizedBox(height: 24.0),
            loginButton,
            const SizedBox(height: 8.0),
            forgotLabel
          ],
        ),
      ),
    );
  }
}
