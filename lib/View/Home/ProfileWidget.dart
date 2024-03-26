import 'package:app/Controller/HomePageController.dart';
import 'package:app/Controller/LoadingState.dart';
import 'package:app/Service/ProfileService.dart';
import 'package:app/Model/RiotApi/LeagueEntryDTO.dart';
import 'package:app/Model/RiotApi/QueueType.dart';
import 'package:app/Style/Images.dart';
import 'package:app/Style/Palette.dart';
import 'package:app/Style/Toasts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {

  HomePageController homePageController = HomePageController();

  void buildDialog(){
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: ((context) {
        return AlertDialog(
          actionsPadding: EdgeInsets.fromLTRB(0, 0, 0, 10.w),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r)
          ),
          title: Column(
            children: [
              Text(
                '즐겨찾기를 삭제할까요?',
                style: TextStyle(
                    fontSize: 17.sp,
                    color: Colors.black,
                ),
              ),
            ],
          ),
          actionsAlignment: MainAxisAlignment.spaceAround,
          actions: [
            TextButton(
                onPressed: (){
                  Get.find<ProfileService>().removeProfile().then((value) {
                      if (value) {
                        Toasts.buildToast(
                          text: '삭제가 완료되었습니다.',
                          context: context
                        );
                      }
                      else{
                        Toasts.buildToast(
                            text: '삭제에 실패했습니다.',
                            context: context
                        );
                      }
                    }
                  );
                  Navigator.pop(context);
                },
                child: Text(
                  '예',
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.black,
                  ),
                )
            ),
            TextButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text(
                  '아니오',
                  style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.black,
                  ),
                )
            ),
          ],
        );
      }),
    );
  }

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
              ),
              child: const Center(
                  child: Text("로딩중")
              ),
            );
          }
          else if(state == LoadingState.fail){
            return Container(
              width: 276.w,
              height: 150.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
              ),
              child: const Center(
                  child: Text("소환사 데이터를 가져 올 수 없습니다.")
              ),
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
                    ),
                    child: const Center(child:
                        Text("소환사 즐겨찾기가 없습니다.")
                    ),
                  ),

                ],
              );
            }
            else{
              LeagueEntryDTO? rankEntry = service.profile.value!.leagueEntryDTOMap[QueueType.ranked];

              return Stack(
                children: [
                  InkWell(
                    onTap: (){
                      homePageController.searchByPuuid(service.profile.value!.summonerDTO.puuid, context);
                    },
                    child: Container(
                      width: 276.w,
                      height: 150.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Image.asset(
                          Images.caitlyn,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: (){
                        buildDialog();
                      },
                      child: Icon(
                        Icons.close,
                        size: 30.sp,
                        color: Colors.black,
                      ),
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
                          "${rankEntry?.rank ?? ''} ${rankEntry?.tier ?? ''}",
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

