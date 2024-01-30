class RiotApiCounter{
  int matchId = 0;
  int match = 0;
  int puuid = 0;
  int summoner = 0;
  int account = 0;
  int leagueEntry = 0;

  String print() {
    return
      "[RiotApiCounter.print()]"
      "matchId: $matchId, "
      "match: $match, "
      "puuid: $puuid, "
      "summoner: $summoner, "
      "account: $account, "
      "leagueEntry: $leagueEntry";
  }
}