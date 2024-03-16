import 'package:app/Style/Palette.dart';
import 'package:app/View/BottomNavBar/BottomNavBar.dart';
import 'package:app/View/ChampionInfo/ChampionListPage.dart';
import 'package:app/View/Home/CustomSearchBarWidget.dart';
import 'package:app/View/Home/ProfileWidget.dart';
import 'package:app/View/Home/SearchHistoryWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 113.h),
              const CustomSearchBar(),
              SizedBox(height: 10.h),
              const SearchHistoryWidget(),
              SizedBox(height: 50.h),
              const ProfileWidget(),
              SizedBox(height: 56.h,),
              Padding(
                padding: EdgeInsets.only(left: 10.w , right: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      child: Container(
                        width: 90.w,
                        height: 100.h,
                        decoration: BoxDecoration(
                          color: Palette.brightUi,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      onTap: (){
                        Get.to(const ChampionListPage());
                      },
                    ),
                    Container(
                      width: 90.w,
                      height: 100.h,
                      decoration: BoxDecoration(
                        color: Palette.brightUi,
                        borderRadius: BorderRadius.circular(10.r),

                      ),
                    ),
                    Container(
                      width: 90.w,
                      height: 100.h,
                      decoration: BoxDecoration(
                        color: Palette.brightUi,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
