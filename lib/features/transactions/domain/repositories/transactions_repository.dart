import 'package:cash_note/features/transactions/data/models/transaction_model.dart';

abstract class TransactionsRepository{

  void addNewTransaction(TransactionModel transaction);

  Future<List<TransactionModel>> getAllTransactions();

  void deleteTransaction(int transactionId);
}