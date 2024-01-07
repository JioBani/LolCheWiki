import 'package:app/Model/RiotApi/MatchDto.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class RiotApiService{
  static String key = "RGAPI-350d51cf-0618-4d02-8c72-efbc03657f39";
  static String matchUrl = "https://asia.api.riotgames.com/tft/match/v1/matches/KR_6862430937?api_key=RGAPI-350d51cf-0618-4d02-8c72-efbc03657f39";
  static String puuid = "CrSVcTKsGOhgdKlq8ZMNGg78aTCSmKWjVAhFUS9n631VjkCEweGg7H5YxzrvV66wt0cj2gXnCDWMAA";
  static int startDay = 1703376000;

  static List<String> matchIdList = [];
  static Map<String , MatchDto> matchDtoMap = {};
  static int nextMatch = 0;



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
      Logger().e(response.statusCode);
      throw Exception('Failed to load match list');
    }
  }

  static Future<int> loadNextMatchIdList(int count) async {
    final response = await http.get(
        Uri.parse(
            "https://asia.api.riotgames.com/tft/match/v1/matches/by-puuid/$puuid/ids?start=0&count=$count&api_key=$key"
        )
    );

    if (response.statusCode == 200) {
      matchIdList.addAll(List<String>.from(jsonDecode(response.body)));
      return response.statusCode;
    } else {
      Logger().e('Failed to load match list ${response.statusCode}');
      return response.statusCode;
    }
  }

  static Future<int> loadNextMatch(int count) async {
    int end = nextMatch + count - 1> matchIdList.length - 1 ? matchIdList.length + 1: nextMatch + count - 1;

    Logger().i("[RiotApiService.loadNextMatch()] nextMatch : $nextMatch ,  matchIdList.length ${ matchIdList.length} , end : $end");

    List<String> matchTarget = [];

    for(int i = nextMatch;  i< end; i++){
      matchTarget.add(matchIdList[i]);
    }

    List<MatchDto> matchDtoList = await Future.wait(
        matchTarget.map((e) => getMatch(e))
    );

    int result = 0;

    for (var matchDto in matchDtoList) {
      try{
        result++;
        matchDtoMap[matchDto.matchId] = matchDto;
      }catch(e){
        Logger().e(e);
      }
    }

    nextMatch = end + 1;

    return result;
  }

  static void resetData(){
    nextMatch = 0;
    matchIdList = [];
    matchDtoMap = {};
  }

}