import 'dart:convert';

import 'package:attendence_app/models/teacher.dart';
import 'package:flutter/foundation.dart';

class TeacherProvider extends ChangeNotifier {
  Teacher _teacher = Teacher(
    teacherName: '',
    email: '',
    password: '',
    department: '',
  );

  Teacher get teacher => _teacher; // to get our teacher

  void setTeacher(String teacher) {  // to set our teacher but we will be providing this function string teacher and then 
  // convert that string to json
    _teacher = Teacher.fromJson(teacher);
    notifyListeners();
  }

    void setTeacherFromModel(Teacher teacher) {
    _teacher = teacher;
    notifyListeners();
  }

}


