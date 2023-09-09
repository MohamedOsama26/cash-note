import 'package:cash_note/core/utils/app_enum.dart';
import 'package:cash_note/features/statistics/data/data_sources/local/statistics_data_source_impl.dart';
import 'package:cash_note/features/statistics/data/models/day_transactions_model.dart';
import 'package:cash_note/features/statistics/domain/repositories/statistics_repository.dart';

class StatisticsRepositoryImpl extends StatisticsRepository {
  final StatisticsDataSourceImpl _dataSource = StatisticsDataSourceImpl();

  @override
  Future<List<List<double>>> getWeekTransactions({required DateTime today,}) async {
    final List<List<Map<String, dynamic>>> weekTransactionsMaps =
        await _dataSource.getWeekTransactions(today: today);
    // final List<DayTransactionModel> transactions = weekTransactionsMaps
    //     .map((transaction) => DayTransactionModel.fromJson(transaction))
    //     .toList();
    print('-------------------');
    print(weekTransactionsMaps);
    print('-------------------');
    // date1 =>   now.subtract(Duration(days: now.weekday - 6)
    // date1 =>   now.subtract(Duration(days: now.weekday - 5)
    // date1 =>   now.subtract(Duration(days: now.weekday - 4)
    // date1 =>   now.subtract(Duration(days: now.weekday - 3)
    // date1 =>   now.subtract(Duration(days: now.weekday - 2)
    // date1 =>   now.subtract(Duration(days: now.weekday - 1)
    // date1 =>   now.subtract(Duration(days: now.weekday - 0)

    return [[],[]];
    // print('--$transactions--');
    // List<double> inputs = [];
    // List<double> expenses = [];
    //
    // for(var transaction in transactions){
    //   if(transaction.type == TransactionType.income) {
    //     inputs.add(transaction.amount);
    //   }else {
    //     expenses.add(transaction.amount);
    //   }
    // }
    // print([inputs,expenses]);
    // return [inputs,expenses];
  }
}
