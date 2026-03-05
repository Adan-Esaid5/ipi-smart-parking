class PricingRule {
  final double ratePerMinute; // מחיר לדקה
  final double dailyMax;      // תקרה יומית עד חצות
  final int graceMinutes;     // דקות חינם בתחילת החניה (חד-פעמי)

  const PricingRule({
    required this.ratePerMinute,
    required this.dailyMax,
    this.graceMinutes = 0,
  });

  double calculateAmount(DateTime entry, DateTime exit) {
    if (!exit.isAfter(entry)) return 0;

    double total = 0.0;
    DateTime start = entry;
    int remainingGrace = graceMinutes; // יורד רק בתחילת החניה, פעם אחת

    while (start.isBefore(exit)) {
      // חצות הבא (00:00 של היום הבא)
      final nextMidnight = DateTime(start.year, start.month, start.day + 1);

      // קטע החניה של אותו יום
      final segmentEnd = exit.isBefore(nextMidnight) ? exit : nextMidnight;

      final totalMinutes = segmentEnd.difference(start).inMinutes;

      // מורידים חסד רק אם נשאר
      final graceToUse = remainingGrace.clamp(0, totalMinutes);
      final billableMinutes = totalMinutes - graceToUse;

      remainingGrace -= graceToUse;

      final raw = billableMinutes * ratePerMinute;
      final capped = raw > dailyMax ? dailyMax : raw;

      total += capped;
      start = segmentEnd;
    }

    return total;
  }

  /// סטטיסטיקות למסך: דקות כוללות, דקות לחיוב, חסד שנוצל ונשאר.
  PricingStats getStats(DateTime entry, DateTime exit) {
    if (!exit.isAfter(entry)) {
      return const PricingStats(
        totalMinutes: 0,
        billableMinutes: 0,
        graceUsedMinutes: 0,
        graceRemainingMinutes: 0,
      );
    }

    int totalMinutesAll = 0;
    int billableMinutesAll = 0;
    int graceUsedAll = 0;

    DateTime start = entry;
    int remainingGrace = graceMinutes;

    while (start.isBefore(exit)) {
      final nextMidnight = DateTime(start.year, start.month, start.day + 1);
      final segmentEnd = exit.isBefore(nextMidnight) ? exit : nextMidnight;

      final totalMinutes = segmentEnd.difference(start).inMinutes;
      totalMinutesAll += totalMinutes;

      final graceToUse = remainingGrace.clamp(0, totalMinutes);
      final billable = totalMinutes - graceToUse;

      remainingGrace -= graceToUse;
      graceUsedAll += graceToUse;
      billableMinutesAll += billable;

      start = segmentEnd;
    }

    return PricingStats(
      totalMinutes: totalMinutesAll,
      billableMinutes: billableMinutesAll,
      graceUsedMinutes: graceUsedAll,
      graceRemainingMinutes: remainingGrace < 0 ? 0 : remainingGrace,
    );
  }
}

class PricingStats {
  final int totalMinutes;
  final int billableMinutes;
  final int graceUsedMinutes;
  final int graceRemainingMinutes;

  const PricingStats({
    required this.totalMinutes,
    required this.billableMinutes,
    required this.graceUsedMinutes,
    required this.graceRemainingMinutes,
  });
}