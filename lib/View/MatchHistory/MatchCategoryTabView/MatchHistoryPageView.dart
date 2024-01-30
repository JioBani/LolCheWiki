import 'package:app/Controller/MatchHistoryController.dart';
import 'package:app/Model/RiotApi/MatchDto.dart';
import 'package:app/Model/RiotApi/QueueType.dart';
import 'package:app/Service/Riot/RiotApiService.dart';
import 'package:app/View/MatchHistory/Match/MatchWidget.dart';
import 'package:app/View/MatchHistory/Match/NoTargetSetMatchWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MatchHistoryPageView extends StatefulWidget {
  MatchHistoryPageView({super.key , required this.matchList, required this.puuid});

  final List<MatchDto> matchList;
  final String puuid;

  @override
  State<MatchHistoryPageView> createState() => _MatchHistoryPageViewState();
}

class _MatchHistoryPageViewState extends State<MatchHistoryPageView> {

  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  void _onLoading() async{
    final MatchHistoryController matchHistoryController = Get.find<MatchHistoryController>(tag: widget.puuid);
    await matchHistoryController.loadMoreData(RiotApiService.puuid , 5);
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {

    final MatchHistoryController matchHistoryController = Get.find<MatchHistoryController>(tag: widget.puuid);

    List<Widget> elements = List.generate(widget.matchList.length, (index){
      MatchDto matchDto = widget.matchList[index];
      int ownerIndex = 0;

      for(int i = 0; i< matchDto.info.participants.length; i++){
        if(widget.puuid == matchDto.info.participants[i].puuid){
          ownerIndex = i;
        }
      }

      if(widget.matchList[index].info.tftSetNumber != 10){
        return NoTargetSetMatchWidget(matchDto: matchDto);
      }

      else{
        return MatchWidget(matchDto: matchDto , ownerIndex: ownerIndex,);
      }
    });

    if(matchHistoryController.isLoading){
      elements.add(SizedBox(
        child: CircularProgressIndicator(),
        width: 30.sp,
        height: 30.sp,
      ));
    }
    
    elements.add(
        ElevatedButton(
            onPressed: (){}, 
            child: Text(
              "더 불러오기"
            )
        )
    );

    return ListView(
        children: elements
    );
  }
}
