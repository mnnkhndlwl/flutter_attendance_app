import 'dart:convert';
import 'package:attendence_app/models/subject.dart';
import 'package:attendence_app/providers/subject_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../utils/utils.dart';

class SubjectService {
  Future<void> fetchAndSetSubjects(
      {required BuildContext context,
      required String teacherName,
      required String department}) async {
    final subjectProvider = Provider.of<Subjects>(context);

    try {
      print(teacherName);
      try{
        http.Response res = await http.post(
        Uri.parse('http://192.168.0.100:8800/api/subjects/displaySubjects/'),
        body: jsonEncode({
            'teacherName': teacherName,
            'department': department,
          },),
           headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print(res.body);
      } catch (error) {
        print(error);
      }
    //   print(response.body);
    //   final extractedData = json.decode(response.body) as Map<String, dynamic>;
    //  // final extractedData = json.decode(response.body);
    //   if (extractedData == null) {
    //     return;
    //   }
    //   print(extractedData);
    //   final List<Subject> loadedSubjects = [];
    //   extractedData.forEach((id, subData) {
    //     loadedSubjects.add(Subject(
    //       name: subData['name'],
    //       subjecctid: subData['subjectid'],
    //       subImg: subData['subImg'],
    //       department: subData['department'],
    //       semester: subData['semester'],
    //       section: subData['section'],
    //       teacherName: subData['teacherName'],
    //     ));
    //   });
    //   subjectProvider.setSubjects(loadedSubjects);
    } catch (error) {
      showSnackBar(context, error.toString());
      print(error);
    }
  }
}
