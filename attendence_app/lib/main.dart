import 'package:attendence_app/providers/student_provider.dart';
import 'package:attendence_app/providers/subject_provider.dart';
import 'package:attendence_app/providers/teacher_provider.dart';
import 'package:attendence_app/screens/StudentListScreen.dart';
import 'package:attendence_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'screens/home_screen.dart';

void main() async { 
    await dotenv.load();
  runApp(

      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => TeacherProvider()),
          ChangeNotifierProvider(create: (_) => Subjects()),
          ChangeNotifierProvider(create: (_) => Students()),
        ],
        child: MyApp(),
      ),
    );
} 

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        SrudentListScreen.routeName : (context) => SrudentListScreen(),
      },
      title: 'Attendance app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Provider.of<TeacherProvider>(context).teacher.teacherName.isEmpty ? LoginPage() : const HomeScreen(),
    );
  }
}
