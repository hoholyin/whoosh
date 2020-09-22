import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:whoosh/requests/RequestBuilder.dart';

class PutRequestBuilder extends RequestBuilder {
  Map<String, String> body;

  RequestBuilder addBody(Map<String, String> body) {
    this.body = body;
    return this;
  }

  @override
  Future<http.Response> sendRequest() async {
    mountRequest();
    log('POST request to:' + finalUrl);
    return http.put(
      finalUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(body),
      // Send authorization headers to the backend.
      headers: {HttpHeaders.authorizationHeader: RequestBuilder.authorisationToken},
    );
  }
}
