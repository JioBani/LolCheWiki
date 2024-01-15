import 'package:app/Model/RiotApi/LeagueEntryDTO.dart';
import 'package:app/Model/RiotApi/QueueType.dart';
import 'package:app/Style/Images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';

class RankTabViewWidget extends StatefulWidget {
  const RankTabViewWidget({super.key, required this.leagueEntryDTOMap});
  final Map<QueueType, LeagueEntryDTO> leagueEntryDTOMap;

  @override
  State<RankTabViewWidget> createState() => _RankTabViewWidgetState();
}

class _RankTabViewWidgetState extends State<RankTabViewWidget>{


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.w,
      height: 120.h,
      child: DefaultTabController(
        animationDuration: const Duration(milliseconds: 300),
        length: 3,
        child: TabBarView(
          children: [
            Center(
              child: RankImageWidget(
                queueType: QueueType.ranked,
                leagueEntryDTO: widget.leagueEntryDTOMap[QueueType.ranked],
              ),
            ),
            Center(
              child: RankImageWidget(
                queueType: QueueType.hyperRoll,
                leagueEntryDTO: widget.leagueEntryDTOMap[QueueType.hyperRoll],
              ),
            ),
            Center(
              child: RankImageWidget(
                queueType: QueueType.doubleUp,
                leagueEntryDTO:  widget.leagueEntryDTOMap[QueueType.doubleUp],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RankImageWidget extends StatelessWidget {
  const RankImageWidget({super.key, required this.queueType , this.leagueEntryDTO});
  final LeagueEntryDTO? leagueEntryDTO;
  final QueueType queueType;

  @override
  Widget build(BuildContext context) {
    String rankString;
    String lpString;

    if(leagueEntryDTO != null){
      rankString = "${leagueEntryDTO!.tier} ${leagueEntryDTO!.rank}";
      lpString = "${leagueEntryDTO!.leaguePoints}LP";
    }
    else{
      rankString = "UNRANKED";
      lpString = "";
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          queueType.getGameName(),
          style: TextStyle(
            color: Color(0xff949494),
            fontSize: 13.sp,
          ),
        ),
        SizedBox(height: 2.h,),
        Image.asset(
          Images.tierTest,
          fit: BoxFit.fitWidth,
          width: 42.sp,
          height: 42.sp,
        ),
        SizedBox(height: 2.h,),
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            rankString,
            style: TextStyle(
              color: Color(0xff949494),
              fontSize: 13.sp,
            ),
          ),
        ),
        Text(
          lpString,
          style: TextStyle(
            color: Color(0xff949494),
            fontSize: 13.sp,
          ),
        ),
      ],
    );
  }
}
