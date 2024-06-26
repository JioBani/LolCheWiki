import 'package:app/Controller/SearchHistoryController.dart';
import 'package:app/Model/RiotApi/SummonerProfile.dart';
import 'package:app/Service/Riot/RiotApiResponse.dart';
import 'package:app/Service/Riot/RiotApiService.dart';
import 'package:app/Style/Toasts.dart';
import 'package:app/View/MatchHistory/MatchHistoryPage.dart';
import 'package:app/View/Test/Dialogs.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class HomePageController{

  Future<void> searchByName(String text , BuildContext context) async {
    int hashIndex = text.indexOf('#');

    String name;
    String tag;

    if (hashIndex != -1) {
      name = text.substring(0, hashIndex);
      tag = text.substring(hashIndex + 1);
    } else {
      name = text;
      tag = "KR1";
    }
    
    if(Get.isRegistered<SearchHistoryController>()){
      Get.find<SearchHistoryController>().addHistory(text);
    }
    

    final (apiResponse, isClosed) = await Dialogs.showLoadingDialogWithFuture<RiotApiResponse<SummonerProfile>>(
        context ,
        RiotApiService.getSummonerProfileByName(name, tag)
    );

    if(isClosed){
      if(apiResponse.isSuccess){
        Get.to(MatchHistoryPage(summonerProfile: apiResponse.response!));
      }
      else{
        Toasts.buildToast(text: apiResponse.exception!.msg, context: context);
      }
    }
  }

  Future<void> searchByPuuid(String puuid , BuildContext context) async {

    final (apiResponse, isClosed) = await Dialogs.showLoadingDialogWithFuture<RiotApiResponse<SummonerProfile>>(
        context ,
        RiotApiService.getSummonerProfileByPuuid(puuid)
    );

    if(isClosed){
      if(apiResponse.isSuccess){
        Get.to(MatchHistoryPage(summonerProfile: apiResponse.response!));
      }
      else{
        Fluttertoast.showToast(msg: apiResponse.exception!.msg);
      }
    }
  }
}