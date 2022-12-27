import 'package:attendence_app/widgets/student_call.dart';
import 'package:flutter/material.dart';

class SrudentListScreen extends StatefulWidget {
  static const routeName = '/students';
  const SrudentListScreen({Key? key}) : super(key: key);

  @override
  State<SrudentListScreen> createState() => _SrudentListScreenState();
}

class _SrudentListScreenState extends State<SrudentListScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    var department = routeArgs['department'];
    var section = routeArgs['section'];
    var semester = routeArgs['semester'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text('Students'),
      ),
      body: StudentCall(
        department: department,
        section: section,
        semester: semester,
      ),
    );
  }
}
