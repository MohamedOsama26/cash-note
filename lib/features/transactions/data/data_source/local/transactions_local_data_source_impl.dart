import 'package:cash_note/features/transactions/data/data_source/local/transactions_local_data_source.dart';
import 'package:sqflite/sqflite.dart';

class TransactionsLocalDataSourceImpl extends TransactionsLocalDataSource {
  TransactionsLocalDataSourceImpl() : super();

  @override
  Future<void> addNewTransaction(Map<String, dynamic> transaction) async {
    Database db = await super.createTransactionsTable();
    await db.insert('transactions', transaction,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  @override
  Future<void> deleteTransaction(int transactionId) async {
    Database db = await super.createTransactionsTable();
    await db
        .delete('transactions', where: 'id = ?', whereArgs: [transactionId]);
  }

  @override
  Future<List<Map<String, dynamic>>> getAllTransactions() async {
    final Database db = await super.createTransactionsTable();
    final List<Map<String, dynamic>> maps = await db.query('transactions');
    return maps;
  }
}
