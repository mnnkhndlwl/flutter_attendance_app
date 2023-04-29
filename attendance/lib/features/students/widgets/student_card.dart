import 'package:attendance/features/students/services/student_service.dart';
import 'package:attendance/models/student.dart';
import 'package:flutter/material.dart';

class StudentCard extends StatefulWidget {
  final String name;
  final int enrollment_no;
  final int sem;
  final String subjectid;
  final String section;
  final String department;
  const StudentCard(
      {Key? key,
      required this.name,
      required this.enrollment_no,
      required this.sem,
      required this.subjectid,
      required this.section,
      required this.department})
      : super(key: key);

  @override
  _StudentCardState createState() => _StudentCardState();
}

class _StudentCardState extends State<StudentCard> {
  final StudentService studentService = StudentService();

  bool isPresent = false;

  // void takeAttendance() {

  // }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(widget.name),
        trailing: Checkbox(
          value: isPresent,
          onChanged: (bool? value) {
            setState(() {
              isPresent = value ?? false;
            });
            studentService.takeAttendance(
                context: context,
                enrollment_no: widget.enrollment_no,
                sem: widget.sem,
                subjectid: widget.subjectid,
                section: widget.section,
                department: widget.department,
                present: isPresent);
          },
        ),
      ),
    );
  }
}
