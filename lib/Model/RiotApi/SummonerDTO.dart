class SummonerDTO {
  String accountId;
  int profileIconId;
  int revisionDate;
  String name;
  String id;
  String puuid;
  int summonerLevel;

  SummonerDTO({
    required this.accountId,
    required this.profileIconId,
    required this.revisionDate,
    required this.name,
    required this.id,
    required this.puuid,
    required this.summonerLevel,
  });

  factory SummonerDTO.fromJson(Map<String, dynamic> json) {
    return SummonerDTO(
      accountId: json['accountId'],
      profileIconId: json['profileIconId'],
      revisionDate: json['revisionDate'],
      name: json['name'],
      id: json['id'],
      puuid: json['puuid'],
      summonerLevel: json['summonerLevel'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accountId': accountId,
      'profileIconId': profileIconId,
      'revisionDate': revisionDate,
      'name': name,
      'id': id,
      'puuid': puuid,
      'summonerLevel': summonerLevel,
    };
  }
}
