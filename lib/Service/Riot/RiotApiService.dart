import 'dart:async';

import 'package:app/Model/RiotApi/AccountDto.dart';
import 'package:app/Model/RiotApi/LeagueEntryDTO.dart';
import 'package:app/Model/RiotApi/MatchDto.dart';
import 'package:app/Service/Riot/RiotApiResponse.dart';
import 'package:app/Model/RiotApi/SummonerDTO.dart';
import 'package:app/Model/RiotApi/SummonerProfile.dart';
import 'package:app/Service/StaticLogger.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import 'RiotApiCounter.dart';


///"id": "QQMFARSaAmOJn6rIY8C2IKFIcfo96zGUozn8B93jhqEcqu4",
class RiotApiService {
  static String key = "RGAPI-350d51cf-0618-4d02-8c72-efbc03657f39";
  static String matchUrl =
      "https://asia.api.riotgames.com/tft/match/v1/matches/KR_6862430937?api_key=RGAPI-350d51cf-0618-4d02-8c72-efbc03657f39";
  static String puuid = "CrSVcTKsGOhgdKlq8ZMNGg78aTCSmKWjVAhFUS9n631VjkCEweGg7H5YxzrvV66wt0cj2gXnCDWMAA";

  static int startDay = 1703376000;

  static List<String> matchIdList = [];
  static Map<String, MatchDto> matchDtoMap = {};
  static int nextMatch = 0;

  static Logger logger = Logger();

  static RiotApiCounter riotApiCounter = RiotApiCounter();

  /// 매치 id 가져오기
  static Future<RiotApiResponse<List<String>>> getMatchIds(String puuid, int count) async {
    return RiotApiResponse.handleExceptions(()async{
      final response = await http.get(
          Uri.parse(
              "https://asia.api.riotgames.com/tft/match/v1/matches/by-puuid/$puuid/ids?start=0&count=$count&api_key=$key")
      );
      riotApiCounter.matchId++;

      if (response.statusCode == 200) {
        //Logger().i(jsonDecode(response.body));
        return RiotApiResponse(
          isSuccess: true,
          response: List<String>.from(jsonDecode(response.body))
        );
      } else {
        throw response.statusCode;
      }
    });
  }

  /// 매치 정보 가져오기
  static Future<RiotApiResponse<MatchDto>> getMatch(String matchId) async {
    return RiotApiResponse.handleExceptions(()async{
      final response =
      await http.get(Uri.parse("https://asia.api.riotgames.com/tft/match/v1/matches/$matchId?api_key=$key"));
      riotApiCounter.match++;

      if (response.statusCode == 200) {
        RiotApiResponse<MatchDto> riotApiResponse = RiotApiResponse<MatchDto>(
          isSuccess: true,
          response: MatchDto.fromMap(jsonDecode(response.body), matchId)
        );

        /*await Future.wait(
          riotApiResponse.response!.info.participants.map((element)async
            {
              RiotApiResponse<SummonerDTO> summonerRes = await getSummonerDtoByPuuid(element.puuid);
              if(!summonerRes.isSuccess){
                StaticLogger.logger.e("[RiotApiService.getMatch()] SummonerDTO 가져오기 실패 : id = ${element.puuid} , msg = ${summonerRes.exception!}");
              }
              element.summonerDTO = summonerRes.response;
            }
          )
        );*/

        return riotApiResponse;

      } else {
        throw response.statusCode;
      }
    });

  }

  static Future<RiotApiResponse<String>> getPuuid(String name, String tag) async {
    return RiotApiResponse.handleExceptions(()async{
      final response = await http
          .get(Uri.parse("https://asia.api.riotgames.com/riot/account/v1/accounts/by-riot-id/$name/$tag?api_key=$key"))
          .timeout(Duration(seconds: 10));

      riotApiCounter.account++;

      if (response.statusCode == 200) {
        return RiotApiResponse<String>(
            isSuccess: true,
            response: jsonDecode(response.body)['puuid']
        );
      } else {
        throw response.statusCode;
      }
    });
  }

