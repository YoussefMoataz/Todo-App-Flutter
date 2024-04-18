import 'package:floor/floor.dart';

@Entity(tableName: "todo")
class Todo {

  @PrimaryKey(autoGenerate: true)
  int? id;
  String title;
  String description;

  Todo({this.id, required this.title, required this.description});

}
