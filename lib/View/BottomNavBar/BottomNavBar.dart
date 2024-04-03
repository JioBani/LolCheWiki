import 'package:app/View/Home/HomePage.dart';
import 'package:app/View/Test/Test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0,-2),
            blurRadius: 4,
            color: Colors.black.withOpacity(0.1)
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: (){
              Get.offAll(
                const HomePage(),
                transition: Transition.cupertino
              );
            },
            icon: Center(
              child: SvgPicture.asset(
                "assets/images/home.svg",
                width: 35.sp,
                height: 35.sp,
                color: Colors.black,
              ),
            ),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: (){

            },
            icon: Center(
              child: SvgPicture.asset(
                "assets/images/playlist.svg",
                width: 35.sp,
                height: 35.sp,
                color: Colors.black,
              ),
            ),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: (){
              Get.to(TestPage());
            },
            icon: Center(
              child: SvgPicture.asset(
                "assets/images/profile.svg",
                width: 35.sp,
                height: 35.sp,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
