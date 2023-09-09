import 'package:cash_note/features/statistics/presentation/manager/statistics_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_colors.dart';

class MonthlySavingMoneyChart extends StatelessWidget {
  MonthlySavingMoneyChart({super.key});

  final List<Color> gradientColors = [
    Colors.cyan,
    Colors.blueAccent,
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StatisticsController>(
      init: StatisticsController()..collectWeekTransactions(),
        builder: (logic) {
      return AspectRatio(
        aspectRatio: 1.70,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: LineChart(
            mainData(),
          ),
        ),
      );
    });
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    TextStyle style = TextStyle(
      color: AppColors.onBackgroundColor,
      fontSize: 13,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = RotationTransition(
            turns: AlwaysStoppedAnimation(-30 / 360),
            child: Text('Jan', style: style));
        break;
      case 2:
        text = RotationTransition(
            turns: AlwaysStoppedAnimation(-30 / 360),
            child: Text('Feb', style: style));
        break;
      case 3:
        text = RotationTransition(
            turns: AlwaysStoppedAnimation(-30 / 360),
            child: Text('Mar', style: style));
        break;
      case 4:
        text = RotationTransition(
            turns: AlwaysStoppedAnimation(-30 / 360),
            child: Text('Apr', style: style));
        break;
      case 5:
        text = RotationTransition(
            turns: AlwaysStoppedAnimation(-30 / 360),
            child: Text('May', style: style));
        break;
      case 6:
        text = RotationTransition(
            turns: AlwaysStoppedAnimation(-30 / 360),
            child: Text('Jun', style: style));
        break;
      case 7:
        text = RotationTransition(
            turns: AlwaysStoppedAnimation(-30 / 360),
            child: Text('Jul', style: style));
        break;
      case 8:
        text = RotationTransition(
            turns: AlwaysStoppedAnimation(-30 / 360),
            child: Text('Aug', style: style));
        break;
      case 9:
        text = RotationTransition(
            turns: AlwaysStoppedAnimation(-30 / 360),
            child: Text('Sep', style: style));
        break;

      case 10:
        text = RotationTransition(
            turns: AlwaysStoppedAnimation(-30 / 360),
            child: Text('Oct', style: style));
        break;

      case 11:
        text = RotationTransition(
            turns: AlwaysStoppedAnimation(-30 / 360),
            child: Text('Nov', style: style));
        break;

      case 12:
        text = RotationTransition(
            turns: AlwaysStoppedAnimation(-30 / 360),
            child: Text('Dec', style: style));
        break;
      default:
        text = RotationTransition(
            turns: AlwaysStoppedAnimation(-30 / 360),
            child: Text('', style: style));
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    TextStyle style = TextStyle(
      fontSize: 11,
      color: AppColors.onBackgroundColor,
    );
    int val = value.round();
    String number;


    if (value >= 1000000)
      number = '${val / 1000000}M';
    else if (val >= 1000)
      number = '${val / 1000}K';
    else
      number = val.toString();
    return Text(number, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(show: false),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            // interval: 2,
            reservedSize: 40,
            getTitlesWidget: leftTitleWidgets,
            // reservedSize: 42,
          ),
        ),
      ),
      minY: 0,
      maxX: 12,
      minX: 1,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(1, 2),
            FlSpot(2, 3),
            FlSpot(3, 1000000),
            FlSpot(4, 1200),
            FlSpot(6, 100000),
            FlSpot(10, 1269),
            FlSpot(12, 3)
          ],
          // isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          // isStrokeCapRound: true,
          dotData: FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
