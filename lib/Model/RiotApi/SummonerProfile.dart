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

  Map<String, dynamic> toMap() {
    return {
      'leagueEntryDTOMap': leagueEntryDTOMap.map((queueType, leagueEntryDTO) =>
          MapEntry(queueType.toString(), leagueEntryDTO.toMap())),
      'summonerDTO': summonerDTO.toMap(),
      'name': name,
      'tag': tag,
      'profileImageNumber': profileImageNumber,
    };
  }

  factory SummonerProfile.fromMap(Map<String, dynamic> map) {
    Map<QueueType, LeagueEntryDTO> leagueEntryMap = {};
    var leagueEntries = map['leagueEntryDTOMap'] as Map;
    leagueEntries.forEach((queueType, leagueEntryData) {
      QueueType type = QueueTypeExtension.fromString(queueType);
      if (type != QueueType.none) {
        leagueEntryMap[type] = LeagueEntryDTO.fromMap(Map<String, dynamic>.from(leagueEntryData));
      }
    });

    return SummonerProfile(
      leagueEntryDTOList: leagueEntryMap.values.toList(),
      summonerDTO: SummonerDTO.fromMap(Map<String, dynamic>.from(map['summonerDTO'])),
      name: map['name'],
      tag: map['tag'],
      profileImageNumber: map['profileImageNumber'],
    );
  }
}