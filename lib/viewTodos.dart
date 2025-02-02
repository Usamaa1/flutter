import 'package:dio/dio.dart';
import 'package:firstapp/TodosDescription.dart';
import 'package:firstapp/todosModel.dart';
import 'package:flutter/material.dart';

class Viewtodos extends StatefulWidget {
  const Viewtodos({super.key});

  @override
  State<Viewtodos> createState() => _ViewtodosState();
}

class _ViewtodosState extends State<Viewtodos> {
  Dio dio = new Dio();

  @override
  void initState() {
    super.initState();
    todosGet();
  }

  Future<List<Todos>> todosGet() async {
    try {
      Response todosResponse =
          await dio.get("https://jsonplaceholder.typicode.com/todos");

      // print(todosResponse);

      List<Todos> todos = (todosResponse.data as List)
          .map((json) => Todos.toJson(json))
          .toList();
      return todos;
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: todosGet(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          final todosList = snapshot.data!;
          return ListView.builder(
              itemCount: todosList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TodosDescription(
                                  todoId: todosList[index].id,
                                )));
                  },
                  title: Text("${todosList[index].title}"),
                );
              });
        },
      ),
    );
  }
}