  static Future<RiotApiResponse<SummonerProfile>> getSummonerProfileByName(String name , String tag){
    return RiotApiResponse.handleExceptions(()async{
      RiotApiResponse<String> puuidRes = await RiotApiService.getPuuid(name, tag);
      if(!puuidRes.isSuccess){
        return RiotApiResponse(isSuccess: false , exception: puuidRes.exception!);
      }

      String puuid = puuidRes.response!;

      return await getSummonerProfileByPuuid(puuid);
    });
  }

  static Future<RiotApiResponse<SummonerProfile>> getSummonerProfileByPuuid(String puuid) async {
    /// 1. id를 알아낸다
    /// 2. AccountDto를 가져온다
    /// 2. id로 리그 앤트리를 가져온다
    /// 3. 프로필 이미지를 가져온다
    /// 4. 합쳐서 객체를 만들어서 반환한다.

    return RiotApiResponse.handleExceptions(()async{
      //#1. 소환사 id 가져오기
      final summonerRes = await http
          .get(Uri.parse("https://kr.api.riotgames.com/tft/summoner/v1/summoners/by-puuid/$puuid?api_key=$key"))
          .timeout(Duration(seconds: 10));

      riotApiCounter.puuid++;

      if (summonerRes.statusCode != 200) {
        throw summonerRes.statusCode;
      }

      SummonerDTO summonerDTO = SummonerDTO.fromMap(jsonDecode(summonerRes.body));

      //#2. AccountDto 가져오기

      final accountRes = await http
          .get(Uri.parse(
          "https://asia.api.riotgames.com/riot/account/v1/accounts/by-puuid/$puuid?api_key=$key"
      )).timeout(Duration(seconds: 10));

      riotApiCounter.account++;

      if (accountRes.statusCode != 200) {
        throw accountRes.statusCode;
      }

      AccountDto accountDto = AccountDto.fromMap(jsonDecode(accountRes.body));

      //#3. 리그 엔트리 가져오기
      final leagueRes = await http
          .get(Uri.parse(
          "https://kr.api.riotgames.com/tft/league/v1/entries/by-summoner/${summonerDTO.id}?api_key=$key" //id가 여러개여서 확인
      )).timeout(Duration(seconds: 10));

      riotApiCounter.leagueEntry++;

      if (leagueRes.statusCode != 200) {
        throw leagueRes.statusCode;
      }

      List<LeagueEntryDTO> leagueEntryDTOList = LeagueEntryDTO.fromJsonList(jsonDecode(leagueRes.body));

      //#. 반환
      return RiotApiResponse(
          isSuccess: true,
          response: SummonerProfile(
              leagueEntryDTOList: leagueEntryDTOList,
              summonerDTO: summonerDTO,
              name: summonerDTO.name,
              tag: accountDto.tagLine,
              profileImageNumber: summonerDTO.profileIconId
          )
      );

    });
  }

  static Future<RiotApiResponse<SummonerDTO>> getSummonerDtoByPuuid(String puuid , {int isRetry = 0}){
    return RiotApiResponse.handleExceptions(()async{
      StaticLogger.logger.i("[RiotApiService.getSummonerDtoByPuuid()] 재시도");
      final summonerRes = await http
          .get(Uri.parse("https://kr.api.riotgames.com/tft/summoner/v1/summoners/by-puuid/$puuid?api_key=$key"))
          .timeout(const Duration(seconds: 10));

      riotApiCounter.summoner++;

      if(summonerRes.statusCode == 429){
        StaticLogger.logger.i("[RiotApiService.getSummonerDtoByPuuid()] ${jsonDecode(summonerRes.body)} ,  ${summonerRes.headers}");
        if(isRetry < 5){
          await Future.delayed(const Duration(seconds: 1));
          isRetry++;
          return getSummonerDtoByPuuid(puuid, isRetry: isRetry);
        }
      }
      
      if (summonerRes.statusCode != 200) {
        throw summonerRes.statusCode;
      }

      SummonerDTO summonerDTO = SummonerDTO.fromMap(jsonDecode(summonerRes.body));

      return RiotApiResponse<SummonerDTO>(
          isSuccess: true,
          response: summonerDTO
      );
    });
  }
}
