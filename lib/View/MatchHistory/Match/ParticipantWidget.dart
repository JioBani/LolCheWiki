import 'package:app/Model/RiotApi/ParticipantDto.dart';
import 'package:app/Style/Palette.dart';
import 'package:app/View/MatchHistory/Match/TraitDtoListWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'ChampionTileWidget.dart';

class ParticipantWidget extends StatelessWidget {
  const ParticipantWidget({super.key, required this.participantDto});
  final ParticipantDto participantDto;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 5.w,),
            Text(
              "#${participantDto.placement}등",
              style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w600,
                  color: Palette.rankColors[participantDto.placement]
              ),
            ),
            SizedBox(width: 5.w,),
            Text("티어"),
            Text("JioBani"),
            Expanded(child: SizedBox()),
            SizedBox(width: 15.w,),
            Text(
              "#${participantDto.level}레벨",
              style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff8E8E8E)
              ),
            ),
          ],
        ),
        TraitDtoListWidget(traitDtos: participantDto.traits,),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: participantDto.units.map(
                        (unitDto) => ChampionTileWidget(unitDto: unitDto,)
                ).toList(),
            )
        ),
      ],
    );
  }
}
