
import 'package:cash_note/features/statistics/data/models/day_transactions_model.dart';
import 'package:cash_note/features/statistics/data/repositories/statistics_repository_impl.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class StatisticsController extends GetxController {
  final StatisticsRepositoryImpl _repo = StatisticsRepositoryImpl();


  List<List<double>> get weekIncomeExpense => _weekIncomeExpenses;

  final List<List<double>> _weekIncomeExpenses = [[]];

  void collectWeekTransactions() {
    DateTime now = DateTime.now();
    final DateTime startedDate = now.subtract(Duration(days: now.weekday));
    final DateTime endDate = now.subtract(Duration(days: now.weekday - 6));

    //
    //                     inputs      outputs
    // transactions    =  [[a,b,c,d],[e,f,g,h]]
    //
    // [a,e] => [transactions[0][0],transactions[1][0]]
    // [b,f] => [transactions[0][1],transactions[1][1]]
    // [c,g] => [transactions[0][2],transactions[1][2]]
    // [d,h] => [transactions[0][3],transactions[1][3]]
    //



    _repo
        .getWeekTransactions(today: now)
        .then((list) {

          _weekIncomeExpenses.add([list[0][0],list[1][0]]);
          _weekIncomeExpenses.add([list[0][1],list[1][1]]);
          _weekIncomeExpenses.add([list[0][2],list[1][2]]);
          _weekIncomeExpenses.add([list[0][3],list[1][3]]);
          _weekIncomeExpenses.add([list[0][4],list[1][4]]);
          _weekIncomeExpenses.add([list[0][5],list[1][5]]);
          _weekIncomeExpenses.add([list[0][6],list[1][6]]);

          print(_weekIncomeExpenses);
      // for(var j = 0; j<=1;j++){
      //   for (var i = 0; i <= 6; i++) {
      //     final DateTime date = now.subtract(Duration(days: now.weekday - i));
      //     double daySum = 0.0;
      //     for (var tr in list[j]) {
      //       if (DateFormat('dd-MM-yyyy').format(date) ==
      //           DateFormat('dd-MM-yyyy').format(tr.date)) {
      //         daySum += tr.amount;
      //       }
      //     }
      //     _weekIncomeExpenses[j].add(daySum);
      //   }
      // }
    });


    update();
  }
}
