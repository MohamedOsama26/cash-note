import 'package:cash_note/core/utils/app_enum.dart';
import 'package:cash_note/features/balance/data/repositories/balance_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:collection/collection.dart';

part 'balance_state.dart';

class BalanceCubit extends Cubit<BalanceState> {
  BalanceCubit() : super(BalanceInitial());

  static BalanceCubit get(context) => BlocProvider.of(context);

  final BalanceRepositoryImpl _repo = BalanceRepositoryImpl();

  void balance() {
    _repo.getTransactions().then((trns) {
      double balance = trns.map((transaction) {
        if (transaction.type == TransactionType.income) {
          return transaction.amount;
        } else {
          return (transaction.amount * -1);
        }
      }).sum;
      double todayExpense = trns.map((transaction) {
        if (DateFormat('yyyy-MM-dd').format(DateTime.now()) ==
            DateFormat('yyyy-MM-dd').format(transaction.transactionDate)) {
          if (transaction.type == TransactionType.expense) {
            return transaction.amount;
          } else {
            return 0.0;
          }
        } else {
          return 0.0;
        }
      }).sum;
      double todayIncome = trns.map((transaction) {
        if (DateFormat('yyyy-MM-dd').format(DateTime.now()) ==
            DateFormat('yyyy-MM-dd').format(transaction.transactionDate)) {
          if (transaction.type == TransactionType.income) {
            return transaction.amount;
          } else {
            return 0.0;
          }
        } else {
          return 0.0;
        }
      }).sum;
      emit(BalanceSuccess(
          balance: balance,
          todayIncome: todayIncome,
          todayExpense: todayExpense,
          todayBalance: todayIncome - todayExpense));
    }).catchError((error) {
      emit(BalanceError());
      throw Exception('Balance error : $error');
    });
  }
}
