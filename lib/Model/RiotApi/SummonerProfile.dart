import 'package:app/Model/RiotApi/LeagueEntryDTO.dart';
import 'package:app/Model/RiotApi/QueueType.dart';
import 'package:app/Model/RiotApi/SummonerDTO.dart';
import 'package:get/get.dart';

class SummonerProfile{
  late Map<QueueType , LeagueEntryDTO>  leagueEntryDTOMap;
  SummonerDTO summonerDTO;
  String name;
  String? tag;
  int profileImageNumber;


  SummonerProfile({
    required List<LeagueEntryDTO> leagueEntryDTOList ,
    required this.summonerDTO,
    required this.name,
    required this.tag,
    required this.profileImageNumber,
  }){
    leagueEntryDTOMap = Map();
    for (var leagueEntryDTO in leagueEntryDTOList) {
      QueueType queueType = QueueTypeExtension.fromString(leagueEntryDTO.queueType!);
      leagueEntryDTOMap.addIf(queueType != QueueType.none , queueType , leagueEntryDTO);
    }
  }
}