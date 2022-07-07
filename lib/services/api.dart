import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:eservice/dialogs/app.dart';
import 'package:eservice/services/app_exception.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:http/http.dart' as http;

class Api {
  static const String orderascending = "&filter[order]=name asc";
  static const int TIME_OUT_DURATION = 20;

  Future<dynamic> get(baseUrl) async {
    var uri = Uri.parse(baseUrl);
    try{
      var response =await http.get(uri).timeout(Duration(seconds: TIME_OUT_DURATION));;
      return _processResponse(response);
    }on SocketException {
     App.showError(title: 'Connection Error', description: 'This problem occur due  to no internet acces or server error');
    }on TimeoutException {
      App.showError(title: 'Timeour request', description: 'This problem occur due  to slow internt connection');
    }
  }
  

  /// 200 ok
  /// 400  Bad request - The request had bad syntax or was inherently impossible to be satisfied.
  /// 401 Unauthorized - The parameter to this message gives a specification of authorization schemes which are acceptable. The client should retry the request with a suitable Authorization header.
  /// 403 Forbidden - The request is for something forbidden. Authorization will not help.
  /// 500 Internal Error - The server encountered an unexpected condition which prevented it from fulfilling the request.
  /// 204 Server has received the request but there is no information to send back, and the client should stay in the same document view. This is mainly to allow input for scripts without changing the document at the same time.

  dynamic _processResponse(http.Response response) {


    print(response.statusCode);
      switch(response.statusCode){
        case 200:
          var responseJson = utf8.decode(response.bodyBytes);
          return jsonDecode(responseJson);
        case 204:
        throw NoRespondException();
        case 400:
        throw BadRequestException();
        case 401:
        throw UnAuthorizeEception();
        case 403:
        throw ForbiddenException();
        case 404:
        throw NotFoundException();
        case 500:
        throw FetchDataException(message: 'The server does not support the facility required');
        default:
        throw FetchDataException();
        
      }
  }


}
