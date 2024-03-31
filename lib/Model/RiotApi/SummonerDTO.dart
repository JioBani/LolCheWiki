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

  factory SummonerDTO.fromMap(Map<String, dynamic> map) {
    return SummonerDTO(
      accountId: map['accountId'],
      profileIconId: map['profileIconId'],
      revisionDate: map['revisionDate'],
      name: map['name'],
      id: map['id'],
      puuid: map['puuid'],
      summonerLevel: map['summonerLevel'],
    );
  }

  Map<String, dynamic> toMap() {
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
