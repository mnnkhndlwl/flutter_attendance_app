import 'package:attendence_app/screens/StudentListScreen.dart';
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
        Navigator.of(context).pushNamed(SrudentListScreen.routeName,arguments: {
          'department' : department,
          'section' : section,
          'semester' : semester
        });
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 10,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: FadeInImage(
                    placeholder: const AssetImage(
                        'assets/images/product-placeholder.png'),
                    image: NetworkImage(subImg),
                    fit: BoxFit.cover,
                    width: mediaQuery.size.width,
                    height: mediaQuery.size.height * 0.25,
                  ),
                ), // it work as a helper widget
                Positioned(
                  bottom: 20,
                  right: 0,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      name,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 6,
                      ),
                      Text(department.toUpperCase()),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 6,
                      ),
                      Text('Sem : ${semester}'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 6,
                      ),
                      Text('Section : ${section}'),
                    ],
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
