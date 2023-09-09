import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../../core/utils/app_sql.dart';

abstract class TransactionsLocalDataSource {
  Future<Database> createTransactionsTable() async {
    final Database database = await openDatabase(
      join(await getDatabasesPath(), 'cash_note_database.db'),
      onCreate: (db, version) => db.execute(AppSql.createTransactionsTable),
      version: 1,
    );
    return database;
  }

  Future<void> addNewTransaction(Map<String, dynamic> transaction);

  Future<List<Map<String, dynamic>>> getAllTransactions();

  Future<void> deleteTransaction(int transactionId);

// Future<void> updateTransaction();
}
