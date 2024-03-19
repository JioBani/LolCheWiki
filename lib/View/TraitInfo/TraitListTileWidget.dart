import 'package:app/Model/Trait.dart';
import 'package:app/Style/Images.dart';
import 'package:app/Style/Palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'ChampionTileWidget.dart';

class TraitListTileWidget extends StatelessWidget {
  const TraitListTileWidget({super.key , required this.trait, required this.onTap});
  final Trait trait;
  final Function(Trait) onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onTap(trait);
      },
      child: Container(
        width: double.infinity,
        height: 75.h,
        margin: EdgeInsets.fromLTRB(0, 5.h, 10.w, 5.h),
        decoration: BoxDecoration(
            color: Palette.brightUi,
            borderRadius: BorderRadius.only(topRight: Radius.circular(10.r) , bottomRight: Radius.circular(10.r))
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(10.w, 0, 0, 0),
          child: Row(
            children: [
              Image.asset(
                Images.traitDefaultImage,
                color: Colors.black,
                width: 40.sp,
                height: 40.sp,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    trait.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15.sp
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: trait.members.map((champion) =>
                          ChampionTileWidget(champion: champion , width: 25.sp, height: 25.sp,)
                      ).toList() ?? [],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
