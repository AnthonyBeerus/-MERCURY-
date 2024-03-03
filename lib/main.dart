import 'package:flutter/material.dart';
import 'package:project_mercury/database/expense_database.dart';
import 'package:project_mercury/pages/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //* initialize db
  await ExpenseDatabse.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

