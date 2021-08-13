part of http_kit;

class RequestResponse {
  RequestResponse({this.message, this.data, this.statusCode});

  final String message;
  final dynamic data;
  final int statusCode;
}
