import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app/data/database.dart';
import 'package:to_do_app/utils/dialog_bx.dart';
import 'package:to_do_app/utils/to_do_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _mybox = Hive.box('mybox');

  @override
  void initState(){
    if(_mybox.get("TODOLIST")== null){
      db.createData();
    }else{
      db.loadingData();
    }
    super.initState();
  }

  final _controller = TextEditingController();
  ToDoDataBase db = ToDoDataBase();

  void chekBoxChanged(bool? value, int index) {
    setState(() {
      db.toDo[index][1] = !db.toDo[index][1];
    });
    db.upDateData();
  }
   void savedNewTask(){
    setState(() {
     db.toDo.add([_controller.text,false]);
     _controller.clear();
    });
    Navigator.of(context).pop();
    db.upDateData();
  }


  void createNewTask(){
    showDialog(context: context, builder: (context){
      return DialogBx(controller: _controller,
      onSve: savedNewTask,
      onCancel: () => Navigator.of(context).pop,);
    });
    db.upDateData();
    
  }
  
   void deleteTask(int index){
    setState(() {
      db.toDo.removeAt(index);
    });
    db.upDateData();
   }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow[200],
        appBar: AppBar(
          title: const Text('TODO'),
          centerTitle: true,
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: db.toDo.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: db.toDo[index][0],
              taskCompleted: db.toDo[index][1],
              onChanged: (value) => chekBoxChanged(value, index),
              deleteFunction: (context)=>deleteTask(index),
              
            );
          },
        ));
  }
}
