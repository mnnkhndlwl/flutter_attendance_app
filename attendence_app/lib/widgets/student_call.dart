import 'package:attendence_app/providers/student_provider.dart';
import 'package:attendence_app/services/student_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../widgets/student_card.dart';

class StudentCall extends StatefulWidget {
  final String department;
  final String section;
  final int semester;
  const StudentCall({Key? key, required this.department, required this.section, required this.semester}) : super(key: key);

  @override
  State<StudentCall> createState() => _StudentCallState();
}

class _StudentCallState extends State<StudentCall> {
  final StudentService studservice = StudentService();

  var _isInit = true;
  var _isLoading = true;

  @override
  void initState() {
    print('initial');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      print(widget.department);
      studservice
          .fetchAndSetStudents(
              context: context,
              department: widget.department,
              section: widget.section,
              semester: widget.semester)
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
    final student = Provider.of<Students>(context);
    final subs = student.students;
    return _isLoading
        ? SpinKitThreeInOut(
            color: Colors.deepPurpleAccent,
            size: 50.0,
          )
        : ListView.builder(
            itemCount: subs.length,
            itemBuilder: (context, index) {
              return StudentCard(
                name: subs[index].name ?? '',
                enrollment_no: subs[index].enrollment_no ?? BigInt.parse('0'),
                semester: subs[index].semester ?? 0,
                department: subs[index].department ?? '',
                section: subs[index].section ?? '',
              );
            },
          );
  }
}
