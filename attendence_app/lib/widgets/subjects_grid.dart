import 'package:attendence_app/providers/subject_provider.dart';
import 'package:attendence_app/widgets/subject_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubjectsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final subjectsData = Provider.of<Subjects>(context);
    final subs = subjectsData.subjects;
    return ListView.builder(
        itemCount: subs.length,
        itemBuilder: (context, index) {
          return SubjectCard(
              id: index+1,
              subjectid: subs[index].subjecctid ?? '',
              name: subs[index].name ?? '',
              subImg: subs[index].subImg ?? '',
              semester: subs[index].semester ?? 0,
              department: subs[index].department ?? '',
              section: subs[index].section ?? '',
            );
        },
      );
  }
}

 

   // child: Text(subs[index].name ?? ''),