import 'dart:async';

import 'package:app/Model/RiotApi/MatchDto.dart';
import 'package:app/Model/RiotApi/QueueType.dart';
import 'package:app/Service/MatchDataService.dart';
import 'package:app/Service/Riot/RiotApiResponse.dart';
import 'package:app/Service/StaticLogger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MatchHistoryController extends GetxController{
  RxList<MatchDto> allMatches = RxList([]);
  List<String> matchIds = [];
  Map<QueueType , List<MatchDto>> matches = {};
  late MatchDataService matchDataService;
  String puuid;
  String? initResult;

  RiotApiResponse? initDataResponse;

  RxBool isLoading = RxBool(false);
  RxBool isInitiated = RxBool(false);

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

  Future<void> initData(int initMatchNumber) async{
    try{
      if(isInitiated.value){
        isInitiated.value = false;
      }

      matchDataService.matchDtoList.clear();
      allMatches.clear();

      isLoading.value = true;
      await matchDataService.getNextMatchDtoList(initMatchNumber).timeout(
          const Duration(seconds: 10)
      );

      _loadDataFromService();
      isLoading.value = false;
      isInitiated.value = true;
    }catch(e){
      StaticLogger.logger.e("[MatchHistoryController.initData()] $e");
      isLoading.value = false;
    }
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

    _refreshTabText();
    update();
  }

  Future<List<MatchDto>?> loadMoreData(int count)async{
    try{
      isLoading.value = true;
      var result =  await matchDataService.getNextMatchDtoList(count).timeout(const Duration(seconds: 10));
      isLoading.value = false;
      _loadDataFromService();
      return result;
    }catch(e){
      StaticLogger.logger.e("[MatchHistoryController.loadMoreData()] $e");
      isLoading.value = false;
      return null;
    }

  }

  void _refreshTabText(){
    tabList.assignAll([
      Tab(text: "전체(${allMatches.length})",),
      Tab(text: "랭크(${matches[QueueType.ranked]!.length})",),
      Tab(text: "초고속모드(${matches[QueueType.hyperRoll]!.length})",),
      Tab(text: "더블 업(${matches[QueueType.doubleUp]!.length})",),
      Tab(text: "일반(${matches[QueueType.normal]!.length})",),
    ]);
  }


}