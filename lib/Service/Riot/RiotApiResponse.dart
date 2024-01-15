import 'package:app/Service/Riot/RiotException.dart';
import 'package:logger/logger.dart';

class RiotApiResponse<T> {
  RiotApiException? exception;
  bool isSuccess;
  Logger logger = Logger();

  //String? message;
  T? response;

  RiotApiResponse({required this.isSuccess, this.exception, this.response});


  static Future<RiotApiResponse<T2>> handleExceptions<T2>(Future<RiotApiResponse<T2>> Function() asyncFunction) async {
    try {
      return await asyncFunction();
    } catch (e) {
      return RiotApiResponse(
          isSuccess: false,
          exception : RiotApiException.makeException(e)
      );
    }
  }


}