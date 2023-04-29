import 'dart:convert';
import 'package:attendance/constants/errorhandling.dart';
import 'package:attendance/constants/global_variables.dart';
import 'package:attendance/models/student.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StudentService {

  void takeAttendance(
      {required BuildContext context,
      required int enrollment_no,
      required int sem,
      required String subjectid,
      required String section,
      required String department,
      required bool present}) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/attendance/takeAttendance'),
        body: jsonEncode({
          "enrollment_no": enrollment_no,
          "sem": sem,
          "subjectid": subjectid,
          "section": section,
          "department": department,
          "present": present
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          print(res);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('lag agayi'),
          ));
        },
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(e.toString()),
          ));
    }
  }

  Future<List<Student>> fetchStudents(
      {required BuildContext context,
      required String department,
      required String section,
      required int sem}) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/students/showstudents'),
        body: jsonEncode(
          {'department': department, 'section': section, 'semester': sem},
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      List<dynamic> studentMaps = jsonDecode(res.body);
      return studentMaps
          .map((studentMap) => Student.fromJson(studentMap))
          .toList();
    } catch (e) {
      throw e;
    }
  }
}
