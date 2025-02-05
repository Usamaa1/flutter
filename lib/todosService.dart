import 'package:dio/dio.dart';
import 'package:firstapp/todosModel.dart';

class TodosService {
  final Dio dio = Dio();

  Future<Todos?> postTodo(Todos todo) async {
    try {
      Response response = await dio.post(
        "https://jsonplaceholder.typicode.com/todos",
        data: {
          "userId": todo.userId,
          "id": todo.id, 
          "title": todo.title,
          "completed": todo.completed
        },
      );

      if (response.statusCode == 201) {
        // Successfully created, parse response
        return Todos.fromJson(response.data);
      }
    } catch (error) {
      print("Error posting todo: $error");
    }
    return null;
  }
}
