import 'package:app/Model/RiotApi/SummonerProfile.dart';
import 'package:app/Service/DataStoreService.dart';
import 'package:app/Service/ProfileService.dart';
import 'package:app/Style/Images.dart';
import 'package:app/Style/Palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:simple_shadow/simple_shadow.dart';

import 'RankTabViewWidget.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key, required this.summonerProfile});
  final SummonerProfile summonerProfile;

  @override
  Widget build(BuildContext context) {
    final String name;
    if(summonerProfile.tag != null){
      name = "${summonerProfile.name}#${summonerProfile.tag}";
    }
    else{
      name = summonerProfile.name;
    }

    return Padding(
      padding: EdgeInsets.only(left: 20.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            width: 96.w,
            height: 96.w,
            child: Stack(
              children: [
                SimpleShadow(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Image.network(
                      Images.testProfile
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 5.w),
                  child: InkWell(
                    onTap: () async {
                      bool result = await DataStoreService.saveBookmarkPuuid(summonerProfile.summonerDTO.puuid);
                      if(result){
                        Get.find<ProfileService>().fetchData();
                      }
                    },
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Image.asset(
                        Images.icons.bookmark,
                        width: 25.sp,
                        color: Palette.green,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "LV. ${summonerProfile.summonerDTO.summonerLevel}",
                    style: TextStyle(
                      color: Color(0xff949494),
                      fontSize: 13.sp,
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      name,
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h,)
                ],
              ),
            ),
          ),
         /* SizedBox(
            width: 80.w,
            child: RankTabViewWidget(
              leagueEntryDTOMap: summonerProfile.leagueEntryDTOMap,
            ),
          ),
          SizedBox(width: 15.w,)*/
        ],
      ),
    );
  }
}
