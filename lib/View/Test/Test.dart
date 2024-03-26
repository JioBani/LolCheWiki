import 'dart:convert';
import 'dart:math';

import 'package:app/Model/RiotApi/MatchDto.dart';
import 'package:app/Service/Admin.dart';
import 'package:app/Service/DataStoreService.dart';
import 'package:app/Service/MatchDataService.dart';
import 'package:app/Service/Riot/RiotApiResponse.dart';
import 'package:app/Service/Riot/RiotApiService.dart';
import 'package:app/Service/StaticLogger.dart';
import 'package:app/Style/Palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:logger/logger.dart';

class TestPage extends StatelessWidget {
  TestPage({super.key});

  final MatchDataService matchDataService = MatchDataService(puuid: RiotApiService.puuid);
  final Logger logger = Logger();

  Future<int> fetchData()async {
    await Future.delayed(Duration(seconds: 3));
    return Random().nextInt(100);
  }

  late Future<int> fetchResult;


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

              ElevatedButton(
                  onPressed: ()async{
                    fetchResult = fetchData();
                  },
                  child: Text(
                    "FetchData",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp
                    ),
                  )
              ),

              ElevatedButton(
                  onPressed: ()async{
                    fetchResult.then((value) => StaticLogger.logger.i("then : ${value.toString()}"));
                    int result = await fetchResult;
                    StaticLogger.logger.i(result.toString());
                  },
                  child: Text(
                    "완료 확인",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp
                    ),
                  )
              ),

              ElevatedButton(
                  onPressed: ()async{
                    //Interactive toast, set [isIgnoring] false.
                    showToast(
                        "hello styled toast",
                      context:context,
                      animation: StyledToastAnimation.slideToBottom,
                      animDuration: Duration(milliseconds: 300),
                      curve: Curves.linearToEaseOut,
                    );
                  },
                  child: Text(
                    "토스트 메세지",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp
                    ),
                  )
              ),

              ElevatedButton(
                  onPressed: ()async{
                    showDialog(
                      context: context,
                      builder: (context) {
                        return UnconstrainedBox(
                          constrainedAxis: Axis.vertical,
                          child: SizedBox(
                            width: 50.w,
                            height: 50.w,
                            child: Dialog(
                              insetPadding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.r),
                              ),
                              child: SizedBox(
                                  width: 50.w,
                                  height: 50.w,
                                  child: CupertinoActivityIndicator()
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Text(
                    "토스트 메세지",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp
                    ),
                  )
              ),
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
