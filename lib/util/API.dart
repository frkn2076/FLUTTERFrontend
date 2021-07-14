import '../models/baseResponse.dart';
import '../models/todosResponse.dart';

class API {
  static List<String> items = [];

  Future<BaseResponse> addTodo(String name) async {
    items.add(name);
    return BaseResponse(isError: false, errorMessage: null);
  }

  Future<TodosResponse> getTodos() async {
    return TodosResponse(isError: false, todos: items);
  }
}