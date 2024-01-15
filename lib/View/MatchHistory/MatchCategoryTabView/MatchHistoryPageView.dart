import 'package:app/Controller/MatchHistoryController.dart';
import 'package:app/Model/RiotApi/MatchDto.dart';
import 'package:app/Model/RiotApi/QueueType.dart';
import 'package:app/Service/Riot/RiotApiService.dart';
import 'package:app/View/MatchHistory/Match/MatchWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MatchHistoryPageView extends StatefulWidget {
  MatchHistoryPageView({super.key , required this.matchList});

  final List<MatchDto> matchList;

  @override
  State<MatchHistoryPageView> createState() => _MatchHistoryPageViewState();
}

class _MatchHistoryPageViewState extends State<MatchHistoryPageView> {
  final MatchHistoryController matchHistoryController = Get.find<MatchHistoryController>();

  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  void _onLoading() async{
    await matchHistoryController.loadMoreData(RiotApiService.puuid , 5);
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> elements = List.generate(widget.matchList.length, (index) => MatchWidget(matchDto: widget.matchList[index]));

    if(Get.find<MatchHistoryController>().isLoading){
      elements.add(SizedBox(
        child: CircularProgressIndicator(),
        width: 30.sp,
        height: 30.sp,
      ));
    }

    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      header: WaterDropHeader(),
      footer: CustomFooter(
        builder: (context,mode){
          Widget body ;
          if(mode==LoadStatus.idle){
            body =  Text("pull up load");
          }
          else if(mode==LoadStatus.loading){
            body =  CupertinoActivityIndicator();
          }
          else if(mode == LoadStatus.failed){
            body = Text("Load Failed!Click retry!");
          }
          else if(mode == LoadStatus.canLoading){
            body = Text("release to load more");
          }
          else{
            body = Text("No more Data");
          }
          return Container(
            height: 55.0,
            child: Center(child:body),
          );
        },
      ),
      controller: _refreshController,
      //onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: ListView(
          children: elements
      ),
    );
  }
}
