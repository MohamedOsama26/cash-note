import 'package:bloc/bloc.dart';
import 'package:cash_note/features/transactions/data/repositories/transactions_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../transactions/data/models/transaction_model.dart';

part 'transactions_state.dart';

class TransactionsCubit extends Cubit<TransactionsState> {
  TransactionsCubit() : super(TransactionsInitial());

  static TransactionsCubit get(context) =>
      BlocProvider.of<TransactionsCubit>(context);

  final TransactionRepositoryImpl _repo = TransactionRepositoryImpl();

  void transactions() {
    emit(TransactionsLoading());
    _repo.getAllTransactions().then((transactions) {





      transactions.sort((a, b) => (b.transactionDate)
          .compareTo(a.transactionDate));
      emit(TransactionsSuccess(transactions));
    }).catchError((error) {
      emit(TransactionsError());
      throw Exception('Read transactions error : $error');
    });
  }

  void addTransaction(TransactionModel transaction) {
    emit(TransactionsLoading());
    _repo.addNewTransaction(transaction);
    emit(TransactionAdded());
  }

  void deleteTransaction(int id) {
    emit(TransactionsLoading());
    _repo.deleteTransaction(id);
    emit(TransactionDeleted());
  }
}
