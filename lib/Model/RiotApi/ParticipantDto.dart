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

  factory ParticipantDto.fromJson(Map<String, dynamic> json) {
    List<TraitDto> traitDtoList = (json['traits'] as List)
        .map((i) => TraitDto.fromJson(i))
        .toList();

    traitDtoList.sort(TraitDto.compare);

    return ParticipantDto(
      companion: CompanionDto.fromJson(json['companion']),
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
          .map((i) => UnitDto.fromJson(i))
          .toList(),
    );
  }

  factory ParticipantDto.test() {
    return ParticipantDto(
      companion: CompanionDto.test(),
      goldLeft: 0,
      lastRound: 0,
      level: 0,
      placement: 0,
      playersEliminated: 0,
      puuid: "puuid_test",
      timeEliminated: 0,
      totalDamageToPlayers: 0,
      traits: [
        TraitDto.test(),
        TraitDto.test(),
        TraitDto.test(),
        TraitDto.test(),
        TraitDto.test(),
        TraitDto.test(),
      ],
      units: [
        UnitDto.test(),
        UnitDto.test(),
        UnitDto.test(),
        UnitDto.test(),
        UnitDto.test(),
      ],
    );
  }

  factory ParticipantDto.none() {
    return ParticipantDto(
      companion: CompanionDto.none(),
      goldLeft: 0,
      lastRound: 0,
      level: 0,
      placement: 0,
      playersEliminated: 0,
      puuid: "none",
      timeEliminated: 0,
      totalDamageToPlayers: 0,
      traits: [

      ],
      units: [

      ],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'companion': companion.toJson(),
      'gold_left': goldLeft,
      'last_round': lastRound,
      'level': level,
      'placement': placement,
      'players_eliminated': playersEliminated,
      'puuid': puuid,
      'time_eliminated': timeEliminated,
      'total_damage_to_players': totalDamageToPlayers,
      'traits': traits.map((e) => e.toJson()).toList(),
      'units': units.map((e) => e.toJson()).toList(),
    };
  }

  setSummoner(SummonerDTO summonerDTO){
    this.summonerDTO = summonerDTO;
  }
}
