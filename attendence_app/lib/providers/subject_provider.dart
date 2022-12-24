import 'package:attendence_app/models/subject.dart';
import 'package:flutter/foundation.dart';

class Subjects extends ChangeNotifier {
  List<Subject> _subjects = [];

  List<Subject> get subjects {
    return [..._subjects];
  }

  void setSubjects(List<Subject> sub) {  // to set our teacher but we will be providing this function string teacher and then 
  // convert that string to json
    _subjects = sub;
    print(_subjects);
    notifyListeners();
  }
}
