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
    return jsonList.map((json) => LeagueEntryDTO.fromMap(json)).toList();
  }

  factory LeagueEntryDTO.fromMap(Map<String, dynamic> map) {
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
