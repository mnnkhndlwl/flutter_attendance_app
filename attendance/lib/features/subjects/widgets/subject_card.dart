import 'package:attendance/features/students/screens/students_screen.dart';
import 'package:attendance/providers/subject_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubjectCard extends StatelessWidget {
  final String name;
  final String subjectid;
  final String subImg;
  final String department;
  final int semester;
  final String section;
  final String teacherName;

  SubjectCard({
    required this.name,
    required this.subjectid,
    required this.subImg,
    required this.department,
    required this.semester,
    required this.section,
    required this.teacherName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<SubjectProvider>(context, listen: false).setSubject(
          teacherName: teacherName,
          subjectid: subjectid,
          subImg: subImg,
          department: department,
          semester: semester,
          section: section,
          name: name
        );
        Navigator.push(context, StudentsScreen.route());
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(subImg),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    subjectid,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "$department - Sem $semester - $section",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Teacher: $teacherName",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
