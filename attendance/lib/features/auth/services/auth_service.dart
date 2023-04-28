import 'dart:convert';
import 'package:attendance/constants/errorhandling.dart';
import 'package:attendance/constants/global_variables.dart';
import 'package:attendance/providers/teacher_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final _messangerKey = GlobalKey<ScaffoldMessengerState>();

  // sign in user
  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
    // SharedPreferences.setMockInitialValues({'token': ''});
      http.Response res = await http.post(
        Uri.parse('$uri/teacher/login'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          
          SharedPreferences prefs = await SharedPreferences.getInstance();
          Provider.of<TeacherProvider>(context, listen: false).setTeacher(res.body);
          await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
          print(prefs.getString('x-auth-token'));
          // Navigator.pushNamedAndRemoveUntil(
          //   context,
          //   BottomBar.routeName,
          //   (route) => false,
          // );
        },
      );
    } catch (e) {
      _messangerKey.currentState?.showSnackBar( SnackBar(content: Text(e.toString()) ));
    }
  }

  // get user data
  void getUserData(
    BuildContext context
  ) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('x-auth-token')!;
      print(prefs.getString('x-auth-token').toString());

      if (token == '') {
        prefs.setString('x-auth-token', '');
        print("null hai bhai");
      }

      var tokenRes = await http.post(
        Uri.parse('$uri/teacher/isValid'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'token': token
        },
      );

      var response = jsonDecode(tokenRes.body);
      print(response);
      if (response == true) {
        print("true");
        http.Response userRes = await http.get(
          Uri.parse('$uri/teacher/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'token': token
          },
        );
        var userProvider = Provider.of<TeacherProvider>(context, listen: false);
        userProvider.setTeacher(userRes.body);
      }
    } catch (e) {
      _messangerKey.currentState?.showSnackBar( SnackBar(content: Text(e.toString()) ));
    }
  }
}