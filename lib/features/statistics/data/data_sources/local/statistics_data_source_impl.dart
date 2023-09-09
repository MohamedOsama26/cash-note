import 'package:cash_note/features/statistics/data/data_sources/local/statistics_data_source.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

class StatisticsDataSourceImpl extends StatisticsDataSource {

  // @override
  // Future<List<Map<String, dynamic>>> getDayTransactions(
  //     {required DateTime transactionDate}) async {
  //   final String dateFormatted = DateFormat.yMMMMd().format(transactionDate);
  //   final Database db = await super.createTransactionsTable();
  //   final List<Map<String, dynamic>> maps = await db.query('transactions',
  //       where: 'transaction_date = ? ', whereArgs: [dateFormatted]);
  //   return maps;
  // }

  @override
  Future<List<List<Map<String, dynamic>>>> getWeekTransactions({required DateTime today,}) async{
    final List<List<Map<String, dynamic>>> daysTransactions = [];
    final Database db = await super.createTransactionsTable();

    // date1 =>   now.subtract(Duration(days: now.weekday - 6)
    // date2 =>   now.subtract(Duration(days: now.weekday - 5)
    // date3 =>   now.subtract(Duration(days: now.weekday - 4)
    // date4 =>   now.subtract(Duration(days: now.weekday - 3)
    // date5 =>   now.subtract(Duration(days: now.weekday - 2)
    // date6 =>   now.subtract(Duration(days: now.weekday - 1)
    // date7 =>   now.subtract(Duration(days: now.weekday - 0)
    for(int i=0;i<7;i++){
      final String dateFormatted = DateFormat('dd-MM-yyyy').format(today.subtract(Duration(days: today.weekday - i)));
      final List<Map<String, dynamic>> maps = await db.query('transactions',
          where: 'transaction_date = ?', whereArgs: [dateFormatted]);
      daysTransactions.add(maps);
    }

    // final String endDateFormatted = DateFormat('dd-MM-yyyy').format(endDate);

    return daysTransactions;
  }



}
