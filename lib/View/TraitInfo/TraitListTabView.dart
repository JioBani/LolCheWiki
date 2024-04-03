import 'package:app/Model/Trait.dart';
import 'package:app/View/TraitInfo/TraitInfoTabView.dart';
import 'package:app/View/TraitInfo/TraitListTileWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TraitListTabView extends StatefulWidget {
  const TraitListTabView({super.key, required this.traitList, this.targetTrait});
  final List<Trait> traitList;
  final Trait? targetTrait;

  @override
  State<TraitListTabView> createState() => _TraitListTabViewState();
}

class _TraitListTabViewState extends State<TraitListTabView> with TickerProviderStateMixin{

  late TabController tabController;
  late PageController pageController;
  late ScrollController scrollController;
  Trait? tabTrait;
  int test = 0;

  double infoPageWidth = 320.w;
  
  /// 0 : 특성 리스트 보기 페이지 , 1 : 특성 정보 보기 페이지
  int page = 0;

  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 2, vsync: this);
    pageController = PageController(viewportFraction: 1.0);
    scrollController = ScrollController();


    if(widget.targetTrait != null){
      WidgetsBinding.instance
          .addPostFrameCallback((_) =>
          Future.delayed(const Duration(milliseconds: 300)).then((value) => onTapTraitListTile(widget.targetTrait!))
      );
    }
    super.initState();
  }

  /// 0 : 특성 리스트 보기 페이지 , 1 : 특성 정보 보기 페이지
  void movePage(int moveTo){
    if(moveTo == 0 && page != 0){
      scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.linearToEaseOut
      );
    }
    else if(moveTo == 1 && page != 1){
      scrollController.animateTo(
          infoPageWidth,
          duration: const Duration(milliseconds: 300),
          curve: Curves.linearToEaseOut
      );
    }
    page = moveTo;
  }

  void onTapTraitListTile(Trait trait){
    if(page == 0){
      tabTrait = trait;
      setState(() {

      });
      movePage(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(
            width: 360.w,
            child: ListView(
              children: widget.traitList.map((trait) =>
                  TraitListTileWidget(trait: trait, onTap: onTapTraitListTile)
              ).toList()
            ),
          ),
          SizedBox(
            width: infoPageWidth,
            child: TraitInfoTabView(
              trait: tabTrait,
              move: movePage,
            ),
          ),
        ],
      ),
    );
  }
}
