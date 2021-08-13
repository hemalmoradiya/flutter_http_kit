part of http_kit;

Future<RequestResponse> _httpGet(String url, Map<String, String> headers) async {
  if (await _checkConnection()) {
    try {
      final response = await http.get(Uri.parse(url), headers: headers);
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
