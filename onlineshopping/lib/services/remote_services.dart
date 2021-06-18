import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:onlineshopping/main_common.dart';
import 'package:onlineshopping/services/api_exception.dart';

class RemoteServices {
  static var client = http.Client();
  static const TIME_OUT_DURATION = Duration(seconds: 1);
  Future<dynamic> getRequest() async {
    try {
      var response = await client
          .get(
            Uri.parse(baseURL + '?brand=maybelline'),
          )
          .timeout(TIME_OUT_DURATION);
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException("No internet connection.");
    } on TimeoutException {
      throw ApiNotRespondingException("Request session expired");
    }
  }

  Future<dynamic> postRequest(dynamic payLoad, dynamic header) async {
    try {
      var param = json.decode(payLoad);
      var response = await client
          .post(
            Uri.parse(baseURL + '?brand=maybelline'),
            body: param,
            headers: header,
          )
          .timeout(TIME_OUT_DURATION);
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException("No internet connection.");
    } on TimeoutException {
      ApiNotRespondingException("Request session expired");
    }
  }

  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return utf8.decode(response.bodyBytes);
        break;
      case 401:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request.url.toString());
        break;
      case 402:
        break;
      case 403:
        throw UnAuthorizedException(
            utf8.decode(response.bodyBytes), response.request.url.toString());
        break;
      case 500:
        break;
      default:
        throw FetchDataException(
            "Unable to fetch data : ${response.statusCode}",
            response.request.url.toString());
    }
  }
}


// if (response.statusCode == 200) {
      //   // return response.body;
      //   processResponse
      // } else {
      //   //show error message
      //   return null;
      // }