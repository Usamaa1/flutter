import 'package:dio/dio.dart';
import 'package:firstapp/todosModel.dart';
import 'package:flutter/material.dart';

class TodosDescription extends StatefulWidget {
  final int todoId;
  const TodosDescription({super.key, required this.todoId});

  @override
  State<TodosDescription> createState() => _TodosDescriptionState();
}

class _TodosDescriptionState extends State<TodosDescription> {
  Dio dio = new Dio();

  @override
  void initState() {
    super.initState();
    getSingleTodo();
  }

  Future<Todos> getSingleTodo() async {
    Response singleTodo = await dio.get(
        "https://jsonplaceholder.typicode.com/todos",
        queryParameters: {"id": widget.todoId});

    Todos singleTodoObject = Todos.toJson(singleTodo.data[0]);
    print(singleTodoObject);
    return singleTodoObject;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: FutureBuilder(
              future: getSingleTodo(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                return Column(
                  children: [
                    Text("${snapshot.data!.id}"),
                    Text("${snapshot.data!.title}"),
                    Text("${snapshot.data!.completed}"),
                  ],
                );
              })),
    );
  }
}
