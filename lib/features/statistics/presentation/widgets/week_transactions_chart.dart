import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class WeekTransactionsChart extends StatelessWidget {
  const WeekTransactionsChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
      ),
      child: SizedBox(
        height: 220,
        child: BarChart(
          BarChartData(
            borderData: FlBorderData(
              border: const Border(
                bottom: BorderSide(
                  width: 1,
                  color: Colors.white,
                ),
              ),
            ),
            gridData: const FlGridData(
              show: false,
            ),
            barGroups: [
              BarChartGroupData(
                x: 1,
                barRods: [
                  BarChartRodData(
                    toY: 1,
                    width: 8,
                    color: const Color(0xFFFF5454),
                  ),
                  BarChartRodData(
                    toY: 2,
                    width: 8,
                    color: const Color(0xFF6CFF62),
                  ),
                ],
              ),
              BarChartGroupData(x: 2, barRods: [
                BarChartRodData(
                  toY: 2,
                  width: 8,
                  color: const Color(0xFFFF5454),
                ),
                BarChartRodData(
                  toY: 2,
                  width: 8,
                  color: const Color(0xFF6CFF62),
                ),
              ]),
              BarChartGroupData(x: 3, barRods: [
                BarChartRodData(
                  toY: 2,
                  width: 8,
                  color: const Color(0xFFFF5454),
                ),
                BarChartRodData(
                  toY: 2,
                  width: 8,
                  color: const Color(0xFF6CFF62),
                ),
              ]),
              BarChartGroupData(x: 4, barRods: [
                BarChartRodData(
                  toY: 2,
                  width: 8,
                  color: const Color(0xFFFF5454),
                ),
                BarChartRodData(
                  toY: 2,
                  width: 8,
                  color: const Color(0xFF6CFF62),
                ),
              ]),
              BarChartGroupData(
                x: 5,
                barRods: [
                  BarChartRodData(
                    toY: 2,
                    width: 8,
                    color: const Color(0xFFFF5454),
                  ),
                  BarChartRodData(
                    toY: 2,
                    width: 8,
                    color: const Color(0xFF6CFF62),
                  ),
                ],
              ),
              BarChartGroupData(x: 6, barRods: [
                BarChartRodData(
                  toY: 3,
                  width: 8,
                  color: const Color(0xFFFF5454),
                ),
                BarChartRodData(
                  toY: 6,
                  width: 8,
                  color: const Color(0xFF6CFF62),
                ),
              ]),
              BarChartGroupData(x: 7, barRods: [
                BarChartRodData(
                  toY: 1000,
                  width: 8,
                  color: const Color(0xFFFF5454),
                ),
                BarChartRodData(
                  toY: 200,
                  width: 8,
                  color: const Color(0xFF6CFF62),
                ),
              ]),
            ],
            titlesData: FlTitlesData(
              topTitles:
                  AxisTitles(sideTitles: const SideTitles(showTitles: false)),
              bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, t) {
                        switch (value) {
                          case 1:
                            return RotationTransition(
                                turns: const AlwaysStoppedAnimation(-30 / 360),
                                child: Text(
                                  'Sun',
                                  style: TextStyle(
                                      color: AppColors.onBackgroundColor,
                                      height: 2),
                                ));
                          case 2:
                            return RotationTransition(
                                turns: const AlwaysStoppedAnimation(-30 / 360),
                                child: Text(
                                  'Mon',
                                  style: TextStyle(
                                      color: AppColors.onBackgroundColor,
                                      height: 2),
                                ));
                          case 3:
                            return RotationTransition(
                                turns: const AlwaysStoppedAnimation(-30 / 360),
                                child: Text(
                                  'Tue',
                                  style: TextStyle(
                                      color: AppColors.onBackgroundColor,
                                      height: 2),
                                ));
                          case 4:
                            return RotationTransition(
                                turns: const AlwaysStoppedAnimation(-30 / 360),
                                child: Text(
                                  'Wed',
                                  style: TextStyle(
                                      color: AppColors.onBackgroundColor,
                                      height: 2),
                                ));
                          case 5:
                            return RotationTransition(
                                turns: const AlwaysStoppedAnimation(-30 / 360),
                                child: Text(
                                  'Thu',
                                  style: TextStyle(
                                      color: AppColors.onBackgroundColor,
                                      height: 2),
                                ));
                          case 6:
                            return RotationTransition(
                                turns: const AlwaysStoppedAnimation(-30 / 360),
                                child: Text(
                                  'Fri',
                                  style: TextStyle(
                                      color: AppColors.onBackgroundColor,
                                      height: 2),
                                ));
                          case 7:
                            return RotationTransition(
                                turns: const AlwaysStoppedAnimation(-30 / 360),
                                child: Text(
                                  'Sat',
                                  style: TextStyle(
                                      color: AppColors.onBackgroundColor,
                                      height: 2),
                                ));
                        }

                        return const SizedBox();
                      })),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 40,
                  getTitlesWidget: (value, meta) {
                    final String out;
                    if (value >= 1000000) {
                      out = '${value / 1000000}M';
                    } else if (value >= 1000) {
                      out = '${value / 1000}K';
                    } else {
                      out = '$value';
                    }
                    return Text(
                      out,
                      style: TextStyle(color: AppColors.onBackgroundColor),
                    );
                  },
                ),
                // drawBelowEverything: true
              ),
              rightTitles: const AxisTitles(drawBelowEverything: false),
            ),
          ),
        ),
      ),
    );
  }
}



