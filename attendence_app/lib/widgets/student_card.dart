import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentCard extends StatelessWidget {
  final String name;
  final BigInt enrollment_no;
  final String department;
  final int semester;
  final String section;

  StudentCard(
      {required this.name,
      required this.enrollment_no,
      required this.department,
      required this.semester,
      required this.section});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return InkWell(
        onTap: () {
          print("tapped");
        },
        child: Card(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Enrollment No : ${enrollment_no}',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Class: ${department} ${section}',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
