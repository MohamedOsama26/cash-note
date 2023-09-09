import 'package:cash_note/features/statistics/data/models/day_transactions_model.dart';

abstract class StatisticsRepository {
  Future<List<List<double>>> getWeekTransactions({
    required DateTime today,
  });
}

// see all transactions in this week  => input : Date , output : date, value, and type
//sum transactions of each day in current week ( from sunday to saturday )
//return to ui => elements ( day, transactions (value 1 and value 2)
