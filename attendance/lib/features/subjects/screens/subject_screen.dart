import 'package:attendance/common/widgets/loader.dart';
import 'package:attendance/features/subjects/services/subject_service.dart';
import 'package:attendance/features/subjects/widgets/subjectGrid.dart';
import 'package:attendance/features/subjects/widgets/subject_card.dart';
import 'package:attendance/models/subject.dart';
import 'package:attendance/providers/teacher_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// class SubjectScreen extends StatefulWidget {
//   const SubjectScreen({Key? key}) : super(key: key);

//   @override
//   State<SubjectScreen> createState() => _SubjectScreenState();
// }

// class _SubjectScreenState extends State<SubjectScreen> {
//   final SubjectService subservice = SubjectService();
//   List<Subject>? subjectList = [];

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void didChangeDependencies() {
//     print(true);
//     fetchSubjects();
//     print(subjectList);
//     print(false);
//   }

//   fetchSubjects() async {
//     subjectList = await subservice.fetchSubjects(
//         context: context,
//         teacherName: Provider.of<TeacherProvider>(context)
//             .teacher
//             .teacherName
//             .toString());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Your Subjects"),
//       ),
//       body: SubjectsGrid(subjectList: subjectList)
//     );
//   }
// }


class SubjectScreen extends StatelessWidget {
  final SubjectService subservice = SubjectService();

  Future<List<Subject>> _fetchSubjects(BuildContext context) async {
    final teacherName = Provider.of<TeacherProvider>(context, listen: false)
        .teacher
        .teacherName
        .toString();
    final subjects = await subservice.fetchSubjects(context: context, teacherName: teacherName);
    return subjects;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Subjects"),
      ),
      body: FutureBuilder<List<Subject>>(
        future: _fetchSubjects(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Loader());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final subjectList = snapshot.data;
          return SubjectsGrid(subjectList: subjectList);
        },
      ),
    );
  }
}
