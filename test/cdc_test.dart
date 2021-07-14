// import 'dart:convert';

// import 'package:flutter_test/flutter_test.dart';
// import 'package:http/http.dart' as http;

void main() {

//   test('Add item service test', () async {
//     final fixedHeaders = {
//       "Access-Control-Allow-Origin": "*",
//       "Content-type": "application/json",
//     };

//     final body = jsonEncode(<String, Object>{
//       'Name': 'Read book',
//     });

//     final responseSuccess = await http.post(Uri.parse('http://37.148.212.195:5000/todo/add'), headers: fixedHeaders, body: body);
//     Map responseSuccessBody = jsonDecode(responseSuccess.body);
//     expect(responseSuccess.statusCode, 200);
//     expect(responseSuccessBody.length, 2);
//     expect(responseSuccessBody['IsSuccess'], true);

//     final responseFail = await http.post(Uri.parse('http://37.148.212.195:5000/todo/add'), headers: fixedHeaders);
//     Map responseFailBody = jsonDecode(responseFail.body);
//     expect(responseFail.statusCode, 200);
//     expect(responseFailBody.length, 2);
//     expect(responseFailBody['IsSuccess'], false);
//     expect(responseFailBody['ErrorMessage'], 'Geçici süre işleminizi gerçekleştiremiyoruz.');
//   });

//   test('List items service test', () async {
//     final fixedHeaders = {
//       "Access-Control-Allow-Origin": "*",
//       "Content-type": "application/json",
//     };

//     final responseSuccess = await http.get(Uri.parse('http://37.148.212.195:5000/todo/items'), headers: fixedHeaders);
//     Map responseSuccessBody = jsonDecode(responseSuccess.body);
//     expect(responseSuccess.statusCode, 200);
//     expect(responseSuccessBody.length, 2);
//     expect(responseSuccessBody['IsSuccess'], true);
//     expect(responseSuccessBody['Items'], isNotNull);
//   });
}