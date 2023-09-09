import 'package:sqflite/sqflite.dart';
import 'balance_local_data_source.dart';

class BalanceLocalDataSourceImpl extends BalanceLocalDataSource {
  BalanceLocalDataSourceImpl() : super();


  @override
  Future<List<Map<String, dynamic>>> getTransactions({int? limit}) async {
    final Database db = await super.createTransactionsTable();
    final List<Map<String, dynamic>> maps = await db.query('transactions',limit: limit);
    return maps;
  }
}
