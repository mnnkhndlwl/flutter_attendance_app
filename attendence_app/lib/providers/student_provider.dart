import 'package:attendence_app/models/student.dart';
import 'package:flutter/foundation.dart';

class Students extends ChangeNotifier {
  List<Student> _students = [];

  List<Student> get students {
    return [..._students];
  }

  void setStudents(List<Student> stu) {  // to set our teacher but we will be providing this function string teacher and then 
  // convert that string to json
    _students = stu;
    print(_students);
    notifyListeners();
  }
}
