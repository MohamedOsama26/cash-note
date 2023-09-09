import 'package:cash_note/core/utils/app_enum.dart';

abstract class Value {

  Value({required this.type,required this.amount});

  final double amount;
  final TransactionType type;
}