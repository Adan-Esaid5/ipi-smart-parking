import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../theme/app_theme.dart';
import 'pricing.dart';

class ActiveSessionScreen extends StatefulWidget {
  const ActiveSessionScreen({super.key});

  @override
  State<ActiveSessionScreen> createState() => _ActiveSessionScreenState();
}

class _ActiveSessionScreenState extends State<ActiveSessionScreen> {
  late DateTime _entryTime;
  Timer? _timer;

  // דוגמה: חניון מוגרבי
  final PricingRule _pricing = const PricingRule(
    ratePerMinute: 0.50,
    dailyMax: 80.0,
    graceMinutes: 10,
  );

  @override
  void initState() {
    super.initState();

    // כניסה לדוגמה: לפני 42 דקות
    _entryTime = DateTime.now().subtract(const Duration(minutes: 42));

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _formatDuration(Duration d) {
    final h = d.inHours;
    final m = d.inMinutes.remainder(60);
    final s = d.inSeconds.remainder(60);
    String two(int x) => x.toString().padLeft(2, '0');
    return '${two(h)}:${two(m)}:${two(s)}';
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final elapsed = now.difference(_entryTime);

    final amount = _pricing.calculateAmount(_entryTime, now);
    final stats = _pricing.getStats(_entryTime, now);

    return Scaffold(
      appBar: AppBar(title: const Text('Active Parking')),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Active Parking Session',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Timer • Grace minutes • Per-minute pricing (daily cap until midnight)',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppTheme.text2),
            ),
            const SizedBox(height: 16),

            // Parking info
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppTheme.bg,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(Icons.local_parking, color: AppTheme.yellow),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mugrabi Parking (Demo)',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w900,
                                ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Plate: 123-45-678',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppTheme.text2),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.chevron_right, color: AppTheme.text2),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Timer + Amount
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: _Metric(
                        label: 'Elapsed',
                        value: _formatDuration(elapsed),
                        icon: Icons.timer,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: _Metric(
                        label: 'Amount',
                        value: '₪ ${amount.toStringAsFixed(2)}',
                        icon: Icons.payments,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Pricing rules
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _RowInfo(left: 'Rate per minute', right: '₪ ${_pricing.ratePerMinute.toStringAsFixed(2)}'),
                    const SizedBox(height: 10),
                    _RowInfo(left: 'Daily cap (until midnight)', right: '₪ ${_pricing.dailyMax.toStringAsFixed(0)}'),
                    const SizedBox(height: 10),
                    _RowInfo(left: 'Grace at start', right: '${_pricing.graceMinutes} min'),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Grace stats
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _RowInfo(left: 'Total minutes', right: '${stats.totalMinutes} min'),
                    const SizedBox(height: 10),
                    _RowInfo(left: 'Grace used', right: '${stats.graceUsedMinutes} min'),
                    const SizedBox(height: 10),
                    _RowInfo(left: 'Grace remaining', right: '${stats.graceRemainingMinutes} min'),
                    const SizedBox(height: 10),
                    _RowInfo(left: 'Billable minutes', right: '${stats.billableMinutes} min'),
                    if (stats.graceRemainingMinutes > 0) ...[
                      const SizedBox(height: 14),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(
                              color: AppTheme.bg,
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: const Row(
                              children: [
                                Icon(Icons.verified, size: 16, color: AppTheme.yellow),
                                SizedBox(width: 8),
                                Text('Grace active', style: TextStyle(fontWeight: FontWeight.w800)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => context.go('/pelecard'),
                icon: const Icon(Icons.lock),
                label: const Text('Pay & Exit (Pelecard)'),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => context.go('/home'),
                child: const Text('Back to Home'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Metric extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _Metric({required this.label, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: AppTheme.bg,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(icon, color: AppTheme.yellow),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppTheme.text2)),
              const SizedBox(height: 4),
              Text(
                value,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _RowInfo extends StatelessWidget {
  final String left;
  final String right;

  const _RowInfo({required this.left, required this.right});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(left, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppTheme.text2)),
        const Spacer(),
        Text(right, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w800)),
      ],
    );
  }
}