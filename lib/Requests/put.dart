part of http_kit;

Future<RequestResponse> _httpPut(
  String url,
  Map<String, String> headers,
  Object body,
  Encoding encoding,
) async {
  if (await _checkConnection()) {
    try {
      final response = await http.put(
        Uri.parse(url),
        headers: headers,
        body: body,
        encoding: encoding,
      );
      return _response(response);
    } on SocketException {
      return _result('No Internet connection', 502, null);
    } catch (e) {
      return _result(e.toString(), null, null);
    }
  } else {
    return _result('No Internet connection', 502, null);
  }
}
