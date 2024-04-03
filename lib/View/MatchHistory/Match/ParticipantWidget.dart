import 'package:app/Model/RiotApi/MatchDto.dart';
import 'package:app/Model/RiotApi/ParticipantDto.dart';
import 'package:app/View/MatchHistory/Match/TraitDtoListWidget.dart';
import 'package:flutter/material.dart';

import 'ChampionTileWidget.dart';

class ParticipantWidget extends StatefulWidget {
  const ParticipantWidget({super.key, required this.participantDto, required this.matchDto });
  final ParticipantDto participantDto;
  final MatchDto matchDto;

  @override
  State<ParticipantWidget> createState() => _ParticipantWidgetState();
}

class _ParticipantWidgetState extends State<ParticipantWidget> {

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TraitDtoListWidget(traitDtos: widget.participantDto.traits,),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.participantDto.units.map(
                        (unitDto) => ChampionTileWidget(unitDto: unitDto,)
                ).toList(),
            )
        ),
        const Divider(
          color: Colors.black,
        )
      ],
    );
  }
}
