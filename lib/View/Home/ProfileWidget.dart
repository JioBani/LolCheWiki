import 'package:app/Style/Images.dart';
import 'package:app/Style/Palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 276.w,
      height: 150.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Palette.brightUi
      ),
      child: Stack(
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
                onPressed: (){},
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
                  "JIOBANI",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                    color: Colors.white
                  ),
                ),
                SizedBox(height: 10.h,),
                Text(
                  "Gold VI",
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
      ),
    );
  }
}
