import 'package:app/Common/LoadableListView/LoadableListView2.dart';
import 'package:app/Controller/MatchHistoryController.dart';
import 'package:app/Model/RiotApi/QueueType.dart';
import 'package:app/View/MatchHistory/Match/MatchWidget.dart';
import 'package:app/View/MatchHistory/Match/NoTargetSetMatchWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MatchHistoryPageView extends StatefulWidget {
  const MatchHistoryPageView({super.key , required this.puuid, this.queueType});
  final String puuid;
  final QueueType? queueType;

  @override
  State<MatchHistoryPageView> createState() => _MatchHistoryPageViewState();
}

class _MatchHistoryPageViewState extends State<MatchHistoryPageView> with AutomaticKeepAliveClientMixin<MatchHistoryPageView>{

  late final LoadableListViewController loadableListViewController;
  late MatchHistoryController matchHistoryController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    matchHistoryController = Get.find<MatchHistoryController>(tag: widget.puuid);
    loadableListViewController = LoadableListViewController(
        onLoading: _onLoading,
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  Future<LoadableListViewResult> _onLoading(LoadableListViewController controller) async{
    final MatchHistoryController matchHistoryController = Get.find<MatchHistoryController>(tag: widget.puuid);
    var result = await matchHistoryController.loadMoreData(5);
    setState(() {

    });
    if(result == null){
      return LoadableListViewResult.fail;
    }
    else if(result.isEmpty){
      return LoadableListViewResult.noMoreData;
    }
    return LoadableListViewResult.success;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    List<Widget> elements;

    if(widget.queueType == null){
      elements = matchHistoryController.allMatches.map((matchDto){
        int ownerIndex = 0;

        for(int i = 0; i< matchDto.info.participants.length; i++){
          if(widget.puuid == matchDto.info.participants[i].puuid){
            ownerIndex = i;
          }
        }

        if(matchDto.info.tftSetNumber != 10){
          return NoTargetSetMatchWidget(matchDto: matchDto);
        }

        else{
          return MatchWidget(matchDto: matchDto , ownerIndex: ownerIndex,);
        }
      }).toList();
    }
    else{
      elements = matchHistoryController.matches[widget.queueType]?.map((matchDto){
        int ownerIndex = 0;

        for(int i = 0; i< matchDto.info.participants.length; i++){
          if(widget.puuid == matchDto.info.participants[i].puuid){
            ownerIndex = i;
          }
        }

        if(matchDto.info.tftSetNumber != 10){
          return NoTargetSetMatchWidget(matchDto: matchDto);
        }

        else{
          return MatchWidget(matchDto: matchDto , ownerIndex: ownerIndex,);
        }
      }).toList() ?? [];
    }

    return LoadableListView(
        controller: loadableListViewController,
        noMoreDataFooter: SizedBox(
          height: 75.h,
          child: const Center(
              child: Text("데이터 없음")
          )
        ),
        failFooter: Center(
          child: Column(
            children: [
              const Text("데이터를 가져 올 수 없음"),
              SizedBox(height: 10.h,),
              TextButton(
                onPressed: (){
                  loadableListViewController.load();
                },
                child: const Text(
                    "다시시도",
                )
              ),
            ],
          ),
        ) ,
        loadingFooter: SizedBox(
          height: 75.h,
          child: const CupertinoActivityIndicator()
        ),
        loadButton: SizedBox(
          height: 75.h,
          child: TextButton(
              onPressed: (){
                loadableListViewController.load();
              },
              child: const Text("5개 더 불러오기")
          ),
        ),
        itemList: elements,
    );
  }


}
