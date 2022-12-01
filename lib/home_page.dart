import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final myBox = Hive.box('test');

  void writeData() {
    // myBox.put(1, "Sinan");

    myBox.add("sinan ${myBox.keys.length}");
  }

  void readData() {
    
   
    myBox.keys.isNotEmpty
        // ignore: avoid_function_literals_in_foreach_calls
        ? myBox.keys.forEach((element) {
          
            debugPrint(myBox.get(element));
          })
        : debugPrint("null");

    // debugPrint(myBox.get(1));
  }

  void deleteData() {
    for (var element in myBox.keys) {
      //debugPrint(element.toString());
      myBox.delete(element);
    }
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
