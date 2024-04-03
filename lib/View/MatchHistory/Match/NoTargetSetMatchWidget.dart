import 'package:app/Common/DateCalculator.dart';
import 'package:app/Model/RiotApi/MatchDto.dart';
import 'package:app/Service/StaticLogger.dart';
import 'package:app/Style/Palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoTargetSetMatchWidget extends StatelessWidget {
  const NoTargetSetMatchWidget({super.key, required this.matchDto});

  final MatchDto matchDto;

  @override
  Widget build(BuildContext context) {
    try{
      return Container(
        margin: EdgeInsets.only(right: 10.w , bottom: 24.h),
        padding: EdgeInsets.fromLTRB(0, 5.h, 0, 5.h),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(5.sp) , bottomRight: Radius.circular(5.sp)),
            color: Palette.brightUi,
            boxShadow: [
              ShadowPalette.defaultShadow
            ]
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 5.h),
          child: Column(
            children: [
              SizedBox(height: 20.h,),
              Text(
                "Set 10 이 아님",
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600
                ),
              ),
              Row(
                children: [
                  Text(
                    matchDto.info.getGameName(),
                    style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff575757)
                    ),
                  ),
                  SizedBox(width: 22.w,),
                  Text(
                    DateCalculator.getElapsedTimeString(matchDto.info.gameDatetime),
                    style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff8E8E8E)
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  Text(
                    "#${matchDto.info.participants[0].placement}등",
                    style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                        color: Palette.rankColors[matchDto.info.participants[0].placement]
                    ),
                  ),
                  SizedBox(width: 15.w,),
                  Text(
                    "#${matchDto.info.participants[0].level}레벨",
                    style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff8E8E8E)
                    ),
                  ),
                  SizedBox(width: 23.w,),
                ],
              ),
              const Divider(color: Color(0xffD4D4D4),thickness: 2,),
            ],
          ),
        ),
      );
    }catch(e){
      StaticLogger.logger.e("[NoTargetSetMatchWidget.build] ${matchDto.matchId}");
      return Container(
        margin: EdgeInsets.only(right: 10.w , bottom: 24.h),
        padding: EdgeInsets.fromLTRB(0, 5.h, 0, 5.h),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(5.sp) , bottomRight: Radius.circular(5.sp)),
            color: Palette.brightUi,
            boxShadow: [
              ShadowPalette.defaultShadow
            ]
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 5.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "match id : ${matchDto.matchId}",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                ),
              ),
              Text(
                  "메세지 : ${e.toString()}",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                  color: Colors.redAccent
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
