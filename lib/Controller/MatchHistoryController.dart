import 'package:app/Model/RiotApi/MatchDto.dart';
import 'package:app/Model/RiotApi/QueueType.dart';
import 'package:app/Service/MatchDataService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MatchHistoryController extends GetxController{
  Rx<MatchDto?> matchDto = Rx(null);

  List<MatchDto> allMatches = [];
  List<String> matchIds = [];
  Map<QueueType , List<MatchDto>> matches = {};
  late MatchDataService matchDataService;
  String puuid;

  RxBool isLoading = RxBool(false);

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
      isLoading.value = true;
      await matchDataService.getNextMatchDtoList(initMatchNumber);
      isLoading.value = false;
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

  Future<void> loadMoreData(int count)async{
    isLoading.value = true;
    await matchDataService.getNextMatchDtoList(count);
    isLoading.value = false;
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