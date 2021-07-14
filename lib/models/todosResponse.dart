class TodosResponse {
  bool? isSuccess;
  String? errorMessage;
  List<TodoResponse>? todos;

  TodosResponse({this.isSuccess, this.errorMessage, this.todos});

  TodosResponse.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    errorMessage = json['ErrorMessage'];
    todos = [];
    if (json['Todos'] != null) {
      for (var todo in json['Todos']) {
        todos!.add(TodoResponse.fromJson(todo));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IsSuccess'] = this.isSuccess;
    data['ErrorMessage'] = this.errorMessage;
    if (this.todos != null) {
      data['Todos'] = this.todos?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TodoResponse {
  String? name;

  TodoResponse({this.name});

  TodoResponse.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    return data;
  }
}