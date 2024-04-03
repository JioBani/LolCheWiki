import 'package:app/Controller/SearchHistoryController.dart';
import 'package:app/Style/Images.dart';
import 'package:app/Style/Palette.dart';
import 'package:app/View/ChampionInfo/ChampionListPage.dart';
import 'package:app/View/Home/CustomSearchBarWidget.dart';
import 'package:app/View/Home/ProfileWidget.dart';
import 'package:app/View/Home/SearchHistoryWidget.dart';
import 'package:app/View/ItemInfo/ItemInfoPage.dart';
import 'package:app/View/TraitInfo/TraitListPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var searchController = Get.put(SearchHistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Text(
                '#롤체위키',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Palette.green,
                  fontSize: 25.sp
                ),
              ),
              SizedBox(height: 60.h),
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
                    PageMoveButtonWidget(
                      page: const ChampionListPage(),
                      imagePath: Images.icons.championIcon,
                      text: '챔피언',
                    ),
                    PageMoveButtonWidget(
                      page: const TraitListPage(),
                      imagePath: Images.icons.traitIcon,
                      text: '특성',
                      imageColor: Colors.black,
                    ),
                    PageMoveButtonWidget(
                      page: const ItemInfoPage(),
                      imagePath: Images.icons.itemIcon,
                      text: '아이템',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PageMoveButtonWidget extends StatelessWidget {
  const PageMoveButtonWidget({super.key,
    required this.page,
    required this.imagePath,
    required this.text,
    this.imageColor
  });

  final Widget page;
  final String imagePath;
  final String text;
  final Color? imageColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          width: 90.w,
          height: 100.h,
          decoration: BoxDecoration(
            color: Palette.brightUi,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(9.w),
                  child: ClipRRect(
                    borderRadius : BorderRadius.circular(100.r),
                    child: Image.asset(
                      imagePath,
                      color: imageColor,
                    ),
                  ),
                ),
              ),
              Text(
                text,
                style: TextStyle(
                    color: Palette.darkGray
                ),
              ),
              SizedBox(height: 10.w,)
            ],
          )
      ),
      onTap: (){
        Get.to(page);
      },
    );
  }
}

