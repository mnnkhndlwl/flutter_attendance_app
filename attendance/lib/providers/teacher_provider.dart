import 'package:attendance/models/teacher.dart';
import 'package:flutter/material.dart';

class TeacherProvider extends ChangeNotifier {
  Teacher _teacher = Teacher(
    token: '',
    teacherName: '',
    email: '',
    department: ''
  );

  Teacher get teacher => _teacher;

  void setTeacher(String teacher) {
    _teacher = Teacher.fromJson(teacher);
    notifyListeners();
  }

  void setTeacherFromModel(Teacher teacher) {
    _teacher = teacher;
    notifyListeners();
  }
}