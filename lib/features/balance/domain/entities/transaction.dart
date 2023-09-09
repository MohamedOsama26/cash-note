import 'package:cash_note/core/utils/app_enum.dart';

abstract class Transaction {
  final int? id;
  final TransactionType type;
  final String icon;
  final String title;
  final String subtitle;
  final String transactionDate;
  final String createdDate;
  final double amount;
  final String notes;

  Transaction(
      { this.id,
      required this.icon,
      required this.title,
      required this.subtitle,
      required this.transactionDate,
      required this.createdDate,
      required this.amount,
      required this.notes,
      required this.type});
}
