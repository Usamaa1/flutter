import 'package:flutter/material.dart';
import 'package:firstapp/todosModel.dart';
import 'package:firstapp/todosService.dart';

class CreateTodoPage extends StatefulWidget {
  @override
  _CreateTodoPageState createState() => _CreateTodoPageState();
}

class _CreateTodoPageState extends State<CreateTodoPage> {
  final TodosService todosService = TodosService();

  void createNewTodo() async {
    Todos newTodo = Todos(
      userId: 1,
      id: 101,
      title: "Learn Flutter POST API",
      completed: false,
    );

    Todos? createdTodo = await todosService.postTodo(newTodo);

    if (createdTodo != null) {
      print("Todo Created: ${createdTodo.title}");
    } else {
      print("Failed to create Todo.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Todo")),
      body: Center(
        child: ElevatedButton(
          onPressed: createNewTodo,
          child: Text("Create Todo"),
        ),
      ),
    );
  }
}
