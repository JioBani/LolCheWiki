import 'package:app/Model/Champion.dart';
import 'package:app/Style/Images.dart';
import 'package:app/Style/Palette.dart';
import 'package:app/View/ChampionInfo/ChampionInfoPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChampionTileWidget extends StatelessWidget {
  const ChampionTileWidget({super.key, required this.champion});

  final Champion champion;

  @override
  Widget build(BuildContext context) {
    Color costColor = Palette.rarityColor[champion.cost];

    return Padding(
      padding: EdgeInsets.all(3.w),
      child: InkWell(
        onTap: (){
          Get.to(ChampionInfoPage(champion: champion));
        },
        child: Column(
          children: [
            SizedBox(height: 1.h,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.5.r),
                border: Border.all(
                    color: costColor,
                    width: 3.sp,
                    style: BorderStyle.solid
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.sp),
                child: Image.asset(
                  Images.getChampionTileImagePath(champion.apiName),
                  width: 35.sp,
                  height: 35.sp,
                ),
              ),
            ),
            SizedBox(height: 2.h,),
          ],
        ),
      ),
    );
  }
}
