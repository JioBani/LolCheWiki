import 'dart:convert';

import 'package:app/Model/Champion.dart';
import 'package:app/Model/RiotApi/MatchDto.dart';
import 'package:app/Service/Admin.dart';
import 'package:app/Service/DataStoreService.dart';
import 'package:app/Service/MatchDataService.dart';
import 'package:app/Service/Riot/RiotApiResponse.dart';
import 'package:app/Service/Riot/RiotApiService.dart';
import 'package:app/Service/StaticLogger.dart';
import 'package:app/View/Test/FirebaseTest.dart';
import 'package:app/View/Test/ScrollTest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'dart:developer';

import 'package:logger/logger.dart';

class TestPage extends StatelessWidget {
  TestPage({super.key});

  final MatchDataService matchDataService = MatchDataService(puuid: RiotApiService.puuid);
  final Logger logger = Logger();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: (){
                    //RiotApiService.fetchMatch(RiotApiService.matchUrl).then((value) => Logger().i(value.toJson().toString()));
                  },
                  child: Text(
                    "매치 데이터 가져오기",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15.sp
                    ),
                  )
              ),
              ElevatedButton(
                  onPressed: (){
                    RiotApiService.getMatchIds(RiotApiService.puuid, 20).then((value) => Logger().i(value));
                  },
                  child: Text(
                    "매치 id 가져오기",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp
                    ),
                  )
              ),
              ElevatedButton(
                  onPressed: (){
                    saveMatchIdList();
                  },
                  child: Text(
                    "매치 id 저장하기",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp
                    ),
                  )
              ),
              ElevatedButton(
                  onPressed: (){
                    readMatchIdList();
                  },
                  child: Text(
                    "매치 id 불러오기",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp
                    ),
                  )
              ),
              ElevatedButton(
                onPressed: ()async{
                  List<String> matchIdList = await readMatchIdList();
                  readMatchDtoList(matchIdList);
                },
                child: Text(
                  "매치 리스트 불러오기",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15.sp
                  ),
                )
              ),
              ElevatedButton(
                  onPressed: ()async{
                    /*await matchDataService.setMatchIdList(100);
                    List<MatchDto>? matchDtoList = await matchDataService.getNextMatchDtoList(5);
                    logger.i(matchDtoList.length);
                    for (var value in matchDtoList) {
                      logger.i(value.matchId);
                    }*/
                  },
                  child: Text(
                    "매치 리스트 불러오기2",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp
                    ),
                  )
              ),
              ElevatedButton(
                  onPressed: ()async{
                    await DataStoreService.resetData(RiotApiService.puuid);
                    logger.i("리셋 완료");
                  },
                  child: Text(
                    "데이터 삭제",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp
                    ),
                  )
              ),
              ElevatedButton(
                  onPressed: ()async{
                    await DataStoreService.removeAllData();
                  },
                  child: Text(
                    "데이터 모두 초기화",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp
                    ),
                  )
              ),
              ElevatedButton(
                  onPressed: ()async{
                    /*Map<String , dynamic> result = await RiotApiService.getPuuid('보타쿠리', "KR1");
                    if(result["status"]! == 200){
                      Logger().i(result["value"]!);
                    }
                    else{
                      Logger().e(result["value"]!);
                    }*/
                  },
                  child: Text(
                    "이름 검색",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp
                    ),
                  )
              ),
              ElevatedButton(
                  onPressed: ()async{
                    StaticLogger.logger.i(RiotApiService.riotApiCounter.print());
                  },
                  child: Text(
                    "API 카운트",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp
                    ),
                  )
              ),
              ElevatedButton(
                  onPressed: ()async{
                    Get.to(ScrollTest());
                  },
                  child: Text(
                    "스크롤 테스트",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp
                    ),
                  )
              ),
              ElevatedButton(
                  onPressed: ()async{
                    Get.to(FirebaseTestPage());
                  },
                  child: Text(
                    "파이어스토어 테스트",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp
                    ),
                  )
              ),
              ElevatedButton(
                  onPressed: ()async{

                  },
                  child: Text(
                    "챔피언 파싱 테스트",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp
                    ),
                  )
              ),
              ElevatedButton(
                  onPressed: ()async{
                   Admin.uploadTraitList();
                  },
                  child: Text(
                    "특성 데이터 업로드",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp
                    ),
                  )
              ),
              ElevatedButton(
                  onPressed: ()async{
                    Admin.uploadAllItemList();
                  },
                  child: Text(
                    "아이템 데이터 업로드",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp
                    ),
                  )
              ),
              /*ElevatedButton(
                  onPressed: ()async{
                    DataStoreService.saveTest("test.dat", "test");
                  },
                  child: Text(
                    "데이터 저장 테스트",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp
                    ),
                  )
              ),
              ElevatedButton(
                  onPressed: ()async{
                    String? result = await DataStoreService.readTest("test.dat");
                    if(result == null){
                      StaticLogger.logger.e("[Test] 데이터 읽기 실패");
                    }
                    else{
                      StaticLogger.logger.i("[Test] 데이터 읽기 성공 $result");
                    }
                  },
                  child: Text(
                    "데이터 읽기 테스트",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp
                    ),
                  )
              ),
              ElevatedButton(
                  onPressed: ()async{

                  },
                  child: Text(
                    "데이터 삭제 테스트",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp
                    ),
                  )
              ),*/
            ],
          ),
        ),
      ),
    );
  }

  Future<void> saveMatchIdList()async {
    RiotApiResponse<List<String>> matchIdListRes = await RiotApiService.getMatchIds(RiotApiService.puuid, 20);
    if(!matchIdListRes.isSuccess){
      Fluttertoast.showToast(msg: matchIdListRes.exception!.msg);
      return;
    }

    List<String> matchIdList = matchIdListRes.response!;
    bool result = await DataStoreService.saveMatchIdList(RiotApiService.puuid,matchIdList);
  }

  Future<List<String>> readMatchIdList()async {
    List<String>? matchIdList = await DataStoreService.readMatchIdList(RiotApiService.puuid);
    if(matchIdList != null){
      Logger().i(jsonEncode(matchIdList));
      return matchIdList;
    }
    else{
      Logger().e("데이터 읽기 실패");
      return [];
    }
  }

  Future<void> saveMatchDtoList(List<MatchDto> matchDtoList)async {
    await Future.wait(
        matchDtoList.map((e) => DataStoreService.saveMatchDto(RiotApiService.puuid,e))
    );
  }

  Future<void> readMatchDtoList(List<String> matchIdList)async {
    List<MatchDto?> result = await Future.wait(
        matchIdList.map((e) => DataStoreService.readMatchDto(RiotApiService.puuid,e))
    );

    for (var value in result) {
      if(value != null){
        Logger().i(value.matchId);
      }
      else{
        Logger().e("데이터 읽기 실패");
      }
    }
  }
}
