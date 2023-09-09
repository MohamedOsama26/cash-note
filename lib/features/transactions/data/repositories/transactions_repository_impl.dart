import 'package:cash_note/features/transactions/data/models/transaction_model.dart';
import '../../domain/repositories/transactions_repository.dart';
import '../data_source/local/transactions_local_data_source_impl.dart';

class TransactionRepositoryImpl extends TransactionsRepository {
  final TransactionsLocalDataSourceImpl _dataSource =
      TransactionsLocalDataSourceImpl();

  @override
  void addNewTransaction(TransactionModel transaction) {
    _dataSource
        .addNewTransaction(transaction.toJson())
        .then((_) => print('Transaction Added Successfully'))
        .catchError(
            (error) {
              throw Exception('Add Transaction Error : $error');
            });
  }

  @override
  void deleteTransaction(int transactionId) {
    _dataSource
        .deleteTransaction(transactionId)
        .then((_) => print('Transaction Deleted Successfully'))
        .catchError(
            (error) => throw Exception('Delete Transaction Error : $error'));
  }

  @override
  Future<List<TransactionModel>> getAllTransactions() async{
    final List<Map<String,dynamic>> maps = await _dataSource.getAllTransactions();
    final List<TransactionModel> transactions = maps.map((transaction) => TransactionModel.fromJson(transaction)).toList();
    return transactions;
  }
}
