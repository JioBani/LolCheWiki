
import 'package:app/Model/RiotApi/MatchDto.dart';
import 'package:app/Service/DataStoreService.dart';
import 'package:app/Service/Riot/RiotApiResponse.dart';
import 'package:app/Service/Riot/RiotApiService.dart';
import 'package:app/Service/StaticLogger.dart';
import 'package:logger/logger.dart';

class MatchDataService{
  List<String> matchIdList = [];
  List<MatchDto> matchDtoList = [];
  late final String _puuid;
  late int _nextMatchIndex;
  Logger logger = Logger();

  MatchDataService({required puuid}){
    _puuid = puuid;
    _nextMatchIndex = 0;
  }

  Future<void> setMatchIdList(int count) async{
    RiotApiResponse<List<String>> apiResponse = await RiotApiService.getMatchIds(_puuid, count);
    if(apiResponse.isSuccess){
      matchIdList = apiResponse.response!;
      if(matchIdList.isEmpty){
        logger.i("[MatchDataService.setMatchIdList()] 전적이 없음");
      }
      else{
        await DataStoreService.saveMatchIdList(RiotApiService.puuid  ,matchIdList);
      }
    }
  }

  Future<List<MatchDto>?> getNextMatchDtoList(int count) async{
    //TODO
    int index = _nextMatchIndex;
    int increase = 0;

    final List<MatchDto>? _matchDtoList;
    final List<String> targetIdList = [];

    if(matchIdList.isEmpty){
      await setMatchIdList(100);
    }

    for(int i = index; (i<_nextMatchIndex + count && i < matchIdList.length); i++){
      targetIdList.add(matchIdList[i]);
      increase++;
    }

    if(targetIdList.isEmpty){
      return null;
    }

    try{
      await DataStoreService.ensureMatchDtoDirectory(_puuid);
    }catch(e){
      StaticLogger.logger.e("MatchDataService.getNextMatchDtoList() : $e");
    }

    _matchDtoList = await _getMatchDtoList(targetIdList);

    if(_matchDtoList == null){
      return null;
    }
    else{
      _matchDtoList.sort(MatchDto.compare); // 정렬하는거 부터

      _nextMatchIndex += increase;

      matchDtoList.addAll(_matchDtoList);

      return _matchDtoList;
    }

  }

  Future<MatchDto?> _getMatchDto(String matchId) async{
    MatchDto? matchDto = await DataStoreService.readMatchDto(RiotApiService.puuid  , matchId);
    if(matchDto != null){
        logger.i("[MatchDataService._getMatchDto()] 로컬에서 로드함 ($matchId)");
    }
    else{
        RiotApiResponse<MatchDto> matchRes = await RiotApiService.getMatch(matchId);

        if(matchRes.isSuccess){
          matchDto = matchRes.response!;
          logger.i("[MatchDataService._getMatchDto()] 네트워크에서 로드함 ($matchId)");

          try{
            await DataStoreService.saveMatchDto(RiotApiService.puuid ,matchDto);

            logger.i("[MatchDataService._getMatchDto()] 매치 데이터 저장 ($matchId)");

          }catch(e){
            StaticLogger.logger.e("[MatchDataService._getMatchDto()] 매치데이터 저장 실패 : $e");
          }
        }
        else{
          StaticLogger.logger.e("[MatchDataService._getMatchDto()] 매치데이터 불러오기 실패 : ${matchRes.exception!.msg} , id = $matchId");
        }
    }
    return matchDto;
  }

  Future<List<MatchDto>?> _getMatchDtoList(List<String> matchIdList)async{
    List<MatchDto?> temp = await Future.wait(
        matchIdList.map((e) => _getMatchDto(e))
    );

    List<MatchDto> matchDtoList = [];

    for (var value in temp) {
      if(value == null){
        return null;
      }
      else{
        matchDtoList.add(value);
      }
    }

    return matchDtoList;
  }

  void refresh() async{
    matchIdList = [];
    matchDtoList = [];
    _nextMatchIndex = 0;

    RiotApiResponse<List<String>> apiResponse = await RiotApiService.getMatchIds(_puuid, 100);

    if(!apiResponse.isSuccess){
      logger.e("[MatchDataService.refresh()] 매치 아이디 리스트 가져오기 실패(${apiResponse.exception!.exceptionCode})");
      return;
    }

    matchIdList = apiResponse.response!;

    await DataStoreService.resetData(RiotApiService.puuid );
    await DataStoreService.saveMatchIdList(RiotApiService.puuid ,matchIdList);

    logger.i("[MatchDataService.refresh()] 데이터 초기화 완료 : first = ${matchIdList.first} , last = ${matchIdList.last}");
  }



}