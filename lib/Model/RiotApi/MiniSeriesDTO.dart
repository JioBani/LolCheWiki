class MiniSeriesDTO {
  int losses;
  String progress;
  int target;
  int wins;

  MiniSeriesDTO({
    required this.losses,
    required this.progress,
    required this.target,
    required this.wins,
  });

  factory MiniSeriesDTO.fromMap(Map<String, dynamic> json) {
    return MiniSeriesDTO(
      losses: json['losses'] ?? 0,
      progress: json['progress'] ?? "",
      target: json['target'] ?? 0,
      wins: json['wins'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'losses': losses,
      'progress': progress,
      'target': target,
      'wins': wins,
    };
  }
}
