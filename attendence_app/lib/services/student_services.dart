import 'dart:convert';
import 'package:attendence_app/models/student.dart';
import 'package:attendence_app/providers/student_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../utils/utils.dart';

class StudentService {
  Future<void> fetchAndSetStudents(
      {required BuildContext context,
      required String department,
      required String section,
      required int semester}) async {
        var link = dotenv.env['localhost'];
    final studentProvider = Provider.of<Students>(context);
    try {
      http.Response res = await http.post(
        Uri.parse('${link}/api/students/showstudents/'),
        body: jsonEncode(
          {
            'department': department,
            'section': section,
            'semester' : semester
          },
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print(res.body);
      var extractedData = jsonDecode(res.body);
      if (extractedData == null) {
        return;
      }
      print(extractedData);
      List<Student> loadedStudents = [];
      for (var studentMap in extractedData) {
        Student newStudent = Student.fromMap(studentMap);
        loadedStudents.add(newStudent);
      }
      studentProvider.setStudents(loadedStudents);
    } catch (error) {
      showSnackBar(context, error.toString());
      print(error);
    }
  }
}
