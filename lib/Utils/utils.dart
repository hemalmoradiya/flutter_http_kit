part of http_kit;

RequestResponse _result(String message, int statusCode, dynamic data) {
  return RequestResponse(
    message: message,
    statusCode: statusCode,
    data: data,
  );
}

RequestResponse _response(http.Response response) {
  switch (response.statusCode) {
    case 200:
      final responseJson = json.decode(response.body.toString());
      return _result('success', response.statusCode, responseJson);
    case 201:
      final responseJson = json.decode(response.body.toString());
      return _result('created', response.statusCode, responseJson);
    case 400:
      final String _message = 'Invalid Request: ${response.body.toString()}';
      return _result(_message, response.statusCode, null);
    case 401:
      final String _message = 'Unauthorised: ${response.body.toString()}';
      return _result(_message, response.statusCode, null);
    case 403:
      final String _message = 'Forbidden: ${response.body.toString()}';
      return _result(_message, response.statusCode, null);
    case 500:
      final String _message = 'Internal Server Error: ${response.body.toString()}';
      return _result(_message, response.statusCode, null);
    default:
      final String _message =
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}';
      return _result(_message, response.statusCode, null);
  }
}

Future<RequestResponse> _responseOfMultiPart(http.StreamedResponse response) async {
  final String data = await response.stream.bytesToString();
  switch (response.statusCode) {
    case 200:
      final responseJson = json.decode(data);
      return _result('success', response.statusCode, responseJson);
    case 201:
      final responseJson = json.decode(data);
      return _result('created', response.statusCode, responseJson);
    case 400:
      final String _message = 'Invalid Request: $data';
      return _result(_message, response.statusCode, null);
    case 401:
      final String _message = 'Unauthorised: $data';
      return _result(_message, response.statusCode, null);
    case 403:
      final String _message = 'Forbidden: $data';
      return _result(_message, response.statusCode, null);
    case 500:
      final String _message = 'Internal Server Error: $data';
      return _result(_message, response.statusCode, null);
    default:
      final String _message =
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}';
      return _result(_message, response.statusCode, null);
  }
}
