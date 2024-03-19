import 'package:app/Controller/LoadingState.dart';
import 'package:app/Controller/TraitInfoPageController.dart';
import 'package:app/Model/Trait.dart';
import 'package:app/Service/GameDataService.dart';
import 'package:app/Style/Palette.dart';
import 'package:app/View/TraitInfo/TraitListTabView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TraitListPage extends StatefulWidget {
  const TraitListPage({super.key, this.targetTrait});
  final Trait? targetTrait;

  @override
  State<TraitListPage> createState() => _TraitListPageState();
}

class _TraitListPageState extends State<TraitListPage> with TickerProviderStateMixin{

  late TabController traitTypeTabController;
  late TraitInfoPageController traitInfoPageController;

  @override
  void initState() {
    // TODO: implement initState
    traitTypeTabController = TabController(length: 2, vsync: this);
    traitInfoPageController = Get.put(TraitInfoPageController());
    traitInfoPageController.fetchTraitList();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10.h,),
            Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
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
                ),
                Text(
                  '#시너지 목록',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            TabBar(
              controller: traitTypeTabController,
              labelColor: Palette.green,
              indicatorColor : Palette.green,
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              tabs: const [
                Tab(text : '계열'),
                Tab(text : '직업'),
              ],
            ),
            SizedBox(height: 10.h,),
            GetX<GameDataService>(
                builder: (service){
                  var state = service.loadingState.value;
                  if(
                  state == LoadingState.beforeLoading || state == LoadingState.loading
                  ){
                    return  const CupertinoActivityIndicator();
                  }
                  else if(state == LoadingState.fail){
                    return const Center(
                      child: Text("데이터를 불러 올 수 없습니다."),
                    );
                  }
                  else{
                    return Expanded(
                      child: TabBarView(
                          controller: traitTypeTabController,
                          children: [
                            TraitListTabView(traitList: service.traitList!, targetTrait: widget.targetTrait,),
                            TraitListTabView(traitList: service.traitList!,),
                          ]
                      ),
                    );
                  }
                }
            ),
          ],
        ),
      ),
    );
  }
}
