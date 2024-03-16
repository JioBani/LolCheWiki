import 'package:app/Model/Champion.dart';
import 'package:app/Service/FirestoreService.dart';
import 'package:app/Style/Images.dart';
import 'package:app/Style/Palette.dart';
import 'package:app/View/ChampionInfo/TraitTextWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'ChampionInfoPage.dart';

class ChampionListPage extends StatefulWidget {
  const ChampionListPage({super.key});

  @override
  State<ChampionListPage> createState() => _ChampionListPageState();
}

class _ChampionListPageState extends State<ChampionListPage> {
  int sortMode = 0;

  void onClickSortButton(int mode){
    setState(() {
      sortMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20.h,),
            Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10.w, 0, 0, 0),
                    child: IconButton(
                        onPressed: (){
                          Get.back();
                        },
                        icon: Icon(Icons.arrow_back_ios)
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    '#챔피언 목록',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
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
                    sortMode: 1,
                    nowSortMode: sortMode
                ),
                SortButtonWidget(
                    onClick: onClickSortButton,
                    name: '가격순',
                    sortMode: 0,
                    nowSortMode: sortMode
                ),
                SortButtonWidget(
                    onClick: onClickSortButton,
                    name: '계열순',
                    sortMode: 2,
                    nowSortMode: sortMode
                ),
              ],
            ),
            SizedBox(height: 10.h,),
            Expanded(
                child: FutureBuilder(
                  future: FirestoreService.getChampionList(),
                  builder: (context , snapshot) {
                    List<Champion> champions = [];
                    if(snapshot.hasData){
                      for (var element in snapshot.data!) {
                        if(1 <= element.cost && element.cost <= 5){
                          champions.add(element);
                        }
                      }

                      if(sortMode == 0){
                        champions.sort(Champion.sortByCost);
                      }
                      else if(sortMode == 1){
                        champions.sort(Champion.sortByName);
                      }
                      else{
                        champions.sort(Champion.sortByTrait);
                      }


                      return SingleChildScrollView(
                        child: Wrap(
                          spacing: 5.w,
                          children: champions.map((champion) =>
                            ChampionTileWidget(champion: champion,)
                          ).toList(),
                        ),
                      );
                    }
                    else if(snapshot.hasError){
                      return Center(
                        child: Text(
                            snapshot.error.toString()
                        ),
                      );
                    }
                    else{
                      return const Center(
                        child: CupertinoActivityIndicator(),
                      );
                    }
                  }
                )
            )
          ],
        )
      ),
    );
  }
}

class ChampionTileWidget extends StatelessWidget {
  const ChampionTileWidget({super.key, required this.champion});
  final Champion champion;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(ChampionInfoPage(champion: champion,));
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(5.w, 10.w, 5.w, 10.w),
        height: 100.w,
        width: 160.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Palette.brightUi,
          boxShadow: [
            ShadowPalette.defaultShadow
          ]
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
                        children: champion.traits.map((trait) => TraitTextWidget(trait: trait)).toList(),
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

  final Function(int) onClick;
  final String name;
  final int sortMode;
  final int nowSortMode;

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


