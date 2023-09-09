import 'package:cash_note/core/utils/app_enum.dart';
import 'package:cash_note/features/transactions/domain/entities/transaction.dart';
import 'package:intl/intl.dart';

class TransactionModel extends Transaction {
  TransactionModel(
      {required String title,
      int? id,
      required String icon,
      required double amount,
      required DateTime createdDate,
      required String subtitle,
      required DateTime transactionDate,
      required String notes,
      required TransactionType type})
      : super(
          title: title,
          id: id,
          type: type,
          icon: icon,
          amount: amount,
          createdDate: createdDate,
          subtitle: subtitle,
          transactionDate: transactionDate,
          notes: notes,
        );

  factory TransactionModel.fromJson(Map<String, dynamic> map) {
    return TransactionModel(
        id: map['id'],
        title: map['title'],
        icon: map['icon'],
        amount: map['amount'],
        createdDate: DateFormat('yyyy-MM-dd hh:mm:ss.sss').parse(map['created_date']),
        subtitle: map['subtitle'],
        transactionDate: DateFormat('dd-MM-yyyy').parse(map['transaction_date']),
        notes: map['notes'],
        type: TransactionType.getType(map['type']));
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'id': id,
      'type': TransactionType.getName(type),
      'icon': icon,
      'amount': amount,
      'created_date': DateFormat('yyyy-MM-dd hh:mm:ss.sss').format(createdDate),
      'subtitle': subtitle,
      'transaction_date': DateFormat('dd-MM-yyyy').format(transactionDate),
      'notes': notes,
    };
  }
}
