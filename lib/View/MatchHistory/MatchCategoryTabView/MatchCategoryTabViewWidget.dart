import 'package:app/Controller/MatchHistoryController.dart';
import 'package:app/Model/RiotApi/QueueType.dart';
import 'package:app/Style/Palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'MatchHistoryPageView.dart';

class MatchCategoryTabViewWidget extends StatefulWidget {
  const MatchCategoryTabViewWidget({super.key, required this.puuid});

  final String puuid;

  @override
  State<MatchCategoryTabViewWidget> createState() => _MatchCategoryTabViewWidgetState();
}

class _MatchCategoryTabViewWidgetState extends State<MatchCategoryTabViewWidget>
    with AutomaticKeepAliveClientMixin{

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Get.put<MatchHistoryController>(
      MatchHistoryController(widget.puuid),
      tag : widget.puuid,
    );

    Get.find<MatchHistoryController>(tag: widget.puuid).initData(20);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return DefaultTabController(
      length: 5,
      child: Expanded(
        child: Column(
          children: [
            GetX<MatchHistoryController>(
              tag: widget.puuid,
              builder: (controller) {
                return TabBar(
                  tabs:controller.tabList.value,
                  labelColor: Palette.iconColor,
                  labelStyle: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedLabelColor: const Color(0xff939393),
                  unselectedLabelStyle: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold
                  ),
                  indicatorColor: Colors.transparent,
                  isScrollable: true,
                  labelPadding: EdgeInsets.symmetric(horizontal: 16.w),
                );
              }
            ),
            Expanded(
              child: TabBarView(
                children: List.generate(5, (index){
                  return Builder(
                    builder: (context) {
                      if(!Get.isRegistered<MatchHistoryController>(tag: widget.puuid)){
                        return const SizedBox();
                      }
                      else{
                        return GetX<MatchHistoryController>(
                            tag: widget.puuid,
                            builder: (controller) {
                              if(!controller.isInitiated.value){
                                return const Text("로딩중");
                              }
                              else if(controller.allMatches.isEmpty){
                                return const Text("데이터 없음");
                              }
                              else{
                                if(index == 0){
                                  return MatchHistoryPageView(
                                    puuid: widget.puuid,
                                  );
                                }
                                else{
                                  return MatchHistoryPageView(
                                    queueType: QueueTypeExtension.getTypeByIndex(index),
                                    puuid:  widget.puuid,
                                  );
                                }
                              }
                            }
                        );
                      }
                    }
                  );
                })
              ),
            ),
          ],
        ),
      ),
    );
  }

}
