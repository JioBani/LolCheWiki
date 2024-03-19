import 'package:app/Model/Champion.dart';
import 'package:app/Style/Images.dart';
import 'package:app/Style/Palette.dart';
import 'package:app/View/MatchHistory/Match/OpenIconWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChampionInfoPage extends StatefulWidget {
  const ChampionInfoPage({super.key, required this.champion});
  final Champion champion;

  @override
  State<ChampionInfoPage> createState() => _ChampionInfoPageState();
}

class _ChampionInfoPageState extends State<ChampionInfoPage> with TickerProviderStateMixin{
  bool isText1Visible = true;
  bool isOpen = false;


  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(const Duration(milliseconds: 100)).then((value){
      setState(() {
        isOpen = true;
      });
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Image.asset(
            Images.getChampionFullImage(widget.champion.apiName),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
            //fit: BoxFit.fitWidth,
          ),
          Align(
            alignment: Alignment.topRight,
            child: OpenIconWidget(
              duration: const Duration(milliseconds: 500),
              onOpenAction: (){
                setState(() {
                  isOpen = !isOpen;
                });
              },
              onClosedAction: (){
                setState(() {
                  isOpen = !isOpen;
                });
              },
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(15.sp) , topLeft: Radius.circular(15.sp)),
                  color: Colors.white
                ),
                child: AnimatedSize(
                  clipBehavior: Clip.hardEdge,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 5.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Builder(
                            builder: (context){
                              if(!isOpen){
                                return const SizedBox.shrink();
                              }
                              else{
                                return Container(
                                  constraints: BoxConstraints(
                                    maxHeight: MediaQuery.of(context).size.height - 75.h
                                  ),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 20.h,),
                                        Padding(
                                          padding: EdgeInsets.only(left: 10.w),
                                          child: Text(
                                            widget.champion.name,
                                            style: TextStyle(
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.w900,
                                                color: Colors.black
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 20.h,),
                                        Row(
                                          children: widget.champion.traitNames.map((trait) =>
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: Palette.brightGray,
                                                    borderRadius: BorderRadius.circular(7.r)
                                                ),
                                                padding: EdgeInsets.fromLTRB(10.w, 5.w, 10.w, 5.w),
                                                margin: EdgeInsets.fromLTRB(5.w, 0, 10.w, 0),
                                                child: Text(
                                                  trait,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 14.sp
                                                  ),
                                                ),
                                              )
                                          ).toList(),
                                        ),
                                        SizedBox(height: 63.h,),
                                        Row(
                                          children: [
                                            ClipRRect(
                                              child: Image.asset(
                                                Images.getChampionSkill(widget.champion.apiName)
                                              ),
                                              borderRadius: BorderRadius.circular(5.r),
                                            ),
                                            SizedBox(width: 10.w,),
                                            Text(
                                              widget.champion.ability.name,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 15.sp
                                              )
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 33.h,),
                                        Text(
                                          widget.champion.ability.desc
                                        ),
                                        SizedBox(height: 80.h,),
                                        Text(
                                            "추천아이템"
                                        ),
                                        SizedBox(height: 100.h,),
                                      ],
                                    ),
                                  ),
                                );
                              }
                            }
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
