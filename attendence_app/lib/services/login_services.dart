import 'dart:convert';
import 'package:attendence_app/models/teacher.dart';
import 'package:attendence_app/providers/teacher_provider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/utils.dart';

// <-----------------------------Sign up ke liye galti se login type kar diya -------------------------------------->
// 
//   void loginTeacher(
//       {required BuildContext context,
//       required String email,
//       required String password}) async {
//     try {
//       Teacher teacher = Teacher(
//         teacherName: '',
//         email: email,
//         password: password,
//         department: '',
//       );

//       http.Response res = await http.post(
//         Uri.parse('http://192.168.0.102:8800/api/teacher/login/'),
//         body: teacher.toJson(),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//       );

//       httpErrorHandle(
//         response: res,
//         context: context,
//         onSuccess: () {
//           showSnackBar(
//             context,
//             'Account created! Login with the same credentials!',
//           );
//         },
//       );
//     } catch (e) {
//       showSnackBar(context, e.toString());
//     }
//   }
// }

// <--------------------------------Login ----------------------------------------->
class LoginService {
void signInUser({
  required BuildContext context,
  required String email,
  required String password,
}) async {
  try {
    var teacherProvider = Provider.of<TeacherProvider>(context,listen: false);
     http.Response res = await http.post(
        Uri.parse('http://192.168.43.125:8800/api/teacher/login/'),
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
//          SharedPreferences prefs = await SharedPreferences.getInstance();
          //var data = json.decode(res.body);
          teacherProvider.setTeacher(res.body);
//          await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
        },
      );
  } catch (e) {
    showSnackBar(context, e.toString());
    print(e);
  }
}
}

// void signInUser({
//     required BuildContext context,
//     required String email,
//     required String password,
//   }) async {
//     try {
//       var userProvider = Provider.of<UserProvider>(context, listen: false);
//       final navigator = Navigator.of(context);
//       http.Response res = await http.post(
//         Uri.parse('${Constants.uri}/api/signin'),
//         body: jsonEncode({
//           'email': email,
//           'password': password,
//         }),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//       );
//       httpErrorHandle(
//         response: res,
//         context: context,
//         onSuccess: () async {
//           SharedPreferences prefs = await SharedPreferences.getInstance();
//           userProvider.setUser(res.body);
//           await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
//           navigator.pushAndRemoveUntil(
//             MaterialPageRoute(
//               builder: (context) => const HomeScreen(),
//             ),
//             (route) => false,
//           );
//         },
//       );
//     } catch (e) {
//       showSnackBar(context, e.toString());
//     }
//   }

// Future<void> _login(String email, String password) async {
//   try {
//     Response response = await post(
//         Uri.parse('http://192.168.0.102:8800/api/teacher/login/'),
//         body: json.encode({'email': email, 'password': password},),);
 
//     if (response.statusCode == 200) {
//       var data = jsonDecode(response.body);
//       print(data[0]['email']);
//       print('Login successfully');
//     } else {
//       print('failed');
//     }
//   } catch (error) {
//     throw error;
//   }
// }