import 'dart:convert';
import 'package:attendance/constants/global_variables.dart';
import 'package:attendance/models/subject.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class SubjectService {
  final _messangerKey = GlobalKey<ScaffoldMessengerState>();

  Future<List<Subject>> fetchSubjects({
    required BuildContext context,
    required String teacherName,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/subjects/displaySubjects/'),
        body: jsonEncode(
          {'teacherName': teacherName},
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      List<dynamic> subjectMaps = jsonDecode(res.body);
      return subjectMaps.map((subjectMap) => Subject.fromJson(subjectMap)).toList();
    } catch (e) {
       _messangerKey.currentState?.showSnackBar( SnackBar(content: Text(e.toString()) ));
       throw e;
    }
  }
}
