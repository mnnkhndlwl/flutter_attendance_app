import 'dart:convert';

import 'package:attendance/models/subject.dart';
import 'package:flutter/material.dart';

class SubjectProvider extends ChangeNotifier {
  Subject _subject = Subject(
    teacherName: '',
    name: '',
    subImg: '',
    semester: 1,
    department: '',
    section: '',
    subjectid: ''
  );

  Subject get subject => _subject;

  void setSubject({
  String? teacherName,
  String? name,
  String? subImg,
  int? semester,
  String? department,
  String? section,
  String? subjectid,
}) {
  _subject = Subject(
    teacherName: teacherName ?? '',
    name: name ?? '',
    subImg: subImg ?? '',
    semester: semester ?? 1,
    department: department ?? '',
    section: section ?? '',
    subjectid: subjectid ?? ''
  );
  print(_subject);
  notifyListeners();
}

  void setTeacherFromModel(Subject subject) {
    _subject = subject;
    notifyListeners();
  }
}