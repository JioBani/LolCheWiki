import 'package:app/Model/RiotApi/MiniSeriesDTO.dart';
import 'package:flutter/cupertino.dart';

class LeagueEntryDTO {
  String puuid;
  String? leagueId;
  String summonerId;
  String summonerName;
  String queueType;
  String? ratedTier;
  int? ratedRating;
  String? tier;
  String? rank;
  int? leaguePoints;
  int? wins;
  int? losses;
  bool? hotStreak;
  bool? veteran;
  bool? freshBlood;
  bool? inactive;
  MiniSeriesDTO? miniSeries;

  LeagueEntryDTO({
    required this.puuid,
    this.leagueId,
    required this.summonerId,
    required this.summonerName,
    required this.queueType,
    this.ratedTier,
    this.ratedRating,
    this.tier,
    this.rank,
    this.leaguePoints,
    this.wins,
    this.losses,
    this.hotStreak,
    this.veteran,
    this.freshBlood,
    this.inactive,
    this.miniSeries,
  });

  static List<LeagueEntryDTO> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => LeagueEntryDTO.fromMap(json)).toList();
  }

  factory LeagueEntryDTO.fromMap(Map<String, dynamic> map) {
    try{
      return LeagueEntryDTO(
          puuid: map['puuid'],
          leagueId: map['leagueId'],
          summonerId: map['summonerId'],
          summonerName: map['summonerName'],
          queueType: map['queueType'],
          ratedTier: map['ratedTier'],
          ratedRating: map['ratedRating'],
          tier: map['tier'],
          rank: map['rank'],
          leaguePoints: map['leaguePoints'],
          wins: map['wins'],
          losses: map['losses'],
          hotStreak: map['hotStreak'],
          veteran: map['veteran'],
          freshBlood: map['freshBlood'],
          inactive: map['inactive'],
          miniSeries: (map['miniSeries'] == null) ? null : MiniSeriesDTO.fromMap(map['miniSeries'])
      );
    }catch(e , s){
      debugPrint("$e\n$s");
      return LeagueEntryDTO.error();
    }
  }

  factory LeagueEntryDTO.error(){
    return LeagueEntryDTO(
        puuid: 'error', summonerId: 'error', summonerName: 'error', queueType: 'error',
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'puuid': puuid,
      'leagueId': leagueId,
      'summonerId': summonerId,
      'summonerName': summonerName,
      'queueType': queueType,
      'ratedTier': ratedTier,
      'ratedRating': ratedRating,
      'tier': tier,
      'rank': rank,
      'leaguePoints': leaguePoints,
      'wins': wins,
      'losses': losses,
      'hotStreak': hotStreak,
      'veteran': veteran,
      'freshBlood': freshBlood,
      'inactive': inactive,
      'miniSeries': miniSeries?.toMap(), // MiniSeriesDTO.toJson 추가
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'puuid': puuid,
      'leagueId': leagueId,
      'summonerId': summonerId,
      'summonerName': summonerName,
      'queueType': queueType,
      'ratedTier': ratedTier,
      'ratedRating': ratedRating,
      'tier': tier,
      'rank': rank,
      'leaguePoints': leaguePoints,
      'wins': wins,
      'losses': losses,
      'hotStreak': hotStreak,
      'veteran': veteran,
      'freshBlood': freshBlood,
      'inactive': inactive,
      'miniSeries': miniSeries?.toMap(), // Assuming MiniSeriesDTO also has a toMap method
    };
  }
}
