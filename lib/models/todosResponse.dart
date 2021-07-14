class TodosResponse {
  bool? isError;
  List<String>? todos;

  TodosResponse({this.isError, this.todos});

  TodosResponse.fromJson(Map<String, dynamic> json) {
    isError = json['IsError'];
    todos = json['Items'] != null ? List.from(json['Items']) : null;
  }
}