import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fm_chart/data/bar_data.dart';

class LineChartScreen extends StatelessWidget {
  LineChartScreen({super.key});

  final List<Color> grdColor = [Colors.green, Colors.blue];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Line Chart')),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: LineChart(
                LineChartData(
                  minX: 0,
                  maxX: 11,
                  minY: 0,
                  maxY: 10,
                  titlesData: FlTitlesData(
                      show: true,
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 22, //bottom space

                          getTitlesWidget: (value, meta) {
                            switch (value.toInt()) {
                              case 2:
                                return const Text('March');
                              case 5:
                                return const Text('May');
                              case 8:
                                return const Text('June');
                            }
                            return const Text('');
                          },
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 60, //left side space

                          getTitlesWidget: (value, meta) {
                            switch (value.toInt()) {
                              case 2:
                                return const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('10k'),
                                );
                              case 4:
                                return const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('20k'),
                                );
                              case 6:
                                return const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('30k'),
                                );
                              case 8:
                                return const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('40k'),
                                );
                            }
                            return const Text('');
                          },
                        ),
                      )),
                  gridData: FlGridData(
                    show: true,
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        // color: Colors.red,
                        strokeWidth: 1,
                      );
                    },
                    drawVerticalLine: true,
                    getDrawingVerticalLine: (value) {
                      return FlLine(
                        // color: Colors.red,
                        strokeWidth: 1,
                      );
                    },
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        const FlSpot(0, 4),
                        const FlSpot(2, 5),
                        const FlSpot(5, 6),
                        const FlSpot(7, 4),
                        const FlSpot(10, 5),
                      ],
                      isCurved: true,
                      gradient: LinearGradient(colors: grdColor),
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                            colors: grdColor
                                .map((e) => e.withOpacity(0.5))
                                .toList()),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 300,
              child: BarChart(
                BarChartData(
                  minY: -20,
                  maxY: 20,
                  groupsSpace: 1,
                  gridData: FlGridData(
                    show: true,
                    drawHorizontalLine: true,
                    drawVerticalLine: true,
                    getDrawingHorizontalLine: (value) => FlLine(strokeWidth: 1),
                    getDrawingVerticalLine: (value) => FlLine(strokeWidth: 1),
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                          reservedSize: 60,
                          showTitles: true,
                          getTitlesWidget: (value, meta) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: value == 0
                                    ? const Text('0')
                                    : Text('${value.toInt()}k'),
                              )),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(
                          interval: Bardata.interval.toDouble(),
                          reservedSize: 60,
                          showTitles: true,
                          getTitlesWidget: (value, meta) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: value == 0
                                    ? const Text('0')
                                    : Text('${value.toInt()}k'),
                              )),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(
                        reservedSize: 40,
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          return Text(Bardata.bardata
                              .firstWhere((element) => element.id == value)
                              .name);
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        reservedSize: 40,
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          return Text(Bardata.bardata
                              .firstWhere((element) => element.id == value)
                              .name);
                        },
                      ),
                    ),
                  ),
                  barGroups: Bardata.bardata
                      .map(
                        (data) => BarChartGroupData(
                          x: data.id,
                          barsSpace: 4,
                          barRods: [
                            BarChartRodData(
                              fromY: 0,
                              toY: data.y,
                              width: 20,
                              color: data.color,
                              borderRadius: data.y > 0
                                  ? const BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5),
                                    )
                                  : const BorderRadius.only(
                                      bottomLeft: Radius.circular(5),
                                      bottomRight: Radius.circular(5),
                                    ),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
