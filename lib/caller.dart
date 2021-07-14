import 'dart:convert';

import 'models/baseResponse.dart';
import 'models/todosResponse.dart';
import 'package:http/http.dart' as http;

Future<BaseResponse> addTodo(String name) async {
  final fixedHeaders = {
    "Access-Control-Allow-Origin": "*",
    "Content-type": "application/json",
  };
  
  final body = jsonEncode(<String, Object>{
    'Name': name,
  });

  final response = await http.post(Uri.parse('http://37.148.212.195:5000/todo/add'), headers: fixedHeaders, body: body);
  if (response.statusCode == 200) {
    return BaseResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load addTodo');
  }
}

Future<TodosResponse> getTodos() async {
  final fixedHeaders = {
    "Access-Control-Allow-Origin": "*",
    "Content-type": "application/json",
  };

  final response = await http.get(Uri.parse('http://37.148.212.195:5000/todo/items'), headers: fixedHeaders);
  if (response.statusCode == 200) {
    return TodosResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load getTodo');
  }
}