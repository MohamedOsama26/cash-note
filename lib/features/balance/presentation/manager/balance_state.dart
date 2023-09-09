part of 'balance_cubit.dart';

abstract class BalanceState {}

class BalanceInitial extends BalanceState {}

class BalanceSuccess extends BalanceState {
  final double balance;
  final double todayExpense;
  final double todayIncome;
  final double todayBalance;

  BalanceSuccess({
    required this.balance,
    required this.todayExpense,
    required this.todayIncome,
    required this.todayBalance,
  });
}

class BalanceError extends BalanceState {}