//groups
List<BarChartGroupData> _(List<List<double>> transactions) {

  transactions.map((type){
    return type.map((day) => null).toList();
  }).toList();

  return [
    BarChartGroupData(
      x: 1,
      barRods: [
        BarChartRodData(
          toY: transactions[1][0],
          width: 8,
          color: const Color(0xFFFF5454),
        ),
        BarChartRodData(
          toY: transactions[0][0],
          width: 8,
          color: const Color(0xFF6CFF62),
        ),
      ],
    ),
    BarChartGroupData(
      x: 2,
      barRods: [
        BarChartRodData(
          toY: transactions[0][1],
          width: 8,
          color: const Color(0xFFFF5454),
        ),
        BarChartRodData(
          toY: transactions[1][1],
          width: 8,
          color: const Color(0xFF6CFF62),
        ),
      ],
    ),
    BarChartGroupData(
      x: 3,
      barRods: [
        BarChartRodData(
          toY: transactions[0][2],
          width: 8,
          color: const Color(0xFFFF5454),
        ),
        BarChartRodData(
          toY: transactions[1][2],
          width: 8,
          color: const Color(0xFF6CFF62),
        ),
      ],
    ),
    BarChartGroupData(
      x: 4,
      barRods: [
        BarChartRodData(
          toY: transactions[0][3],
          width: 8,
          color: const Color(0xFFFF5454),
        ),
        BarChartRodData(
          toY: transactions[1][3],
          width: 8,
          color: const Color(0xFF6CFF62),
        ),
      ],
    ),
    BarChartGroupData(
      x: 5,
      barRods: [
        BarChartRodData(
          toY: 2,
          width: 8,
          color: const Color(0xFFFF5454),
        ),
        BarChartRodData(
          toY: 2,
          width: 8,
          color: const Color(0xFF6CFF62),
        ),
      ],
    ),
    BarChartGroupData(
      x: 6,
      barRods: [
        BarChartRodData(
          toY: 3,
          width: 8,
          color: const Color(0xFFFF5454),
        ),
        BarChartRodData(
          toY: 6,
          width: 8,
          color: const Color(0xFF6CFF62),
        ),
      ],
    ),
    BarChartGroupData(
      x: 7,
      barRods: [
        BarChartRodData(
          toY: 1000,
          width: 8,
          color: const Color(0xFFFF5454),
        ),
        BarChartRodData(
          toY: 200,
          width: 8,
          color: const Color(0xFF6CFF62),
        ),
      ],
    ),
  ];
}

//[[ , ,inputs, , ],[ , ,outputs, , ]]
