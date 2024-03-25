import 'package:app/Service/Riot/RiotException.dart';
import 'package:app/Service/StaticLogger.dart';
import 'package:logger/logger.dart';

class RiotApiResponse<T> {
  RiotApiException? exception;
  StackTrace? stackTrace;
  bool isSuccess;
  Logger logger = Logger();

  T? response;

  RiotApiResponse({required this.isSuccess, this.exception, this.response , this.stackTrace});


  static Future<RiotApiResponse<T2>> handleExceptions<T2>(Future<RiotApiResponse<T2>> Function() asyncFunction) async {
    try {
      return await asyncFunction();
    } catch (e , stacktrace) {
      StaticLogger.logger.e('[RiotApiResponse.handleExceptions()] $stacktrace : $e : ${e.runtimeType}');
      return RiotApiResponse(
          isSuccess: false,
          exception : RiotApiException.makeException(e),
          stackTrace: stacktrace
      );
    }
  }


}