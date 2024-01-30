class DateCalculator{

  static String getElapsedTimeString(int timestamp) {
    DateTime now = DateTime.now();
    DateTime targetTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    Duration difference = now.difference(targetTime);

    if (difference.inHours < 1) {
      int minutes = difference.inMinutes;
      return "$minutes분 전";
    } else if (difference.inDays < 1) {
      int hours = difference.inHours;
      return "$hours시간 전";
    } else if (difference.inDays < 30) {
      int days = difference.inDays;
      return "$days일 전";
    } else if (difference.inDays < 365) {
      int months = now.month - targetTime.month + (now.year - targetTime.year) * 12;
      return "$months달 전";
    } else {
      return "오래 전";
    }
  }
}