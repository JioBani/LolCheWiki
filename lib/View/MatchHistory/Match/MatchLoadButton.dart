import 'package:app/Controller/MatchHistoryController.dart';
import 'package:app/Service/StaticLogger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MatchLoadButton extends StatelessWidget {
  const MatchLoadButton({super.key, required this.puuid, required this.refreshController});
  final String puuid;
  final RefreshController refreshController;

  @override
  Widget build(BuildContext context) {
    return GetX<MatchHistoryController>(
      tag: puuid,
      builder: (controller) {
        if(!controller.isLoading.value){
          return ElevatedButton(
              onPressed: (){
                StaticLogger.logger.i("로딩");
                refreshController.requestLoading();
              },
              child: Text(
                  "더 불러오기"
              )
          );
        }
        else{
          return Text(
              "로딩중"
          );
        }
      }
    );
  }
}

