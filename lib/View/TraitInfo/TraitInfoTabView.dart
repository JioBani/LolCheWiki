import 'package:app/Model/Trait.dart';
import 'package:app/Service/GameDataService.dart';
import 'package:app/Style/Images.dart';
import 'package:app/Style/Palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class TraitInfoTabView extends StatelessWidget {
  const TraitInfoTabView({
    super.key,
    required this.trait,
    required this.test,
    required this.scrollController,
    required this.move,
  });

  final Trait? trait;
  final int test;
  final ScrollController scrollController;

  final Function(int) move;

  @override
  Widget build(BuildContext context) {
    GameDataService gameDataService = Get.find<GameDataService>();
    return Builder(
      builder: (context) {
        if(trait == null){
          return SizedBox();
        }
        else{
          return Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 10.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r) ,
                  bottomLeft: Radius.circular(10.r)
              ),
              boxShadow: [
                ShadowPalette.defaultShadow
              ],
              color: Colors.white
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.w,),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10.w, 0, 0, 0),
                        child: IconButton(
                            onPressed: (){
                              move(0);
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              size: 20.sp,
                            )
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            Images.traitDefaultImage,
                            color: Colors.black,
                            width: 30.sp,
                            height: 30.sp,
                          ),
                          SizedBox(width: 2.w,),
                          Text(
                            trait?.name ?? '',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                //HtmlWidget(trait?.desc ?? ''),
                SizedBox(height: 30.w,),
                Padding(
                  padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 0),
                  child: HtmlWidget(trait?.formatDescription() ?? ''),
                ),
                Row(
                  children: gameDataService.traitChampions?[trait?.name]?.map((e) => Text(e.name)).toList() ?? [],
                )
              ],
            ),
          );
        }
      }
    );
  }
}
