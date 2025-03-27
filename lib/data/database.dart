import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDo = [];
  final _mybox = Hive.box('mybox');

  void createData() {
    toDo = [
      ["Make tutorial", false],
      ["Do Excersise", false],
    ];
  }

  void loadingData(){
   toDo = _mybox.get("TODOLIST");
  }

  void upDateData(){
     _mybox.put("TODOLIST", toDo);
  }
}
