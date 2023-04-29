import 'package:attendance/features/students/widgets/student_card.dart';
import 'package:attendance/models/student.dart';
import 'package:attendance/providers/subject_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentGrid extends StatelessWidget {
  final List<Student>? studentsList;

  const StudentGrid({Key? key, required this.studentsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final subject =  Provider.of<SubjectProvider>(context, listen: false).subject.subjectid;

    return ListView.builder(
      itemCount: studentsList?.length ?? 0,
      itemBuilder: (context, index) {
        return StudentCard(
            name: studentsList![index].name ?? " ",
            enrollment_no: studentsList![index].enrollmentNo ?? 0,
            sem: studentsList![index].semester ?? 1,
            subjectid: subject ?? " ",
            section: studentsList![index].section ?? " ",
            department: studentsList![index].department ?? " ");
      },
    );
  }
}
