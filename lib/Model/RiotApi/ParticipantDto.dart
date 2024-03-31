import 'package:app/Model/RiotApi/TraitDto.dart';
import 'CompanionDto.dart';
import 'SummonerDTO.dart';
import 'UnitDto.dart';

class ParticipantDto {
  CompanionDto companion;
  int goldLeft;
  int lastRound;
  int level;
  int placement;
  int playersEliminated;
  String puuid;
  num timeEliminated;
  int totalDamageToPlayers;
  List<TraitDto> traits;
  List<UnitDto> units;
  SummonerDTO? summonerDTO;

  ParticipantDto({
    required this.companion,
    required this.goldLeft,
    required this.lastRound,
    required this.level,
    required this.placement,
    required this.playersEliminated,
    required this.puuid,
    required this.timeEliminated,
    required this.totalDamageToPlayers,
    required this.traits,
    required this.units,
  });

  factory ParticipantDto.fromMap(Map<String, dynamic> json) {
    List<TraitDto> traitDtoList = (json['traits'] as List)
        .map((i) => TraitDto.fromMap(i))
        .toList();

    traitDtoList.sort(TraitDto.compare);

    return ParticipantDto(
      companion: CompanionDto.fromMap(json['companion']),
      goldLeft: json['gold_left'],
      lastRound: json['last_round'],
      level: json['level'],
      placement: json['placement'],
      playersEliminated: json['players_eliminated'],
      puuid: json['puuid'],
      timeEliminated: json['time_eliminated'],
      totalDamageToPlayers: json['total_damage_to_players'],
      traits: traitDtoList,
      units: (json['units'] as List)
          .map((i) => UnitDto.fromMap(i))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'companion': companion.toMap(),
      'gold_left': goldLeft,
      'last_round': lastRound,
      'level': level,
      'placement': placement,
      'players_eliminated': playersEliminated,
      'puuid': puuid,
      'time_eliminated': timeEliminated,
      'total_damage_to_players': totalDamageToPlayers,
      'traits': traits.map((e) => e.toMap()).toList(),
      'units': units.map((e) => e.toMap()).toList(),
    };
  }

  setSummoner(SummonerDTO summonerDTO){
    this.summonerDTO = summonerDTO;
  }
}
