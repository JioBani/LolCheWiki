import 'package:app/Controller/LoadingState.dart';
import 'package:app/Model/Champion.dart';
import 'package:app/Service/GameDataService.dart';
import 'package:app/Style/Images.dart';
import 'package:app/Style/Palette.dart';
import 'package:app/View/ChampionInfo/ChampionSearchPage.dart';
import 'package:app/View/ChampionInfo/TraitTextWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'ChampionInfoPage.dart';

class ChampionListPage extends StatefulWidget {
  const ChampionListPage({super.key});

  @override
  State<ChampionListPage> createState() => _ChampionListPageState();
}

class _ChampionListPageState extends State<ChampionListPage> with TickerProviderStateMixin{
  late TabController tabController = TabController(length: 3, vsync: this);

  @override
  void dispose() {
    // TODO: implement dispose
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var gameDataService = Get.find<GameDataService>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10.w, 0, 0, 0),
                  child: IconButton(
                      onPressed: (){
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 25.sp,
                      )
                  ),
                ),
                Text(
                  '#챔피언 목록',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 5.w, 0),
                  child: IconButton(
                      onPressed: (){
                        if(gameDataService.championList != null){
                          Get.to(ChampionSearchPage(championList: gameDataService.championList!,));
                        }
                        else{
                          Fluttertoast.showToast(msg: '챔피언 데이터를 불러오는 중 입니다.');
                        }
                      },
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        Icons.search,
                        size: 30.sp,
                      )
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h,),
            SortTabBar(controller : tabController,),
            SizedBox(height: 10.h,),
            Expanded(
                child: GetX<GameDataService>(
                  builder: (service) {
                    if(
                    service.loadingState.value == LoadingState.beforeLoading ||
                        service.loadingState.value == LoadingState.loading
                    ){
                      return const Center(child: Text('로딩중'));
                    }
                    else if(service.loadingState.value == LoadingState.fail){
                      return const Center(child: Text('데이터를 가져 올 수 없습니다.'));
                    }
                    else{
                      return TabBarView(
                         controller: tabController,
                          children: const [
                            ChampionListTabViewPage(sortMode: SortMode.name,),
                            ChampionListTabViewPage(sortMode: SortMode.cost,),
                            ChampionListTabViewPage(sortMode: SortMode.trait,),
                          ]
                      );
                    }
                  },
                )
            )
          ],
        )
      ),
    );
  }
}

class ChampionTileWidget extends StatelessWidget {
  const ChampionTileWidget({super.key, required this.champion, this.isExpand = false});
  final Champion champion;
  final bool isExpand;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(ChampionInfoPage(champion: champion,));
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(5.w, 10.w, 5.w, 10.w),
        height: 100.w,
        width: isExpand ? double.infinity : 160.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          color: Palette.brightUi,
        ),
        padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 50.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 50.sp,
                    height: 50.sp,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: champion.cost < 6 ? Palette.rarityColor[champion.cost] : Colors.black,
                          width: 3.sp,
                        ),
                        borderRadius: BorderRadius.circular(100.r)
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.r),
                      child: Image.asset(
                        Images.getChampionTileImagePath(champion.apiName),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      champion.name,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                      overflow: TextOverflow.clip,
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(width: 10.w,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: champion.traitNames.map((trait) => TraitTextWidget(trait: trait)).toList(),
                      )
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SortTabBar extends StatefulWidget {
  const SortTabBar({super.key, required this.controller});
  final TabController controller;

  @override
  State<SortTabBar> createState() => _SortTabBarState();
}

class _SortTabBarState extends State<SortTabBar> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.controller.addListener(onTabChanged);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.controller.removeListener(onTabChanged);
  }

  void onTabChanged(){
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {

    return TabBar(
        controller: widget.controller,
        indicatorColor: Colors.transparent,
        labelColor : Colors.white,
        unselectedLabelColor: Colors.black,
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) return Colors.transparent; // 누른 상태
            if (states.contains(MaterialState.hovered)) return Colors.transparent; // 호버 상태
            return null; // 기본값
          },
        ),
        tabs: [
          Tab(
            child: SortTabContainer(
              recentIndex: widget.controller.index,
              index: 0,
              text: '이름순',
            ),
          ),
          Tab(
            child: SortTabContainer(
              recentIndex: widget.controller.index,
              index: 1,
              text: '가격순',
            ),
          ),
          Tab(
            child: SortTabContainer(
              recentIndex: widget.controller.index,
              index: 2,
              text: '특성순',
            ),
          ),
        ]
    );
  }
}

class SortTabContainer extends StatelessWidget {
  const SortTabContainer({super.key, required this.recentIndex, required this.index, required this.text});
  final int recentIndex;
  final int index;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95.w,
      height: 35.h,
      decoration: BoxDecoration(
          color: recentIndex == index ? Palette.green : Palette.unSelectedGrey ,
          borderRadius: BorderRadius.circular(5.r)
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontSize: 14.sp,
              color:recentIndex == index  ? Colors.white : Colors.black
          ),
        ),
      ),
    );
  }
}

class ChampionListTabViewPage extends StatelessWidget {
  const ChampionListTabViewPage({super.key, required this.sortMode});
  final SortMode sortMode;

  @override
  Widget build(BuildContext context) {
    GameDataService service = Get.find<GameDataService>();

    return GridView.count(
      childAspectRatio: (100.w / 70.w),
      shrinkWrap: true,
      padding: EdgeInsets.only(top: 10.w, left: 10.w, right: 10.w),
      mainAxisSpacing: 5.w,
      crossAxisSpacing: 5.w,
      crossAxisCount: 2,
      children: service.getChampionList(sortMode)!.map((champion) =>
          ChampionTileWidget(champion: champion,)
      ).toList(),
    );
  }
}

