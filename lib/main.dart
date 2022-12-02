import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_project/home_page.dart';
import 'package:hive_project/model.dart';

void main() async {
  await Hive.initFlutter('depo');
  //  await Hive.openBox('test');
  Hive.registerAdapter(StudentAdapter());

  // await Hive.openBox<Student>('students');
  await Hive.openLazyBox<Student>('students1');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // myOpenBox();
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: HomePage(),
    );
  }
}
