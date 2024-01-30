import 'package:app/Model/RiotApi/MatchDto.dart';
import 'package:app/Model/RiotApi/QueueType.dart';
import 'package:app/Service/MatchDataService.dart';
import 'package:app/Service/Riot/RiotApiService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class MatchHistoryController extends GetxController{
  Rx<MatchDto?> matchDto = Rx(null);

  RxList<MatchDto> allMatches = RxList([]);
  RxList<String> matchIds = RxList([]);
  Map<QueueType , List<MatchDto>> matches = {};
  late MatchDataService matchDataService;
  String puuid;

  bool isLoading = false;

  List<String> tabTexts = [];

  RxList<Tab> tabList = RxList([]);

  int start = 0;

  MatchHistoryController(this.puuid){
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

    matchDataService = MatchDataService(puuid: puuid);
  }

  Future<void> fetchData(String puuid , int initMatchNumber) async{

    if(matchDataService.matchDtoList.isEmpty){
      isLoading = true;
      await matchDataService.getNextMatchDtoList(initMatchNumber);
      isLoading = false;
    }
    _loadDataFromService();
  }

  void _loadDataFromService(){
    matches.clear();
    for (var element in QueueType.values) {
      matches[element] = [];
    }

    allMatches.assignAll(matchDataService.matchDtoList);

    for (var match in allMatches) {
      matches[QueueTypeExtension.getTypeByQueueId(match.info.queueId)]!.add(match);
    }

    refreshTabText();
    update();
  }

  Future<void> loadMoreData(String puuid , int count)async{
    isLoading = true;
    await matchDataService.getNextMatchDtoList(count);
    isLoading = false;
    _loadDataFromService();
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