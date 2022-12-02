import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_project/model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final myBox = Hive.lazyBox<Student>('students1'); // box<Student>('students1');

  void writeData() {
    var random = Random();
    myBox.add(Student(id: random.nextInt(1000), name: "sinan"));
  }

  void readData()  {
  
 // ignore: avoid_function_literals_in_foreach_calls
 myBox.keys.isNotEmpty ? myBox.keys.forEach((element) async {
      var getData = await myBox.get(element);
    
      debugPrint("${getData!.name} ${getData.id}");
    }) : debugPrint("Null");
  }

  void deleteData() {
    myBox.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: writeData,
              color: Colors.red,
              child: const Text("Write"),
            ),
            MaterialButton(
              onPressed: readData,
              color: Colors.blue,
              child: const Text("Read"),
            ),
            MaterialButton(
              onPressed: deleteData,
              color: Colors.green,
              child: const Text("Delete"),
            ),
          ],
        ),
      ),
    );
  }
}
