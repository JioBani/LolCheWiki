import 'package:app/Controller/LoadingState.dart';
import 'package:app/Service/ProfileService.dart';
import 'package:app/Model/RiotApi/LeagueEntryDTO.dart';
import 'package:app/Model/RiotApi/QueueType.dart';
import 'package:app/Style/Images.dart';
import 'package:app/Style/Palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 276.w,
      height: 150.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Palette.brightUi
      ),
      child: GetX<ProfileService>(
        builder: (service) {
          LoadingState state = service.loadingState.value;
          if(state == LoadingState.beforeLoading || state == LoadingState.loading){
            return Container(
              width: 276.w,
              height: 150.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [
                    ShadowPalette.defaultShadow
                    /*BoxShadow(
                      color: Colors.black,
                      offset: Offset(2,2),
                      blurRadius: 4
                    )*/
                  ]
              ),
              child: Text("로딩중"),
            );
          }
          else if(state == LoadingState.fail){
            return Container(
              width: 276.w,
              height: 150.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [
                    ShadowPalette.defaultShadow
                    /*BoxShadow(
                      color: Colors.black,
                      offset: Offset(2,2),
                      blurRadius: 4
                    )*/
                  ]
              ),
              child: Text("데이터를 가져 올 수 없습니다."),
            );
          }
          else{

            if(service.profile.value == null){
              return Stack(
                children: [
                  Container(
                    width: 276.w,
                    height: 150.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        boxShadow: [
                          ShadowPalette.defaultShadow
                          /*BoxShadow(
                      color: Colors.black,
                      offset: Offset(2,2),
                      blurRadius: 4
                    )*/
                        ]
                    ),
                    child: Text("프로필이 없습니다."),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        onPressed: () async {

                        },
                        icon: Icon(
                          Icons.menu,
                          size: 24.sp,
                          color: Palette.iconColor,
                        )
                    ),
                  ),
                ],
              );
            }
            else{
              LeagueEntryDTO? rankEntry = service.profile.value!.leagueEntryDTOMap[QueueType.ranked];

              return Stack(
                children: [
                  Container(
                    width: 276.w,
                    height: 150.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        boxShadow: [
                          ShadowPalette.defaultShadow
                          /*BoxShadow(
                      color: Colors.black,
                      offset: Offset(2,2),
                      blurRadius: 4
                    )*/
                        ]
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: Image.asset(
                        Images.caitlyn,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        onPressed: () async {

                        },
                        icon: Icon(
                          Icons.menu,
                          size: 24.sp,
                          color: Palette.iconColor,
                        )
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          service.profile.value?.name ?? '',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                              color: Colors.white
                          ),
                        ),
                        SizedBox(height: 10.h,),
                        Text(
                          "${rankEntry?.rank} ${rankEntry?.tier}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10.sp,
                              color: Colors.white
                          ),
                        )
                      ],
                    ),
                  )
                ],
              );
            }
          }
        }
      ),
    );
  }
}

