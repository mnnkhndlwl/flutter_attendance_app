import 'package:attendence_app/models/teacher.dart';
import 'package:attendence_app/providers/subject_provider.dart';
import 'package:attendence_app/providers/teacher_provider.dart';
import 'package:attendence_app/widgets/subjects_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../services/subject_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final SubjectService subservice = SubjectService();
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      final teacher = Provider.of<TeacherProvider>(context).teacher;
      subservice
          .fetchAndSetSubjects(
              context: context,
              teacherName: teacher.teacherName,
              department: teacher.department)
          .then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final teacher = Provider.of<TeacherProvider>(context).teacher;
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi ${teacher.teacherName} ! Here are your Subjects'),
      ),
      body: _isLoading
          ? SpinKitWave(
              color: Colors.blue,
              size: 50.0,
            )
          : SubjectsGrid(),
    );
  }
}
