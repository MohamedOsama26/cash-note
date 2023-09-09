part of 'transactions_cubit.dart';

abstract class TransactionsState {}

class TransactionsInitial extends TransactionsState {}

class TransactionsLoading extends TransactionsState {}

class TransactionsSuccess extends TransactionsState {
  List<TransactionModel> transactions;

  TransactionsSuccess(this.transactions);
}

class TransactionsError extends TransactionsState {}

class TransactionAdded extends TransactionsState {}

class TransactionDeleted extends TransactionsState {}
