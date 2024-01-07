import 'package:app/Style/Images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_shadow/simple_shadow.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            width: 96.w,
            height: 96.w,
            child: SimpleShadow(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Image.network(
                  Images.testProfile
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "LV. 22",
                  style: TextStyle(
                    color: Color(0xff949494),
                    fontSize: 13.sp,
                  ),
                ),
                SizedBox(height: 10.h,),
                Text(
                  "JIOBANI",
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 10.h,)
              ],
            ),
          ),
          Expanded(child: SizedBox()),
          Column(
            children: [
              SizedBox(
                height: 65.h,
                width: 65.h,
                child: Image.asset(
                  Images.tierTest,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Text(
                "MASTER",
                style: TextStyle(
                  color: Color(0xff949494),
                  fontSize: 13.sp,
                ),
              ),
            ],
          ),
          SizedBox(width: 20.w,)
        ],
      ),
    );
  }
}
