import 'package:logger/logger.dart';

enum RiotApiExceptionCode{
  none,
  network,
  parsing,
  badRequest,
  unauthorized,
  forbidden,
  dataNotFound,
  methodNotAllowed,
  unsupportedMediaType,
  rateLimitExceeded,
  internalServerError,
  badGateway,
  serviceUnavailable,
  gatewayTimeout,
}

extension RiotApiExceptionCodeExtension on RiotApiExceptionCode {
  static RiotApiExceptionCode fromStatusCode(int statusCode) {
    switch (statusCode) {
      case 1:
        return RiotApiExceptionCode.network;
      case 2:
        return RiotApiExceptionCode.parsing;
      case 400:
        return RiotApiExceptionCode.badRequest;
      case 401:
        return RiotApiExceptionCode.unauthorized;
      case 403:
        return RiotApiExceptionCode.forbidden;
      case 404:
        return RiotApiExceptionCode.dataNotFound;
      case 405:
        return RiotApiExceptionCode.methodNotAllowed;
      case 415:
        return RiotApiExceptionCode.unsupportedMediaType;
      case 429:
        return RiotApiExceptionCode.rateLimitExceeded;
      case 500:
        return RiotApiExceptionCode.internalServerError;
      case 502:
        return RiotApiExceptionCode.badGateway;
      case 503:
        return RiotApiExceptionCode.serviceUnavailable;
      case 504:
        return RiotApiExceptionCode.gatewayTimeout;
      default:
        return RiotApiExceptionCode.none;
    }
  }
}


class RiotApiException implements Exception{

  late String msg;
  RiotApiExceptionCode exceptionCode;
  static Logger logger = Logger();

  static RiotApiException makeException<T>(Object e) {
    if(e is int){
      return _fromStatusCode(e).print();
    }
    if (e is FormatException) {
      return RiotApiException._parsing().print();
    } else {
      return RiotApiException._network().print();
    }
  }

  static RiotApiException _fromStatusCode(int statusCode){
    RiotApiExceptionCode code = RiotApiExceptionCodeExtension.fromStatusCode(statusCode);
    String msg;
    switch(code){
      case RiotApiExceptionCode.network : msg = "인터넷에 연결 할 수 없습니다.";
      case RiotApiExceptionCode.parsing : msg = "데이터 처리중 오류가 발생하였습니다.";
      case RiotApiExceptionCode.badRequest : msg = "요청이 잘못되었습니다.(400)";
      case RiotApiExceptionCode.dataNotFound : msg = "데이터를 찾을 수 없습니다.";
      case RiotApiExceptionCode.rateLimitExceeded : msg = "요청횟수를 초과했습니다.";
      case RiotApiExceptionCode.methodNotAllowed :
      case RiotApiExceptionCode.unsupportedMediaType :
      case RiotApiExceptionCode.internalServerError :
      case RiotApiExceptionCode.badGateway :
      case RiotApiExceptionCode.serviceUnavailable :
      case RiotApiExceptionCode.gatewayTimeout : msg = "Riot Api에 연결 할 수 없습니다.($statusCode)";
      default : msg =  "데이터를 가져 올 수 없습니다.($statusCode)";
    }
    return RiotApiException(msg: msg, exceptionCode: code);
  }

  RiotApiException({required this.msg , required this.exceptionCode});

  factory RiotApiException._network(){
    return RiotApiException(
      msg: "인터넷에 연결 할 수 없습니다.",
      exceptionCode: RiotApiExceptionCode.network
    );
  }

  factory RiotApiException._parsing(){
    return RiotApiException(
        msg: "데이터 처리중 오류가 발생하였습니다.",
        exceptionCode: RiotApiExceptionCode.parsing
    );
  }

  RiotApiException print(){
    logger.e("[RiotApiException.print()] $msg");
    return this;
  }
}