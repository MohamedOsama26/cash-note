import 'package:cash_note/core/utils/app_enum.dart';
import 'package:cash_note/features/statistics/data/models/value_model.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/day_transactions.dart';

class DayTransactionModel extends DayTransactions {
  DayTransactionModel({
    required super.date,
    required super.amount,
    required super.type,
  });

  factory DayTransactionModel.fromJson(Map<String, dynamic> json) {
    return DayTransactionModel(
      date: DateFormat('dd-MM-yyyy').parse(json['transaction_date']),
      amount:(json['amount']).toDouble(),
      type: TransactionType.getType(json['type']),
    );
  }

  // Map<String,dynamic> toJson() {
  //   return {
  //     'transaction_date': date,
  //     'input': input,
  //     'output': output,
  //   };
  //
  // }
}
