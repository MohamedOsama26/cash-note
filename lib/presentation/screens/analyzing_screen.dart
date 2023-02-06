import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../logic/model/item_data_model.dart';
import '../../logic/repository/data_repository.dart';
import '../components/drawer.dart';

class AnalyzingScreen extends StatefulWidget {
  const AnalyzingScreen({super.key});

  @override
  _AnalyzingScreenState createState() => _AnalyzingScreenState();
}

class _AnalyzingScreenState extends State<AnalyzingScreen> {
  DataRepository db = DataRepository();
  late TooltipBehavior _tooltipBehavior1,_tooltipBehavior2;
  @override
  void initState() {
    // TODO: implement initState
    _tooltipBehavior1 = TooltipBehavior(enable: true);
    _tooltipBehavior2 = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape:
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(5))
        ),
        title: const Text('Analysis',style: TextStyle(fontSize: 25),),
        backgroundColor: const Color(0xff4f6ef4),
        shadowColor: const Color(0xff4f6ef4),
      ),
      drawer: sideDrawer(context: context),
      body: FutureBuilder(
        future: db.readItems(),
        builder: (BuildContext futureBuilderContext,
            AsyncSnapshot<List<Item>> snapshot) {
          if (snapshot.hasData) {
            List<SalesData> itemsSumIn = [];
            List<SalesData> itemsSumOut = [];
            for (int i = 0; i < snapshot.data!.length; i++) {
              var sum = snapshot.data![i].amount;
              var date = snapshot.data![i].creationDate;
              for (int y = 0; y < snapshot.data!.length; y++) {
                if (snapshot.data![i].creationDate ==
                        snapshot.data![y].creationDate &&
                    i != y) {
                  sum += snapshot.data![y].amount;
                }
              }
              if (snapshot.data![i].type == 'income') {
                itemsSumIn.add(SalesData(date, sum));
              } else {
                itemsSumOut.add(SalesData(date, sum));
              }
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Card(
                  margin: const EdgeInsets.all(10),
                  child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    title: ChartTitle(text: 'Income'),
                    series: <ChartSeries>[
                      LineSeries<SalesData, String>(
                        name: 'Income',
                        color: const Color(0xFF07B100),
                        dataSource: itemsSumIn,
                        xValueMapper: (SalesData sales, _) => sales.month,
                        yValueMapper: (SalesData sales, _) => sales.sales,
                      ),
                    ],
                    tooltipBehavior: _tooltipBehavior1,
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(10),
                  child: SfCartesianChart(
                    title: ChartTitle(
                      text: 'Expense',
                    ),
                    primaryXAxis: CategoryAxis(),
                    series: <ChartSeries>[
                      LineSeries<SalesData, String>(
                        name: 'Expense',
                        color: const Color(0xFFFF0000),
                        dataSource: itemsSumOut,
                        xValueMapper: (SalesData sales, _) => sales.month,
                        yValueMapper: (SalesData sales, _) => sales.sales,
                      )
                    ],
                    tooltipBehavior: _tooltipBehavior2,
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class SalesData {
  SalesData(this.month, this.sales);
  final String month;
  final double? sales;
}
