import 'dart:async';

import 'package:app/Model/RiotApi/MatchDto.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class RiotApiResponse<T>{
  int statusCode;
  String? message;
  T? response;

  RiotApiResponse({required this.statusCode , this.message , this.response});

  factory RiotApiResponse.fromException(int statusCode){

    String msg;

    switch(statusCode){
      case 1 : msg =  "인터넷에 연결 할 수 없습니다."; break;
      case 200 : msg = "success"; break;
      case 404 : msg = "데이터를 찾을 수 없습니다."; break;
      case 500 :
      case 502 :
      case 503 :
      case 504 : msg = "Riot 서버가 응답하지 않습니다. : ${statusCode}"; break;
      default : msg = "데이터를 가져 올 수 없습니다. : ${statusCode}"; break;
    }

    return RiotApiResponse<T>(
      statusCode: statusCode,
      message: msg,
      response: null
    );
  }

  factory RiotApiResponse.fromSuccess(T result){
    return RiotApiResponse<T>(
        statusCode: 200,
        response: result
    );
  }

  factory RiotApiResponse.fromNetworkError(){
    return RiotApiResponse<T>(
        statusCode: 0
    );
  }

}

class RiotApiService{
  static String key = "RGAPI-350d51cf-0618-4d02-8c72-efbc03657f39";
  static String matchUrl = "https://asia.api.riotgames.com/tft/match/v1/matches/KR_6862430937?api_key=RGAPI-350d51cf-0618-4d02-8c72-efbc03657f39";
  static String puuid = "CrSVcTKsGOhgdKlq8ZMNGg78aTCSmKWjVAhFUS9n631VjkCEweGg7H5YxzrvV66wt0cj2gXnCDWMAA";
  static int startDay = 1703376000;

  static List<String> matchIdList = [];
  static Map<String , MatchDto> matchDtoMap = {};
  static int nextMatch = 0;

  static Logger logger = Logger();


  /// 매치 id 가져오기
  static Future<List<String>> getMatchIds(String puuid, int count) async {
    final response = await http.get(
        Uri.parse(
            "https://asia.api.riotgames.com/tft/match/v1/matches/by-puuid/$puuid/ids?start=0&count=$count&api_key=$key"
        )
    );

    if (response.statusCode == 200) {
      //Logger().i(jsonDecode(response.body));
      return List<String>.from(jsonDecode(response.body));
    } else {
      Logger().e('Failed to load match list ${response.statusCode}');
      throw Exception('Failed to load match list ');
    }
  }

  /// 매치 정보 가져오기
  static Future<MatchDto> getMatch(String matchId) async {
    final response = await http.get(
        Uri.parse(
            "https://asia.api.riotgames.com/tft/match/v1/matches/$matchId?api_key=$key"
        )
    );

    if (response.statusCode == 200) {
      //Logger().i(jsonDecode(response.body));
      return MatchDto.fromJson(jsonDecode(response.body) , matchId);
    } else {
      logger.e(response.statusCode);
      throw Exception('Failed to load match list');
    }
  }
  
  static Future<RiotApiResponse<String>> getPuuid(String name , String tag) async{
    try{
      final response = await http.get(
          Uri.parse(
              "https://asia.api.riotgames.com/riot/account/v1/accounts/by-riot-id/$name/$tag?api_key=$key"
          )
      ).timeout(Duration(seconds: 10));

      if (response.statusCode == 200) {
        return RiotApiResponse<String>.fromSuccess(jsonDecode(response.body)['puuid']);
      } else {
        return RiotApiResponse<String>.fromException(response.statusCode);
      }
    } catch(e){
      logger.e(e);
      return RiotApiResponse<String>.fromNetworkError();
    }
  }
}