import 'dart:io';

import 'package:shelf/shelf.dart';

const _defaultCorsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Methods': 'GET, POST, PUT, PATH, DELETE, OPTIONS',
  'Access-Control-Allow-Headers':
      '${HttpHeaders.contentTypeHeader}, ${HttpHeaders.authorizationHeader}'
};

Middleware cors({Map<String, String> headers = _defaultCorsHeaders}) {
  return (innerHandler) {
    return (request) async {
      if (request.method == 'OPTIONS') {
        return Response(HttpStatus.ok, headers: headers);
      }

      final mapHeaders = {...request?.headers, ...headers};

      final response = await innerHandler(request.change(headers: mapHeaders));
      return response.change(headers: headers);
    };
  };
}

Middleware defaultContentType(String contentType) {
  return (innerHendler) {
    return (request) async {
      final response = await innerHendler(request);

      final mapHeaders = {
        ...request?.headers ?? {},
        'content-type': contentType
      };

      return response?.change(headers: mapHeaders) ?? Response.notFound('');
    };
  };
}
