import 'package:attendance/features/subjects/widgets/subject_card.dart';
import 'package:attendance/models/subject.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubjectsGrid extends StatelessWidget {
  final List<Subject>? subjectList;

  const SubjectsGrid({Key? key, required this.subjectList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: subjectList?.length ?? 0,
      itemBuilder: (context, index) {
        return SubjectCard(
          name: subjectList![index].name ?? '',
          subjectid: subjectList![index].subjectid ?? '',
          subImg: subjectList![index].subImg ?? '',
          semester: subjectList![index].semester ?? 0,
          department: subjectList![index].department ?? '',
          section: subjectList![index].section ?? '',
          teacherName: subjectList![index].teacherName ?? '',
        );
      },
    );
  }
}
 

   // child: Text(subs[index].name ?? ''),