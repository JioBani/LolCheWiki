import 'package:app/Controller/ChamptionListPageController.dart';
import 'package:app/Controller/LoadingState.dart';
import 'package:app/Model/Champion.dart';
import 'package:app/Service/GameDataService.dart';
import 'package:app/Style/Images.dart';
import 'package:app/Style/Palette.dart';
import 'package:app/View/ChampionInfo/ChampionSearchPage.dart';
import 'package:app/View/ChampionInfo/TraitTextWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'ChampionInfoPage.dart';

class ChampionListPage extends StatefulWidget {
  const ChampionListPage({super.key});

  @override
  State<ChampionListPage> createState() => _ChampionListPageState();
}

class _ChampionListPageState extends State<ChampionListPage> {
  SortMode sortMode = SortMode.cost;

  void onClickSortButton(SortMode mode){
    setState(() {
      sortMode = mode;
    });
  }

  late ChampionListPageController championListPageController;

  @override
  void initState() {
    // TODO: implement initState
    championListPageController = Get.put(ChampionListPageController());
    championListPageController.getChampionData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10.w, 0, 0, 0),
                  child: IconButton(
                      onPressed: (){
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 25.sp,
                      )
                  ),
                ),
                Text(
                  '#챔피언 목록',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 5.w, 0),
                  child: IconButton(
                      onPressed: (){
                        if(championListPageController.championList != null){
                          Get.to(ChampionSearchPage(championList: championListPageController.championList!,));
                        }
                        else{
                          Fluttertoast.showToast(msg: '챔피언 데이터를 불러오는 중 입니다.');
                        }
                      },
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        Icons.search,
                        size: 30.sp,
                      )
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SortButtonWidget(
                    onClick: onClickSortButton,
                    name: '이름순',
                    sortMode: SortMode.name,
                    nowSortMode: sortMode
                ),
                SortButtonWidget(
                    onClick: onClickSortButton,
                    name: '가격순',
                    sortMode: SortMode.cost,
                    nowSortMode: sortMode
                ),
                SortButtonWidget(
                    onClick: onClickSortButton,
                    name: '계열순',
                    sortMode: SortMode.trait,
                    nowSortMode: sortMode
                ),
              ],
            ),
            SizedBox(height: 10.h,),
            Expanded(
                child: GetX<GameDataService>(
                  builder: (service) {
                    if(
                    service.loadingState.value == LoadingState.beforeLoading ||
                        service.loadingState.value == LoadingState.loading
                    ){
                      return Text('로딩중');
                    }
                    else if(service.loadingState.value == LoadingState.fail){
                      return Text('데이터를 가져 올 수 없습니다.');
                    }
                    else{
                      return SingleChildScrollView(
                        child: Wrap(
                          spacing: 5.w,
                          children: service.getChampionList(sortMode)!.map((champion) =>
                              ChampionTileWidget(champion: champion,)
                          ).toList(),
                        ),
                      );
                    }
                  },
                )
            )
          ],
        )
      ),
    );
  }
}

class ChampionTileWidget extends StatelessWidget {
  const ChampionTileWidget({super.key, required this.champion, this.isExpand = false});
  final Champion champion;
  final bool isExpand;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(ChampionInfoPage(champion: champion,));
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(5.w, 10.w, 5.w, 10.w),
        height: 100.w,
        width: isExpand ? double.infinity : 160.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          color: Palette.brightUi,
        ),
        padding: EdgeInsets.fromLTRB(5.w, 10.h, 0, 10.h),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 73.sp,
                    height: 73.sp,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: champion.cost < 6 ? Palette.rarityColor[champion.cost] : Colors.black,
                          width: 5,
                      ),
                      borderRadius: BorderRadius.circular(100.r)
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.r),
                      child: Image.asset(
                        Images.errorItemImage,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 10.w,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    champion.name,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        /*children: [
                                                      TraitTextWidget(trait: "돌연변이"),
                                                      TraitTextWidget(trait: "도전자"),
                                                    ],*/
                        children: champion.traitNames.map((trait) => TraitTextWidget(trait: trait)).toList(),
                      )
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SortButtonWidget extends StatelessWidget {
  const SortButtonWidget({
    super.key,
    required this.onClick,
    required this.name,
    required this.sortMode,
    required this.nowSortMode,
  });

  final Function(SortMode) onClick;
  final String name;
  final SortMode sortMode;
  final SortMode nowSortMode;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onClick(sortMode);
      },
      child: Container(
        width: 95.w,
        height: 35.h,
        decoration: BoxDecoration(
            color: sortMode == nowSortMode ? Palette.green : Palette.unSelectedGrey ,
            borderRadius: BorderRadius.circular(5.r)
        ),
        child: Center(
          child: Text(
            name,
            style: TextStyle(
                fontSize: 14.sp,
                color:  sortMode == nowSortMode ? Colors.white : Colors.black
            ),
          ),
        ),
      ),
    );
  }
}


