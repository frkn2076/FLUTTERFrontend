class BaseResponse {
  bool? isError;
  String? errorMessage;

  BaseResponse({this.isError, this.errorMessage});

  BaseResponse.fromJson(Map<String, dynamic> json) {
    isError = json['IsError'];
    errorMessage = json['ErrorMessage'];
  }
}