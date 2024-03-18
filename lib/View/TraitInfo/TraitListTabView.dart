import 'dart:math';

import 'package:app/Model/Trait.dart';
import 'package:app/Style/Palette.dart';
import 'package:app/View/TraitInfo/TraitInfoTabView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TraitListTabView extends StatefulWidget {
  const TraitListTabView({super.key, required this.traitList});
  final List<Trait> traitList;

  @override
  State<TraitListTabView> createState() => _TraitListTabViewState();
}

class _TraitListTabViewState extends State<TraitListTabView> with TickerProviderStateMixin{

  late TabController tabController;
  late PageController pageController;
  late ScrollController scrollController;
  Trait? tabTrait;
  int test = 0;

  double infoPageWidth = 320.w;
  
  /// 0 : 특성 리스트 보기 페이지 , 1 : 특성 정보 보기 페이지
  int page = 0;

  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 2, vsync: this);
    pageController = PageController(viewportFraction: 1.0);
    scrollController = ScrollController();
    super.initState();
  }

  /// 0 : 특성 리스트 보기 페이지 , 1 : 특성 정보 보기 페이지
  void movePage(int moveTo){
    if(moveTo == 0 && page != 0){
      scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.linearToEaseOut
      );
    }
    else if(moveTo == 1 && page != 1){
      scrollController.animateTo(
          infoPageWidth,
          duration: const Duration(milliseconds: 300),
          curve: Curves.linearToEaseOut
      );
    }
    page = moveTo;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        //controller: tabController,
        //controller: pageController,
        children: [
          SizedBox(
            width: 360.w,
            child: ListView(
              children: widget.traitList.map((trait) =>
                  InkWell(
                    onTap: (){
                      if(page == 0){
                        test = Random().nextInt(10);
                        tabTrait = trait;
                        setState(() {

                        });
                        movePage(1);
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      height: 75.h,
                      margin: EdgeInsets.fromLTRB(0, 5.h, 10.w, 5.h),
                      decoration: BoxDecoration(
                          color: Palette.brightUi,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(10.r) , bottomRight: Radius.circular(10.r))
                      ),
                      child: Column(
                        children: [
                          Text(
                            trait.apiName
                          ),
                          Text(
                            trait.name
                          ),
                        ],
                      ),
                    ),
                  )
              ).toList()
            ),
          ),
          SizedBox(
            width: infoPageWidth,
            child: TraitInfoTabView(
              trait: tabTrait,
              test: test,
              scrollController: scrollController,
              move: movePage,
            ),
          ),
        ],
      ),
    );
  }
}
