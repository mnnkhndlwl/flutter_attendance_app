import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubjectCard extends StatelessWidget {
  final int id;
  final String name;
  final String subjectid;
  final String subImg;
  final String department;
  final int semester;
  final String section;

  SubjectCard(
      {required this.id,
      required this.name,
      required this.subjectid,
      required this.subImg,
      required this.department,
      required this.semester,
      required this.section});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return InkWell(
      onTap: () {
        print("Tapped" + name);
      },
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Colors.black87,
        child: Column(
          children: [
            FadeInImage(
              placeholder:
                  const AssetImage('assets/images/product-placeholder.png'),
              image: NetworkImage(subImg),
              fit: BoxFit.cover,
              width: mediaQuery.size.width,
              height: mediaQuery.size.height * 0.25,
            ),
            Text(
              name,
              style: TextStyle(fontSize: 24,color: Colors.white),
            ),
            Text(
              "Branch : ${department.toUpperCase()}   SEM : ${semester}   Section : ${section} ",
              style: TextStyle(fontSize: 16,color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
