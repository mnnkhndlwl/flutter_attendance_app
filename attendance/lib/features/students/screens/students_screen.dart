import 'package:attendance/common/widgets/loader.dart';
import 'package:attendance/features/students/services/student_service.dart';
import 'package:attendance/features/students/widgets/student_grid.dart';
import 'package:attendance/models/student.dart';
import 'package:attendance/providers/subject_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentsScreen extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => StudentsScreen(),
      );
  @override
  State<StudentsScreen> createState() => _StudentsScreenState();
}

class _StudentsScreenState extends State<StudentsScreen> {
  final StudentService studentservice = StudentService();

  Future<List<Student>> _fetchStudents(BuildContext context) async {
    final department = Provider.of<SubjectProvider>(context, listen: false)
        .subject
        .department
        .toString();
    final section = Provider.of<SubjectProvider>(context, listen: false)
        .subject
        .section
        .toString();
    final sem = Provider.of<SubjectProvider>(context, listen: false)
        .subject
        .semester
        ?.toInt();
    final students = await studentservice.fetchStudents(
        context: context, department: department, section: section, sem: sem!);   
    return students;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Students"),
      ),
      body: FutureBuilder<List<Student>>(
        future: _fetchStudents(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Loader());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final studentsList = snapshot.data;
          return StudentGrid(studentsList: studentsList);
        },
      ),
    );
  }
}
