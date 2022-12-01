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
  final myBox = Hive.box<Student>('students');

  void writeData() {
    myBox.add(Student(id: 23, name: "sinan"));
  }

  void readData() {
   myBox.keys.isNotEmpty ? myBox.keys.forEach((element) {
      debugPrint(myBox.get(element)!.name.toString()+" : "+myBox.get(element)!.id.toString());
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
