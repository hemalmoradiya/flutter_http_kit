// import 'dart:convert';
// import 'dart:io';

// import 'package:http/http.dart' as http;

// class ApiProvider {
//   Future getPost(String url) async {
//     var responseJson;
//     try {
//       final response = await http.get(Uri.parse(url));
//       responseJson = _response(response);
//     } on SocketException {
//       throw FetchDataException('No Internet connection');
//     }
//     return responseJson;
//   }

//   dynamic _response(http.Response response) {
//     switch (response.statusCode) {
//       case 200:
//         var responseJson = json.decode(response.body.toString());
//         print(responseJson);
//         return responseJson;
//       case 400:
//         throw BadRequestException(response.body.toString());
//       case 401:

//       case 403:
//         throw UnauthorisedException(response.body.toString());
//       case 500:

//       default:
//         throw FetchDataException(
//             'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
//     }
//   }
// }

// class CustomException implements Exception {
//   final _message;
//   final _prefix;

//   CustomException([this._message, this._prefix]);

//   String toString() {
//     return "$_prefix$_message";
//   }
// }

// class FetchDataException extends CustomException {
//   FetchDataException([String message]) : super(message, "Error During Communication: ");
// }

// class BadRequestException extends CustomException {
//   BadRequestException([message]) : super(message, "Invalid Request: ");
// }

// class UnauthorisedException extends CustomException {
//   UnauthorisedException([message]) : super(message, "Unauthorised: ");
// }

// class InvalidInputException extends CustomException {
//   InvalidInputException([String message]) : super(message, "Invalid Input: ");
// }
