library http_kit;

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
part 'Model/request_model.dart';
part 'Utils/utils.dart';
part 'Requests/get.dart';
part 'Requests/post.dart';
part 'Requests/put.dart';
part 'Requests/delete.dart';
part 'Connectivity/connectivity.dart';

class HttpKit {
  /// GET api, this will return [RequestResponse] model which is contain
  /// three parameter. data, statusCode and message.
  ///
  /// In which data contain the response of api and StatusCode, message containe the
  /// message of response.
  static Future<RequestResponse> get(String url,
          {Map<String, String> headers}) async =>
      await _httpGet(url, headers);

  ///Sends an HTTP POST request with the given headers and body to the given URL.
  ///
  ///[body] sets the body of the request. It can be a [String], a [List] or a [Map<String, String>]. If it's a String, it's encoded using [encoding] and used as the body of the request. The content-type of the request will default to "text/plain".
  ///
  ///If [body] is a List, it's used as a list of bytes for the body of the request.
  ///
  ///If [body] is a Map, it's encoded as form fields using [encoding]. The content-type of the request will be set to "application/x-www-form-urlencoded"; this cannot be overridden.
  ///
  ///[encoding] defaults to [utf8].
  ///
  ///For more fine-grained control over the request, use [Request] or [StreamedRequest] instead.
  ///
  ///this will return [RequestResponse] model which is contain
  ///three parameter. data, statusCode and message.
  ///
  ///In which data contain the response of api and StatusCode, message containe the
  ///message of response.
  static Future<RequestResponse> post(
    String url, {
    Map<String, String> headers,
    Object body,
    Encoding encoding,
  }) async =>
      _httpPost(url, headers, body, encoding);

  /// [files] is Map of files you have to send to the server
  ///
  /// [fields] is Map of fields
  ///
  ///this will return [RequestResponse] model which is contain
  ///three parameter. data, statusCode and message.
  ///
  ///In which data contain the response of api and StatusCode, message containe the
  ///message of response.
  static Future<RequestResponse> postMultiPart(
    String url, {
    Map<String, String> files,
    Map<String, dynamic> fields,
    Map<String, String> header,
  }) async =>
      _multipartPost(url, files, fields, header);

  ///Sends an HTTP PUT request with the given headers and body to the given URL.
  ///
  ///[body] sets the body of the request. It can be a [String], a [List] or a [Map<String, String>]. If it's a String, it's encoded using [encoding] and used as the body of the request. The content-type of the request will default to "text/plain".
  ///
  ///If [body] is a List, it's used as a list of bytes for the body of the request.
  ///
  ///If [body] is a Map, it's encoded as form fields using [encoding]. The content-type of the request will be set to "application/x-www-form-urlencoded"; this cannot be overridden.
  ///
  ///[encoding] defaults to [utf8].
  ///
  ///For more fine-grained control over the request, use [Request] or [StreamedRequest] instead.
  ///
  ///this will return [RequestResponse] model which is contain
  ///three parameter. data, statusCode and message.
  ///
  ///In which data contain the response of api and StatusCode, message containe the
  ///message of response.
  static Future<RequestResponse> put(
    String url, {
    Map<String, String> headers,
    Object body,
    Encoding encoding,
  }) async =>
      _httpPut(url, headers, body, encoding);

  ///Sends an HTTP DELETE request with the given headers to the given URL.
  ///
  ///This automatically initializes a new [Client] and closes that client once the request is complete. If you're planning on making multiple requests to the same server, you should use a single [Client] for all of those requests.
  ///
  ///For more fine-grained control over the request, use [Request] instead.
  ///
  ///this will return [RequestResponse] model which is contain
  ///three parameter. data, statusCode and message.
  ///
  ///In which data contain the response of api and StatusCode, message containe the
  ///message of response.
  static Future<RequestResponse> delete(
    String url, {
    Map<String, String> headers,
    Object body,
    Encoding encoding,
  }) async =>
      _httpDelete(url, headers, body, encoding);
}
