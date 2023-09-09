import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../../core/utils/app_sql.dart';

abstract class StatisticsDataSource {

  Future<Database> createTransactionsTable() async {
    final Database database = await openDatabase(
      join(await getDatabasesPath(), 'cash_note_database.db'),
      onCreate: (db, version) => db.execute(AppSql.createTransactionsTable),
      version: 1,
    );
    return database;
  }

  // Future<List<Map<String, dynamic>>> getDayTransactions({required DateTime transactionDate});


  Future<List<List<Map<String, dynamic>>>> getWeekTransactions({required DateTime today,});

}

