import 'package:app/Model/RiotApi/MatchDto.dart';
import 'package:app/Model/RiotApi/QueueType.dart';
import 'package:app/Service/MatchDataService.dart';
import 'package:app/Service/RiotApiService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class MatchHistoryController extends GetxController{
  Rx<MatchDto?> matchDto = Rx(null);

  RxList<MatchDto> allMatches = RxList([]);
  RxList<String> matchIds = RxList([]);
  Map<QueueType , List<MatchDto>> matches = {};
  Map<String , MatchDataService> matchDataServiceMap = {};

  bool isLoading = false;

  List<String> tabTexts = [];

  RxList<Tab> tabList = RxList([]);

  int start = 0;

  MatchHistoryController(){
    tabTexts = [
      "전체(0)",
      "랭크(0)",
      "초고속모드(0)",
      "더블 업(0)",
      "일반(0)",
    ];

    tabList = RxList([
      Tab(text: tabTexts[0],),
      Tab(text: tabTexts[1]),
      Tab(text: tabTexts[2]),
      Tab(text: tabTexts[3]),
      Tab(text: tabTexts[4]),
    ]);
  }

  Future<void> fetchData(String puuid) async{
   /* if(RiotApiService.matchDtoMap.isEmpty){
        isLoading = true;
        RiotApiService.resetData();

        int idResult = await RiotApiService.loadNextMatchIdList(100);

        Logger().i("[MatchHistoryController.fetchData()] loadNextMatchIdList : $idResult");

        int result = await RiotApiService.loadNextMatch(5);
        Logger().i("[MatchHistoryController.fetchData()] loadNextMatch : $result");
        isLoading = false;


    }*/

    MatchDataService matchDataService;

    if(matchDataServiceMap[puuid] == null){
      matchDataServiceMap[puuid] = MatchDataService(puuid: puuid);
    }

    matchDataService = matchDataServiceMap[puuid]!;


    if(matchDataService.matchDtoList.isEmpty){
      isLoading = true;
      //RiotApiService.resetData();

      //int idResult = await RiotApiService.loadNextMatchIdList(100);

      //Logger().i("[MatchHistoryController.fetchData()] loadNextMatchIdList : $idResult");

      //int result = await RiotApiService.loadNextMatch(5);
      //Logger().i("[MatchHistoryController.fetchData()] loadNextMatch : $result");

      await matchDataService.getNextMatchDtoList(20);
      isLoading = false;
    }

    _loadDataFromService(puuid);
  }

  void _loadDataFromService(String puuid){
    matches.clear();
    for (var element in QueueType.values) {
      matches[element] = [];
    }

    MatchDataService matchDataService;

    if(matchDataServiceMap[puuid] == null){
      Logger().i("[MatchHistoryController._loadDataFromService2()] 매치 데이터 서비스가 없음");
      return;
    }

    matchDataService = matchDataServiceMap[puuid]!;

    List<MatchDto> matchDtoList = [];

    allMatches.assignAll(matchDataService.matchDtoList);

    for (var match in matchDtoList) {
      matches[QueueTypeExtension.getTypeByQueueId(match.info.queueId)]!.add(match);
    }

    refreshTabText();
    update();
  }

  /*void _loadDataFromService(){
    matches.clear();
    for (var element in QueueType.values) {
      matches[element] = [];
    }

    List<MatchDto> matchDtoList = [];
    RiotApiService.matchDtoMap.forEach((key, value) { matchDtoList.add(value);});

    allMatches.assignAll(matchDtoList);

    for (var match in matchDtoList) {
      matches[QueueTypeExtension.getTypeByQueueId(match.info.queueId)]!.add(match);
    }

    refreshTabText();
    update();
  }*/

  Future<void> loadMoreData(String puuid , int count)async{

    MatchDataService? matchDataService = matchDataServiceMap[puuid];

    if(matchDataServiceMap[puuid] == null){
      Logger().i("[MatchHistoryController.loadMoreData()] 매치 데이터 서비스가 없음");
      return;
    }

    isLoading = true;
    await matchDataService!.getNextMatchDtoList(count);
    isLoading = false;
    _loadDataFromService(puuid);
  }

  void refreshTabText(){
    tabList.assignAll([
      Tab(text: "전체(${allMatches.length})",),
      Tab(text: "랭크(${matches[QueueType.ranked]!.length})",),
      Tab(text: "초고속모드(${matches[QueueType.hyperRoll]!.length})",),
      Tab(text: "더블 업(${matches[QueueType.doubleUp]!.length})",),
      Tab(text: "일반(${matches[QueueType.normal]!.length})",),
    ]);
  }


}