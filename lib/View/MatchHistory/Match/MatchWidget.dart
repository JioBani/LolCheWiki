import 'package:app/Common/DateCalculator.dart';
import 'package:app/Model/RiotApi/MatchDto.dart';
import 'package:app/Model/RiotApi/ParticipantDto.dart';
import 'package:app/Style/Palette.dart';
import 'package:app/View/MatchHistory/Match/ChampionTileWidget.dart';
import 'package:app/View/MatchHistory/Match/OpenIconWidget.dart';
import 'package:app/View/MatchHistory/Match/ParticipantWidget.dart';
import 'package:app/View/MatchHistory/Match/TraitDtoListWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class MatchWidget extends StatefulWidget {
  const MatchWidget({super.key, required this.matchDto, required this.ownerIndex});

  final MatchDto matchDto;
  final int ownerIndex;

  @override
  State<MatchWidget> createState() => _MatchWidgetState();
}

class _MatchWidgetState extends State<MatchWidget> with TickerProviderStateMixin{
  bool isText1Visible = true;
  bool isOpen = false;



  @override
  Widget build(BuildContext context) {
    ParticipantDto owner = widget.matchDto.info.participants[widget.ownerIndex];

    return Container(
      margin: EdgeInsets.only(right: 10.w , bottom: 24.h),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(5.sp) , bottomRight: Radius.circular(5.sp)),
        color: Palette.brightUi,
      ),
      child: AnimatedSize(
        clipBehavior: Clip.hardEdge,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 5.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TraitDtoListWidget(traitDtos: owner.traits,),
              Wrap(
                alignment: WrapAlignment.start,
                children: owner.units.map(
                        (unitDto) => ChampionTileWidget(unitDto: unitDto,)
                ).toList(),
              ),
              SizedBox(height: 5.h,),
              Row(
                children: [
                  Text(
                    widget.matchDto.info.getGameName(),
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff575757)
                    ),
                  ),
                  SizedBox(width: 22.w,),
                  Text(
                    DateCalculator.getElapsedTimeString(widget.matchDto.info.gameDatetime),
                    style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff8E8E8E)
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  Text(
                    "#${owner.placement}등",
                    style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                        color: Palette.rankColors[owner.placement]
                    ),
                  ),
                  SizedBox(width: 15.w,),
                  Text(
                    "#${owner.level}레벨",
                    style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff8E8E8E)
                    ),
                  ),
                  SizedBox(width: 23.w,),
                  OpenIconWidget(
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
                  )
                ],
              ),
              const Divider(color: Color(0xffD4D4D4),thickness: 2,),
              Builder(
                builder: (context){
                  if(!isOpen){
                    return SizedBox();
                  }
                  else{
                    return Column(
                      children: widget.matchDto.info.participants.map(
                              (participant) => ParticipantWidget(participantDto: participant, matchDto: widget.matchDto,)
                      ).toList(),
                    );
                  }
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}
