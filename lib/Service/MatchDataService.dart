
import 'package:app/Model/RiotApi/MatchDto.dart';
import 'package:app/Service/DataStoreService.dart';
import 'package:app/Service/RiotApiService.dart';
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
    matchIdList = await RiotApiService.getMatchIds(_puuid, count);
    if(matchIdList.isEmpty){
      logger.i("[MatchDataService.setMatchIdList()] 전적이 없음");
    }
    else{
      await DataStoreService.saveMatchIdList(RiotApiService.puuid  ,matchIdList);
    }
  }

  Future<List<MatchDto>> getNextMatchDtoList(int count) async{
    //TODO
    int index = _nextMatchIndex;
    int increase = 0;

    final List<MatchDto> _matchDtoList;
    final List<String> targetIdList = [];

    if(matchIdList.isEmpty){
      await setMatchIdList(100);
    }

    for(int i = index; (i<_nextMatchIndex + count && i < matchIdList.length); i++){
      targetIdList.add(matchIdList[i]);
      increase++;
    }

    _matchDtoList = await Future.wait(
        targetIdList.map((e) => _getMatchDto(e))
    );

    _matchDtoList.sort(MatchDto.compare); // 정렬하는거 부터

    _nextMatchIndex += increase;

    matchDtoList.addAll(_matchDtoList);

    return _matchDtoList;
  }

  Future<MatchDto> _getMatchDto(String matchId) async{
    MatchDto? matchDto = await DataStoreService.readMatchDto(RiotApiService.puuid  , matchId);
    if(matchDto != null){
        logger.i("[MatchDataService._getMatchDto()] 로컬에서 로드함 ($matchId)");
    }
    else{
        matchDto = await RiotApiService.getMatch(matchId);
        logger.i("[MatchDataService._getMatchDto()] 네트워크에서 로드함 ($matchId)");

        await DataStoreService.saveMatchDto(RiotApiService.puuid ,matchDto);
        logger.i("[MatchDataService._getMatchDto()] 매치 데이터 저장 ($matchId)");
    }
    return matchDto;
  }

  void refresh() async{
    matchIdList = [];
    matchDtoList = [];
    _nextMatchIndex = 0;

    matchIdList = await RiotApiService.getMatchIds(_puuid, 100);

    await DataStoreService.resetData(RiotApiService.puuid );
    await DataStoreService.saveMatchIdList(RiotApiService.puuid ,matchIdList);

    logger.i("[MatchDataService.refresh()] 데이터 초기화 완료 : first = ${matchIdList.first} , last = ${matchIdList.last}");
  }



}