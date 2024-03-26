import 'package:app/Model/RiotApi/SummonerProfile.dart';
import 'package:app/Service/DataStoreService.dart';
import 'package:app/Service/ProfileService.dart';
import 'package:app/Style/Images.dart';
import 'package:app/Style/Toasts.dart';
import 'package:app/View/Test/Dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:simple_shadow/simple_shadow.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key, required this.summonerProfile});
  final SummonerProfile summonerProfile;

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    final String name;
    if(widget.summonerProfile.tag != null){
      name = "${widget.summonerProfile.name}#${widget.summonerProfile.tag}";
    }
    else{
      name = widget.summonerProfile.name;
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
                  child: Align(
                    alignment: Alignment.topRight,
                    child: GetX<ProfileService>(
                      builder: (service) {
                        bool isBookmarked =
                            service.profile.value != null &&
                            service.profile.value!.summonerDTO.puuid == widget.summonerProfile.summonerDTO.puuid;

                        if(isBookmarked){
                          return InkWell(
                            onTap: () {
                              service.removeProfile();
                            },
                            child: Image.asset(
                                Images.icons.bookmark,
                                width: 25.sp,
                                color: Colors.green
                            ),
                          );
                        }
                        else{
                          return InkWell(
                            onTap: () async {

                              bool result = await DataStoreService.saveBookmarkPuuid(widget.summonerProfile.summonerDTO.puuid);

                              if(!mounted) {
                                return;
                              }

                              if(result){
                                await Dialogs.showLoadingDialogWithFuture(context, service.fetchData());
                                if(mounted){
                                  Toasts.buildToast(text: '즐겨찾기 등록에 성공했습니다.', context: context);
                                }
                              }
                              else{
                                if(mounted){
                                  Toasts.buildToast(text: '즐겨찾기 등록에 실패했습니다.', context: context);
                                }
                              }

                            },
                            child: Image.asset(
                                Images.icons.bookmark,
                                width: 25.sp,
                                color: Colors.grey
                            ),
                          );
                        }
                      }
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
                    "LV. ${widget.summonerProfile.summonerDTO.summonerLevel}",
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
        ],
      ),
    );
  }
}
