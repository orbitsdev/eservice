class AppException implements Exception {

String? message;
String? prefix;
String? url;

  AppException({
    this.message,
    this.prefix,
    this.url,
});
  
 

}

class BadRequestException extends AppException{
  
 
  BadRequestException({String? message, String? url}) : super(message: message, prefix:'Bad Request' ,url: url);
}
class NoRespondException extends AppException{
  
  NoRespondException({String? message, String? url}) : super(message: message,prefix: 'No response', url: url);
}
class ForbiddenException extends AppException{
  ForbiddenException({String? message, String? url}) : super(message: message,prefix: 'Forbidden', url: url);
}
class FetchDataException extends AppException{
  FetchDataException({String? message, String? url}) : super(message: message,prefix: 'Unable to process', url: url);
}
class NotFoundException extends AppException{
  NotFoundException({String? message, String? url}) : super(message: message,prefix: 'Not Found', url: url);
}
class ApiNotRespondingException extends AppException{
  ApiNotRespondingException({String? message, String? url}) : super(message: message,prefix: 'Api not responding', url: url);
}

class UnAuthorizeEception extends AppException{
  UnAuthorizeEception({String? message, String? url}) : super(message: message,prefix: 'UnAuthorize Exception', url: url);
}



