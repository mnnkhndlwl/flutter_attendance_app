import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:attendance/common/widgets/loader.dart';
import 'package:attendance/features/students/services/student_service.dart';
import 'package:attendance/features/students/widgets/student_grid.dart';
import 'package:attendance/models/student.dart';
import 'package:attendance/providers/subject_provider.dart';

class Student_DetailScreen extends StatefulWidget {
  int enrollment_no;
  Student_DetailScreen({
    Key? key,
    required this.enrollment_no,
  }) : super(key: key);
  static route(int enrollment_no) => MaterialPageRoute(
        builder: (context) => Student_DetailScreen(
          enrollment_no: enrollment_no,
        ),
      );
  @override
  State<Student_DetailScreen> createState() => _Student_DetailScreenState();
}

class _Student_DetailScreenState extends State<Student_DetailScreen> {
  final StudentService studentservice = StudentService();

  Future<dynamic> _fetchStudents(BuildContext context) async {
    final department = Provider.of<SubjectProvider>(context, listen: false)
        .subject
        .department
        .toString();
    final subjectid = Provider.of<SubjectProvider>(context, listen: false)
        .subject
        .subjectid
        .toString();
    final section = Provider.of<SubjectProvider>(context, listen: false)
        .subject
        .section
        .toString();
    final sem = Provider.of<SubjectProvider>(context, listen: false)
        .subject
        .semester
        ?.toInt();
    final students = await studentservice.fetchStudentDetails(
        context: context,
        enrollment_no: widget.enrollment_no,
        department: department,
        section: section,
        subjectid: subjectid,
        sem: sem!);
    return students;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Students"),
      ),
      body: FutureBuilder<dynamic>(
        future: _fetchStudents(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Loader());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final jsonString = snapshot.data as String;
          final jsonData = jsonDecode(jsonString) as Map<String, dynamic>;
          final total = jsonData['total'] as int;
          // Text('Total: $total');
          return Column(
            children: <Widget>[
              Container(
                height: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.enrollment_no.toString(),
                      style: const TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Total: $total',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: const Text(
                        'Subject',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        Provider.of<SubjectProvider>(context, listen: false)
                            .subject
                            .name
                            .toString(),
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text(
                        'Class',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        Provider.of<SubjectProvider>(context, listen: false)
                            .subject
                            .department
                            .toString() +  Provider.of<SubjectProvider>(context, listen: false)
                            .subject
                            .section
                            .toString(),
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text(
                        'Semester',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        Provider.of<SubjectProvider>(context, listen: false)
                            .subject
                            .semester
                            .toString(),
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
