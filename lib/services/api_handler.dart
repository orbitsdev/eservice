import 'dart:async';
import 'dart:io';

import 'package:eservice/dialogs/app.dart';
import 'package:eservice/services/app_exception.dart';

/// 200 ok
/// 400  Bad request - The request had bad syntax or was inherently impossible to be satisfied.
/// 401 Unauthorized - The parameter to this message gives a specification of authorization schemes which are acceptable. The client should retry the request with a suitable Authorization header.
/// 403 Forbidden - The request is for something forbidden. Authorization will not help.
/// 500 Internal Error - The server encountered an unexpected condition which prevented it from fulfilling the request.
/// 204 Server has received the request but there is no information to send back, and the client should stay in the same document view. This is mainly to allow input for scripts without changing the document at the same time.
///
class ApiHandler {
  void errorHandler(error) {
        if (error is BadRequestException) {
          App.showError(description: error.message);
        }else 
    if (error is BadRequestException) {
      App.showError(title: error.prefix, );
    } else if (error is NoRespondException) {
      App.showError(title: error.prefix, description: ' Server has received the request but there is no information to send back');
   } else if (error is UnAuthorizeEception) {
      App.showError(title: error.prefix, description: 'Sorry you are not authrozie to access this infromation');
    } else if (error is ForbiddenException) {
      App.showError(title: error.prefix, description: 'Unable to access information forbidden');
    } else if (error is FetchDataException) {
      App.showError(title: error.prefix);
    }
  }
}
