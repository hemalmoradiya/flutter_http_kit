part of http_kit;

Future<RequestResponse> _httpPost(
  String url,
  Map<String, String> headers,
  Object body,
  Encoding encoding,
) async {
  if (await _checkConnection()) {
    try {
      final response = await http.post(
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

// multi-part request
Future<RequestResponse> _multipartPost(
  String url,
  Map<String, String> files,
  Map<String, dynamic> fields,
  Map<String, String> header,
) async {
  if (await _checkConnection()) {
    try {
      final request = http.MultipartRequest('POST', Uri.parse(url));

      if (files != null) {
        if (files.isNotEmpty) {
          files.forEach((key, value) async {
            final multipartFile = await http.MultipartFile.fromPath(key, value);
            request.files.add(multipartFile);
          });
        }
      }

      if (fields != null) {
        if (fields.isNotEmpty) {
          fields.forEach((key, value) {
            request.fields[key] = value;
          });
        }
      }

      if (header != null) {
        request.headers.addAll(header);
      }

      final response = await request.send();
      return await _responseOfMultiPart(response);
    } on SocketException {
      return _result('No Internet connection', 502, null);
    } catch (e) {
      return _result(e.toString(), null, null);
    }
  } else {
    return _result('No Internet connection', 502, null);
  }
}
