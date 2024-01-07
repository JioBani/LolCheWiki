import 'package:app/Controller/MatchHistoryController.dart';
import 'package:app/Model/RiotApi/QueueType.dart';
import 'package:app/Service/RiotApiService.dart';
import 'package:app/Style/Palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'CategoryTabWidget.dart';
import 'MatchHistoryPageView.dart';

class MatchCategoryTabViewWidget extends StatefulWidget {
  const MatchCategoryTabViewWidget({super.key});

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
    Get.find<MatchHistoryController>().fetchData(RiotApiService.puuid);
  }


  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 5,
      child: Expanded(
        child: Column(
          children: [
            GetX<MatchHistoryController>(
              builder: (controller) {
                return TabBar(
                  tabs:controller.tabList.value,
                  labelColor: Palette.iconColor,
                  labelStyle: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedLabelColor: new Color(0xff939393),
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
                  return GetX<MatchHistoryController>(
                      builder: (controller) {
                        if(controller.allMatches.isEmpty){
                          return const Text("데이터 없음");
                        }
                        else{
                          if(index == 0){
                            return MatchHistoryPageView(matchList: controller.allMatches,);
                          }
                          else{
                            return MatchHistoryPageView(matchList: controller.matches[QueueTypeExtension.getTypeByIndex(index)]!,);
                          }
                        }
                      }
                  );
                })
              ),
            ),
            /*Expanded(
              child: _tabBarView()
            ),*/
          ],
        ),
      ),
    );
  }

}
