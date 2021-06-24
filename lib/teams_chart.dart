import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class TeamsChart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TeamsChartState();
}

class TeamsChartState extends State<TeamsChart> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        color: const Color(0xff2c4260), //Colors.black45, //
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceAround,
            maxY: 250,
            barTouchData: BarTouchData(
              enabled: false,
              touchTooltipData: BarTouchTooltipData(
                tooltipBgColor: Colors.transparent,
                tooltipPadding: const EdgeInsets.all(0),
                tooltipMargin: 8,
                getTooltipItem: (
                  BarChartGroupData group,
                  int groupIndex,
                  BarChartRodData rod,
                  int rodIndex,
                ) {
                  return BarTooltipItem(
                    rod.y.round().toString(),
                    TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ),
            titlesData: FlTitlesData(
              show: true,
              bottomTitles: SideTitles(
                showTitles: true,
                getTextStyles: (value) => const TextStyle(
                    color: Colors.white, //Color(0xff7589a2),
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
                margin: 20,
                getTitles: (double value) {
                  switch (value.toInt()) {
                    case 0:
                      return 'REDBULL';
                    case 1:
                      return 'MERCEDES';
                    case 2:
                      return 'MCLAREN';
                    case 3:
                      return 'FERRARI';
                    case 4:
                      return 'ALPHA';
                    case 5:
                      return 'ALPINE';
                    case 6:
                      return 'ALPINE';
                    default:
                      return '';
                  }
                },
              ),
              leftTitles: SideTitles(showTitles: false),
            ),
            borderData: FlBorderData(
              show: false,
            ),
            barGroups: [
              BarChartGroupData(
                x: 0,
                barRods: [
                  BarChartRodData(
                      y: 215, colors: [Color(0xFF0600ef), Colors.white])
                ],
                showingTooltipIndicators: [0],
              ),
              BarChartGroupData(
                x: 1,
                barRods: [
                  BarChartRodData(
                      y: 178, colors: [Color(0xFF00d2be), Colors.white])
                ],
                showingTooltipIndicators: [0],
              ),
              BarChartGroupData(
                x: 2,
                barRods: [
                  BarChartRodData(
                      y: 110, colors: [Color(0xFFff9800), Colors.white])
                ],
                showingTooltipIndicators: [0],
              ),
              BarChartGroupData(
                x: 3,
                barRods: [
                  BarChartRodData(
                      y: 94, colors: [Color(0xFFdc0000), Colors.white])
                ],
                showingTooltipIndicators: [0],
              ),
              BarChartGroupData(
                x: 4,
                barRods: [
                  BarChartRodData(
                      y: 45, colors: [Color(0xFF2b4562), Colors.white])
                ],
                showingTooltipIndicators: [0],
              ),
              BarChartGroupData(
                x: 5,
                barRods: [
                  BarChartRodData(
                      y: 40, colors: [Color(0xFF0090ff), Colors.white])
                ],
                showingTooltipIndicators: [0],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
