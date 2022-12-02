
import 'package:hive/hive.dart';
part 'model.g.dart';

@HiveType(typeId: 1)
class Student {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  Student({required this.id, required this.name});

  @override
  String toString() {
    
    return "id: $id, name: $name";
  }

}
