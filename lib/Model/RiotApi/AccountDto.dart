class AccountDto {
  String puuid;
  String? gameName;
  String? tagLine;

  AccountDto({
    required this.puuid,
    this.gameName,
    this.tagLine,
  });

  factory AccountDto.fromJson(Map<String, dynamic> json) {
    return AccountDto(
      puuid: json['puuid'],
      gameName: json['gameName'],
      tagLine: json['tagLine'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'puuid': puuid,
      'gameName': gameName,
      'tagLine': tagLine,
    };
  }
}
