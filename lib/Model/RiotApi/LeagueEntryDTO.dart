import 'package:app/Model/RiotApi/MiniSeriesDTO.dart';

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
    required this.leagueId,
    required this.summonerId,
    required this.summonerName,
    required this.queueType,
    required this.ratedTier,
    required this.ratedRating,
    required this.tier,
    required this.rank,
    required this.leaguePoints,
    required this.wins,
    required this.losses,
    required this.hotStreak,
    required this.veteran,
    required this.freshBlood,
    required this.inactive,
    required this.miniSeries,
  });

  static List<LeagueEntryDTO> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => LeagueEntryDTO.fromJson(json)).toList();
  }

  factory LeagueEntryDTO.fromJson(Map<String, dynamic> json) {
    return LeagueEntryDTO(
        puuid: json['puuid'],
        leagueId: json['leagueId'],
        summonerId: json['summonerId'],
        summonerName: json['summonerName'],
        queueType: json['queueType'],
        ratedTier: json['ratedTier'],
        ratedRating: json['ratedRating'],
        tier: json['tier'],
        rank: json['rank'],
        leaguePoints: json['leaguePoints'],
        wins: json['wins'],
        losses: json['losses'],
        hotStreak: json['hotStreak'],
        veteran: json['veteran'],
        freshBlood: json['freshBlood'],
        inactive: json['inactive'],
        miniSeries: (json['miniSeries'] == null) ? null : MiniSeriesDTO.fromJson(json['miniSeries'])
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
      'miniSeries': miniSeries?.toJson(), // MiniSeriesDTO.toJson 추가
    };
  }
}
