import 'package:attendence_app/providers/student_provider.dart';
import 'package:attendence_app/services/student_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../widgets/student_card.dart';

class SrudentListScreen extends StatefulWidget {
  static const routeName = '/students';
  const SrudentListScreen({Key? key}) : super(key: key);

  @override
  State<SrudentListScreen> createState() => _SrudentListScreenState();
}

class _SrudentListScreenState extends State<SrudentListScreen> {
  final StudentService studservice = StudentService();
  var department;
  var semester;
  var section;
 

  @override
  Widget build(BuildContext context) {
     var _isInit = true;
  var _isLoading = true;

  @override
  void initState() {
    print('initial');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      print(department);
      studservice
          .fetchAndSetStudents(
              context: context,
              department: department != null ? department : 'ECE',
              section: section != null ? section : 'B',
              semester: semester != null ? semester : 5)
          .then((_) {
        setState(() {
          if (department != null) _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    department = routeArgs['department'];
    section = routeArgs['section'];
    semester = routeArgs['semester'];
    final student = Provider.of<Students>(context);
    final subs = student.students;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text('Students'),
      ),
      body: _isLoading
          ? SpinKitThreeInOut(
              color: Colors.deepPurpleAccent,
              size: 50.0,
            )
          : ListView.builder(
              itemCount: subs.length,
              itemBuilder: (context, index) {
                return StudentCard(
                  name: subs[index].name ?? '',
                  enrollment_no: subs[index].enrollment_no ?? BigInt.parse('0'),
                  semester: subs[index].semester ?? 0,
                  department: subs[index].department ?? '',
                  section: subs[index].section ?? '',
                );
              },
            ),
    );
  }
}
