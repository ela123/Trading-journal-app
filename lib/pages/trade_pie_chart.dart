import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class TradePieChart extends StatelessWidget {
  final List<Map<String, dynamic>> journalData;

  const TradePieChart({super.key, required this.journalData});

  @override
  Widget build(BuildContext context) {
    final int winCount = journalData.where((e) => e["win"] == true).length;
    final int lossCount = journalData.where((e) => e["fail"] == true).length;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Win vs Loss',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 140,
          width: 140,
          child: PieChart(
            PieChartData(
              sections: [
                PieChartSectionData(
                  value: winCount.toDouble(),
                  color: Colors.green,
                  title: 'Win\n$winCount',
                  radius: 40,
                  titleStyle: const TextStyle(fontSize: 10, color: Colors.white),
                ),
                PieChartSectionData(
                  value: lossCount.toDouble(),
                  color: Colors.red,
                  title: 'Loss\n$lossCount',
                  radius: 40,
                  titleStyle: const TextStyle(fontSize: 10, color: Colors.white),
                ),
              ],
              sectionsSpace: 3,
              centerSpaceRadius: 20,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text("Total Trades: ${journalData.length}"),
      ],
    );
  }
}
